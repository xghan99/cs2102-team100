/* ----- TRIGGERS     ----- */


/* ------------------------ */





/* ----- PROECEDURES  ----- */
/* Procedure #1 */
CREATE OR REPLACE PROCEDURE add_user(
  email TEXT, name    TEXT, cc1  TEXT,
  cc2   TEXT, street  TEXT, num  TEXT,
  zip   TEXT, country TEXT, kind TEXT
) AS $$
-- add declaration here
BEGIN
  -- your code here
END;
$$ LANGUAGE plpgsql;



/* Procedure #2 */
CREATE OR REPLACE PROCEDURE add_project(
  id      INT,     email TEXT,   ptype    TEXT,
  created DATE,    name  TEXT,   deadline DATE,
  goal    NUMERIC, names TEXT[],
  amounts NUMERIC[]
) AS $$
-- add declaration here
BEGIN
  -- your code here
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
-- add declaration here
BEGIN
  -- your code here
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
CREATE OR REPLACE FUNCTION find_top_popular(
  n INT, today DATE, ptype TEXT
) RETURNS TABLE(id INT, name TEXT, email TEXT,
                days INT) AS $$
-- add declaration here
BEGIN
  -- your code here
END;
$$ LANGUAGE plpgsql;
/* ------------------------ */
