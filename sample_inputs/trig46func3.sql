-- Users Table
INSERT INTO Users VALUES ('01@gmail.com', '01name', 'cc01', NULL);
INSERT INTO Users VALUES ('02@gmail.com', '02name', 'cc02', NULL);
INSERT INTO Users VALUES ('03@gmail.com', '03name', 'cc03', NULL);
INSERT INTO Users VALUES ('04@gmail.com', '04name', 'cc04', NULL);
INSERT INTO Users VALUES ('05@gmail.com', '05name', 'cc05', NULL);
INSERT INTO Users VALUES ('06@gmail.com', '06name', 'cc06', NULL);
INSERT INTO Users VALUES ('07@gmail.com', '07name', 'cc07', NULL);
INSERT INTO Users VALUES ('08@gmail.com', '08name', 'cc08', NULL);
INSERT INTO Users VALUES ('09@gmail.com', '09name', 'cc09', NULL);
INSERT INTO Users VALUES ('10@gmail.com', '10name', 'cc10', NULL);
INSERT INTO Users VALUES ('11@gmail.com', '11name', 'cc11', NULL);
INSERT INTO Users VALUES ('12@gmail.com', '12name', 'cc12', NULL);
INSERT INTO Users VALUES ('13@gmail.com', '13name', 'cc13', NULL);
INSERT INTO Users VALUES ('14@gmail.com', '14name', 'cc14', NULL);
INSERT INTO Users VALUES ('15@gmail.com', '15name', 'cc15', NULL);
INSERT INTO Users VALUES ('16@gmail.com', '16name', 'cc16', NULL);
INSERT INTO Users VALUES ('17@gmail.com', '17name', 'cc17', NULL);
INSERT INTO Users VALUES ('18@gmail.com', '18name', 'cc18', NULL);
INSERT INTO Users VALUES ('19@gmail.com', '19name', 'cc19', NULL);
INSERT INTO Users VALUES ('20@gmail.com', '20name', 'cc20', NULL);

-- Backers Table
INSERT INTO Backers VALUES ('01@gmail.com', '01street', '01num', '01zip', 'SG');
INSERT INTO Backers VALUES ('02@gmail.com', '02street', '02num', '02zip', 'SG');
INSERT INTO Backers VALUES ('03@gmail.com', '03street', '03num', '03zip', 'SG');
INSERT INTO Backers VALUES ('04@gmail.com', '04street', '04num', '04zip', 'SG');
INSERT INTO Backers VALUES ('05@gmail.com', '05street', '05num', '05zip', 'SG');
INSERT INTO Backers VALUES ('06@gmail.com', '06street', '06num', '06zip', 'SG');
INSERT INTO Backers VALUES ('07@gmail.com', '07street', '07num', '07zip', 'SG');
INSERT INTO Backers VALUES ('08@gmail.com', '08street', '08num', '08zip', 'SG');
INSERT INTO Backers VALUES ('09@gmail.com', '09street', '09num', '09zip', 'SG');
INSERT INTO Backers VALUES ('10@gmail.com', '10street', '10num', '10zip', 'SG');

-- Creators Table
INSERT INTO Creators VALUES ('11@gmail.com', 'SG');
INSERT INTO Creators VALUES ('12@gmail.com', 'SG');
INSERT INTO Creators VALUES ('13@gmail.com', 'SG');
INSERT INTO Creators VALUES ('14@gmail.com', 'SG');
INSERT INTO Creators VALUES ('15@gmail.com', 'SG');
INSERT INTO Creators VALUES ('16@gmail.com', 'SG');
INSERT INTO Creators VALUES ('17@gmail.com', 'SG');
INSERT INTO Creators VALUES ('18@gmail.com', 'SG');
INSERT INTO Creators VALUES ('19@gmail.com', 'SG');
INSERT INTO Creators VALUES ('20@gmail.com', 'SG');

-- Employees Table
INSERT INTO Employees VALUES (0, 'Alex', 1000);
INSERT INTO Employees VALUES (1, 'Bob', 2000);
INSERT INTO Employees VALUES (2, 'Can', 3000);
INSERT INTO Employees VALUES (3, 'Drew', 4000);
INSERT INTO Employees VALUES (4, 'Edwin', 5000);

-- ProjectTypes Table
INSERT INTO ProjectTypes VALUES ('A', 0);
INSERT INTO ProjectTypes VALUES ('B', 1);
INSERT INTO ProjectTypes VALUES ('C', 2);
INSERT INTO ProjectTypes VALUES ('D', 3);
INSERT INTO ProjectTypes VALUES ('E', 4);


