/* ----- TRIGGERS     ----- */

/* Trigger 1 */
CREATE OR REPLACE FUNCTION check_user()
RETURNS TRIGGER AS $$
BEGIN
  IF ((SELECT COUNT(*)
    FROM Users
    WHERE
      email NOT IN (SELECT email FROM Backers) AND
      email NOT IN (SELECT email FROM Creators)
    ) > 0) THEN
  RAISE EXCEPTION 'There exists a user who is neither a backer nor a creator';
  ELSE
  RETURN NEW;
  END IF;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER block_user
BEFORE INSERT ON Users
FOR EACH ROW EXECUTE FUNCTION check_user();


/* Trigger 2 */
CREATE OR REPLACE FUNCTION check_amount()
RETURNS TRIGGER AS $$
BEGIN
  IF (NEW.amount < (SELECT min_amt FROM Rewards WHERE name = NEW.name AND id = NEW.id)) THEN
  RETURN NULL;
  ELSE
  RETURN NEW;
  END IF;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER block_pledge
BEFORE INSERT ON Backs
FOR EACH ROW EXECUTE FUNCTION check_amount();


/* Trigger 3 */
CREATE OR REPLACE FUNCTION check_project()
RETURNS TRIGGER AS $$
BEGIN
  IF ((SELECT COUNT(*)
    FROM Projects
    WHERE id NOT IN (SELECT id FROM Rewards)) > 0) THEN
  RAISE EXCEPTION 'There exists a project without any reward levels';
  ELSE
  RETURN NEW;
  END IF;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER block_project
BEFORE INSERT ON Projects
FOR EACH ROW EXECUTE FUNCTION check_project();


/* Trigger 4 */
CREATE OR REPLACE FUNCTION check_deadline()
RETURNS TRIGGER AS $$
DECLARE
  r RECORD;
BEGIN
  SELECT *
    INTO r
    FROM Backs, Projects 
      WHERE Backs.id = Projects.id
      AND New.email = Backs.email AND New.pid = Backs.id;
  IF (r.request IS NULL) THEN
    RETURN NULL;
  ELSIF (New.accepted = TRUE AND 90 < r.request - r.deadline) THEN
    RETURN NULL;
  ELSE
    RETURN NEW;
  END IF;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER block_approval
BEFORE INSERT ON Refunds
FOR EACH ROW EXECUTE FUNCTION check_deadline();


/* Trigger 5 */
CREATE OR REPLACE FUNCTION check_backing_date()
RETURNS TRIGGER AS $$
BEGIN
  IF (NEW.backing <= (SELECT deadline FROM Projects WHERE id = NEW.id) AND NEW.backing > (SELECT created FROM Projects WHERE id = NEW.id)) THEN
  RETURN NEW;
  ELSE
  RETURN NULL;
  END IF;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER bef_deadline
BEFORE INSERT ON Backs
FOR EACH ROW EXECUTE FUNCTION check_backing_date();


/* Trigger 6 */
CREATE OR REPLACE FUNCTION check_request()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT (SUM(B.amount) >= P.goal) IS NOT NULL AND (SUM(B.amount) >= P.goal) IS TRUE
    FROM Projects P, Backs B
    WHERE B.id = P.id
      AND P.id = New.id
      AND New.request > P.deadline
    GROUP BY P.id) THEN
    RETURN NEW;
  ELSE
    RETURN NULL;
  END IF;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER block_request
BEFORE UPDATE ON Backs
FOR EACH ROW EXECUTE FUNCTION check_request();

/* ------------------------ */




/* ----- PROECEDURES  ----- */

/* Procedure #1 */
CREATE OR REPLACE PROCEDURE add_user(
  email TEXT, name    TEXT, cc1  TEXT,
  cc2   TEXT, street  TEXT, num  TEXT,
  zip   TEXT, country TEXT, kind TEXT
) AS $$
BEGIN
  IF kind = 'BACKER' THEN
    INSERT INTO Users VALUES (email, name, cc1, cc2);
    INSERT INTO Backers VALUES (email, street, num, zip, country);
  ELSEIF kind = 'CREATOR' THEN
    INSERT INTO Users VALUES (email, name, cc1, cc2);
    INSERT INTO Creators VALUES (email, country);
  ELSEIF kind = 'BOTH' THEN
    INSERT INTO Users VALUES (email, name, cc1, cc2);
    INSERT INTO Backers VALUES (email, street, num, zip, country);
    INSERT INTO Creators VALUES (email, country);
  END IF;
END;
$$ LANGUAGE plpgsql;


/* Procedure #2 */
CREATE OR REPLACE PROCEDURE add_project(
  id      INT,     email TEXT,   ptype    TEXT,
  created DATE,    name  TEXT,   deadline DATE,
  goal    NUMERIC, names TEXT[],
  amounts NUMERIC[]
) AS $$
BEGIN
  IF ((SELECT COUNT(*) FROM UNNEST(names, amounts)) > 0) THEN
    INSERT INTO Projects
      VALUES (id, email, ptype, created, name, deadline, goal);
    INSERT INTO Rewards
      (SELECT r.n, id, r.a FROM UNNEST(names, amounts) AS r(n, a));
  END IF;