-- Projects Table
INSERT INTO Projects VALUES (0, '11@gmail.com', 'A', '2022-01-01', 'zero_project', '2023-01-01', 50000);
INSERT INTO Projects VALUES (1, '12@gmail.com', 'A', '2022-01-15', 'one_project', '2023-01-15', 40000);
INSERT INTO Projects VALUES (2, '13@gmail.com', 'A', '2022-02-01', 'two_project', '2023-02-01', 30000);

-- Rewards Table
INSERT INTO Rewards VALUES ('Gold', 0, 10000);
INSERT INTO Rewards VALUES ('Silver', 0, 5000);
INSERT INTO Rewards VALUES ('Bronze', 0, 1000);

INSERT INTO Rewards VALUES ('Gold', 1, 10000);
INSERT INTO Rewards VALUES ('Silver', 1, 5000);
INSERT INTO Rewards VALUES ('Bronze', 1, 1000);

INSERT INTO Rewards VALUES ('Gold', 2, 10000);
INSERT INTO Rewards VALUES ('Silver', 2, 5000);
INSERT INTO Rewards VALUES ('Bronze', 2, 1000);


-- Backs Table
-- Project 0
INSERT INTO Backs VALUES ('01@gmail.com', 'Gold', 0, '2022-01-15', NULL, 20000);  -- 20000
INSERT INTO Backs VALUES ('02@gmail.com', 'Silver', 0, '2022-02-01', NULL, 7500); -- 27500
INSERT INTO Backs VALUES ('03@gmail.com', 'Bronze', 0, '2022-02-15', NULL, 2500); -- 30000

-- Trigger 6 Test 
UPDATE Backs SET request = '2022-12-01' WHERE email = '03@gmail.com'; -- failure expected; project is not successful yet (funding not met)


INSERT INTO Backs VALUES ('04@gmail.com', 'Gold', 0, '2022-03-01', NULL, 10000);  -- 40000
INSERT INTO Backs VALUES ('05@gmail.com', 'Silver', 0, '2022-03-15', NULL, 5000); -- 45000
INSERT INTO Backs VALUES ('06@gmail.com', 'Bronze', 0, '2022-04-01', NULL, 4000); -- 49000
INSERT INTO Backs VALUES ('07@gmail.com', 'Gold', 0, '2022-04-15', NULL, 10000);  -- 59000: exceeds goal of 50000 at 104 days
INSERT INTO Backs VALUES ('08@gmail.com', 'Silver', 0, '2022-05-01', NULL, 5000); -- 64000

UPDATE Backs SET request = '2022-12-01' WHERE email = '08@gmail.com' AND id = 0; -- failure expected; project is not successful yet (deadline not passed)
UPDATE Backs SET request = '2022-01-01' WHERE email = '08@gmail.com' AND id = 0; -- failure expected; project is not successful yet (deadline not passed)
UPDATE Backs SET request = '2023-01-02' WHERE email = '08@gmail.com' AND id = 0; -- success expected; project is successful (funding met and deadline passed +1 day)

INSERT INTO Backs VALUES ('09@gmail.com', 'Bronze', 0, '2022-05-15', NULL, 1000); -- 65000
INSERT INTO Backs VALUES ('10@gmail.com', 'Gold', 0, '2022-06-01', NULL, 20000);  -- 85000

-- Trigger 6 Test 
UPDATE Backs SET request = '2023-04-01' WHERE email = '09@gmail.com' AND id = 0; -- success expected; project is successful (funding met and deadline passed + 90 days)
UPDATE Backs SET request = '2023-04-02' WHERE email = '10@gmail.com' AND id = 0; -- success expected; project is successful (funding met and deadline passed + 91 days)

-- Project 1
INSERT INTO Backs VALUES ('02@gmail.com', 'Silver', 1, '2022-02-01', NULL, 5000); -- 5000
INSERT INTO Backs VALUES ('03@gmail.com', 'Bronze', 1, '2022-02-15', NULL, 1500); -- 6500
INSERT INTO Backs VALUES ('04@gmail.com', 'Gold', 1, '2022-03-01', NULL, 12500);  -- 19000
INSERT INTO Backs VALUES ('05@gmail.com', 'Silver', 1, '2022-03-15', NULL, 6000); -- 25000
INSERT INTO Backs VALUES ('06@gmail.com', 'Bronze', 1, '2022-04-01', NULL, 2000); -- 27000
INSERT INTO Backs VALUES ('07@gmail.com', 'Gold', 1, '2022-04-15', NULL, 10000);  -- 37000
INSERT INTO Backs VALUES ('08@gmail.com', 'Silver', 1, '2022-05-01', NULL, 5500); -- 42500: exceeds goal of 40000 at 106 days

-- Trigger 6 Test 
UPDATE Backs SET request = '2023-04-15' WHERE email = '09@gmail.com' AND id = 1; -- success expected; project is successful (funding met and deadline passed + 90 days)

INSERT INTO Backs VALUES ('09@gmail.com', 'Bronze', 1, '2022-05-15', NULL, 4000); -- 46500
INSERT INTO Backs VALUES ('10@gmail.com', 'Gold', 1, '2022-06-01', NULL, 20000);  -- 66500
INSERT INTO Backs VALUES ('01@gmail.com', 'Gold', 1, '2022-06-15', NULL, 20000);  -- 86500

-- Project 2
INSERT INTO Backs VALUES ('03@gmail.com', 'Bronze', 2, '2022-02-15', NULL, 4000); -- 4000
INSERT INTO Backs VALUES ('04@gmail.com', 'Gold', 2, '2022-03-01', NULL, 20000);  -- 24000
INSERT INTO Backs VALUES ('05@gmail.com', 'Silver', 2, '2022-03-15', NULL, 5000); -- 29000
INSERT INTO Backs VALUES ('06@gmail.com', 'Bronze', 2, '2022-04-01', NULL, 4000); -- 33000: exceeds goal of 30000 at 59 days
INSERT INTO Backs VALUES ('07@gmail.com', 'Gold', 2, '2022-04-15', NULL, 10000);  -- 43000
INSERT INTO Backs VALUES ('08@gmail.com', 'Silver', 2, '2022-05-01', NULL, 5000); -- 48000
INSERT INTO Backs VALUES ('09@gmail.com', 'Bronze', 2, '2022-05-15', NULL, 3000); -- 51000
INSERT INTO Backs VALUES ('10@gmail.com', 'Gold', 2, '2022-06-01', NULL, 10000);  -- 61000
INSERT INTO Backs VALUES ('01@gmail.com', 'Gold', 2, '2022-06-15', NULL, 10000);  -- 71000
INSERT INTO Backs VALUES ('02@gmail.com', 'Silver', 2, '2022-07-01', NULL, 6000); -- 77000


-- Refunds Table
-- Trigger 4 Test
INSERT INTO Refunds VALUES ('01@gmail.com', 0, 0, '2024-01-01', TRUE);  -- no refund request; refund accept unsuccessful
INSERT INTO Refunds VALUES ('01@gmail.com', 0, 0, '2024-01-01', FALSE); -- no refund request; refund reject unsuccessful
INSERT INTO Refunds VALUES ('10@gmail.com', 0, 0, '2024-01-01', TRUE);  -- 91 days past deadline; refund accept unsuccessful
INSERT INTO Refunds VALUES ('10@gmail.com', 0, 0, '2024-01-01', FALSE); -- 91 days past deadline; refund reject successful
INSERT INTO Refunds VALUES ('09@gmail.com', 0, 0, '2024-01-01', TRUE);  -- 90 days past deadline; refund accept successful
INSERT INTO Refunds VALUES ('09@gmail.com', 1, 0, '2024-01-01', FALSE); -- 90 days past deadline; refund reject successful


-- Function 3 Test
SELECT * FROM find_top_popular(3, '2026-01-01', 'A');
-- expected result: 
--  id |     name     |    email     | days 
-- ----+--------------+--------------+------
--   1 | one_project  | 12@gmail.com |  106
--   0 | zero_project | 11@gmail.com |  104
--   2 | two_project  | 13@gmail.com |   59
--
-- (top three popular projects sorted in descending order of days and ascending order of id)

SELECT * FROM find_top_popular(2, '2026-01-01', 'A');
-- expected result: 
--  id |     name     |    email     | days 
-- ----+--------------+--------------+------
--   0 | zero_project | 11@gmail.com |  104
--   2 | two_project  | 13@gmail.com |   59
--
-- (top two popular projects sorted in descending order of days and ascending order of id)

SELECT * FROM find_top_popular(3, '2022-01-01', 'A');
-- expected result: 
--  id | name | email | days 
-- ----+------+-------+------
--
-- (No projects created before 2022-01-01)

SELECT * FROM find_top_popular(3, '2022-01-16', 'A');
-- expected result: 
--  id |     name     |    email     | days 
-- ----+--------------+--------------+------
--   1 | one_project  | 12@gmail.com |  106
--   0 | zero_project | 11@gmail.com |  104
--
-- (Project 0 and Project 1 created before 2022-01-16)

SELECT * FROM find_top_popular(3, '2026-01-01', 'B');
-- expected result: 
--  id | name | email | days 
-- ----+------+-------+------
--
-- (No projects of type B)

SELECT * FROM find_top_popular(0, '2026-01-01', 'A');
-- expected result: 
--  id | name | email | days 
-- ----+------+-------+------
--
-- (Top 0 projects shown)