END;
$$ LANGUAGE plpgsql;


/* Procedure #3 */
CREATE OR REPLACE PROCEDURE auto_reject(
  eid INT, today DATE
) AS $$
DECLARE
  curs CURSOR FOR (SELECT b.email AS email, b.id AS pid
                    FROM Backs b JOIN Projects p 
                      ON b.id = p.id
                    WHERE b.request IS NOT NULL                         -- have requested refund
                      AND (b.email, b.id) NOT IN (SELECT email, pid 
                                                  FROM Refunds)         -- no approval or rejection yet
                      AND b.request > p.deadline + INTERVAL '90 day');  -- date of the request is > 90 days from deadline
  r RECORD;
BEGIN
  OPEN curs;
  LOOP
    FETCH curs INTO r;
    EXIT WHEN NOT FOUND;
    INSERT INTO Refunds VALUES (r.email, r.pid, eid, today, False);
  END LOOP;
  CLOSE curs;
END;
$$ LANGUAGE plpgsql;

/* ------------------------ */




/* ----- FUNCTIONS    ----- */

/* Function #1  */
CREATE OR REPLACE FUNCTION find_superbackers(
  today DATE
) RETURNS TABLE(email TEXT, name TEXT) AS $$
BEGIN
  RETURN QUERY
  WITH successful_projs AS
  (SELECT p.id
  FROM Projects p, Backs b
  WHERE p.id = b.id AND deadline<today AND deadline>=today-30
  GROUP BY p.id
  HAVING SUM(b.amount)>=p.goal),
  superbackers AS
  (SELECT r.email
  FROM Backers r
  WHERE (SELECT COUNT(id) FROM Backs b WHERE b.email = r.email AND id in (SELECT * FROM successful_projs)) >= 5 AND (SELECT COUNT(DISTINCT p.ptype) FROM Projects p, Backs b WHERE p.id = b.id AND b.email = r.email AND
  p.id in (SELECT * FROM successful_projs))>=3 AND EXISTS (SELECT 1 FROM Verifies v WHERE v.email = r.email AND verified<=today)
  UNION
  SELECT r.email
  FROM Backers r
  WHERE (SELECT SUM(amount) FROM Backs b WHERE b.email = r.email AND id in (SELECT * FROM successful_projs)) >= 1500 AND EXISTS
  (SELECT 1 FROM Verifies v WHERE v.email = r.email AND verified <=today) AND NOT EXISTS (SELECT 1 FROM Backs b WHERE b.email = r.email AND b.request>=today-30 AND b.request <= today))
  SELECT u.email, u.name
  FROM Users u
  WHERE EXISTS (SELECT 1 FROM superbackers s WHERE s.email = u.email)
  ORDER BY u.email;
END;
$$ LANGUAGE plpgsql;


/* Function #2  */
CREATE OR REPLACE FUNCTION find_top_success(
  n INT, today DATE, projectType TEXT
) RETURNS TABLE(id INT, name TEXT, email TEXT,
                amount NUMERIC) AS $$
  SELECT p.id, p.name, p.email, SUM(b.amount) AS amt
  FROM Projects p, Backs b
    WHERE p.id = b.id
      AND p.ptype = projectType
      AND p.deadline < today
    GROUP BY p.id
    HAVING SUM(b.amount) >= p.goal
    ORDER BY SUM(b.amount)/p.goal DESC, p.deadline DESC, p.id ASC
    LIMIT n;
$$ LANGUAGE sql;


/* Function #3  */
CREATE OR REPLACE FUNCTION projects_with_days()
RETURNS TABLE(id INT, name TEXT, type TEXT, email TEXT, created DATE, days INT) AS $$
DECLARE
  curs CURSOR FOR (
    SELECT P.id, P.email, P.ptype, P.created, P.name, goal, backing, amount
    FROM Projects P, Backs B
    WHERE P.id = B.id
    ORDER BY P.id, B.backing
  );
  r RECORD; prev_id INT; cum_sum INT; added BOOLEAN;
BEGIN
  prev_id = -1; cum_sum = 0; added = FALSE; OPEN curs;
  LOOP
    FETCH curs INTO r;
    EXIT WHEN NOT FOUND;
    IF (r.id <> prev_id) THEN
      prev_id := r.id; cum_sum := 0; added := FALSE;
    END IF;
    IF (added = FALSE) THEN
      cum_sum := cum_sum + r.amount;
      IF (cum_sum >= r.goal) THEN
        id := prev_id; name := r.name; type := r.ptype; email := r.email; created := r.created; days := r.backing - r.created;
        added := TRUE;
        RETURN NEXT;
      END IF;
    END IF;
  END LOOP;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION find_top_popular(
  n INT, today DATE, ptype TEXT
) RETURNS TABLE(id INT, name TEXT, email TEXT,
                days INT) AS $$
BEGIN
  RETURN QUERY
  SELECT P.id, P.name, P.email, P.days
  FROM projects_with_days() as P
  WHERE P.created < today
    AND P.type = ptype
  ORDER BY days, P.id -- technically not necessary but for correctness of definition
  LIMIT n;
END;
$$ LANGUAGE plpgsql;

/* ------------------------ */
