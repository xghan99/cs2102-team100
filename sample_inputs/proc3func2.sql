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
INSERT INTO Employees VALUES (4, 'Eee', 5000);

-- ProjectTypes Table
INSERT INTO ProjectTypes VALUES ('A', 0);
INSERT INTO ProjectTypes VALUES ('B', 1);
INSERT INTO ProjectTypes VALUES ('C', 2);
INSERT INTO ProjectTypes VALUES ('D', 3);
INSERT INTO ProjectTypes VALUES ('E', 4);


-- Projects Table
INSERT INTO Projects VALUES (0, '11@gmail.com', 'A', '2023-10-23', 'zero_project', '2024-06-30', 50000);
INSERT INTO Projects VALUES (1, '12@gmail.com', 'A', '2023-10-23', 'one_project', '2024-06-30', 10000);
INSERT INTO Projects VALUES (2, '13@gmail.com', 'A', '2023-10-23', 'two_project', '2024-06-30', 30000);

INSERT INTO Projects VALUES (3, '14@gmail.com', 'B', '2023-10-23', 'three_project', '2024-06-30', 50000);
INSERT INTO Projects VALUES (4, '15@gmail.com', 'B', '2023-10-23', 'four_project', '2024-06-30', 10000);
INSERT INTO Projects VALUES (5, '16@gmail.com', 'B', '2023-10-23', 'five_project', '2024-06-30', 30000);

INSERT INTO Projects VALUES (6, '17@gmail.com', 'C', '2023-10-23', 'six_project', '2024-06-30', 50000);
INSERT INTO Projects VALUES (7, '18@gmail.com', 'C', '2023-10-23', 'seven_project', '2024-06-30', 10000);
INSERT INTO Projects VALUES (8, '19@gmail.com', 'C', '2023-10-23', 'eight_project', '2024-06-30', 30000);



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

INSERT INTO Rewards VALUES ('Gold', 3, 10000);
INSERT INTO Rewards VALUES ('Silver', 3, 5000);
INSERT INTO Rewards VALUES ('Bronze', 3, 1000);

INSERT INTO Rewards VALUES ('Gold', 4, 10000);
INSERT INTO Rewards VALUES ('Silver', 4, 5000);
INSERT INTO Rewards VALUES ('Bronze', 4, 1000);

INSERT INTO Rewards VALUES ('Gold', 5, 10000);
INSERT INTO Rewards VALUES ('Silver', 5, 5000);
INSERT INTO Rewards VALUES ('Bronze', 5, 1000);

-- Backs Table - Project A
INSERT INTO Backs VALUES ('01@gmail.com', 'Gold', 0, '2024-01-01', NULL, 20000);
INSERT INTO Backs VALUES ('02@gmail.com', 'Silver', 0, '2024-01-01', NULL, 7500);
INSERT INTO Backs VALUES ('03@gmail.com', 'Bronze', 0, '2024-01-01', NULL, 2500);
INSERT INTO Backs VALUES ('04@gmail.com', 'Gold', 0, '2024-01-01', NULL, 10000);
INSERT INTO Backs VALUES ('05@gmail.com', 'Silver', 0, '2024-01-01', NULL, 7500);
INSERT INTO Backs VALUES ('06@gmail.com', 'Bronze', 0, '2024-01-01', NULL, 2500);
-- Project ID 0, type = A, ratio = 1.0

INSERT INTO Backs VALUES ('04@gmail.com', 'Gold', 1, '2024-01-01', NULL, 20000);
INSERT INTO Backs VALUES ('05@gmail.com', 'Silver', 1, '2024-01-01', NULL, 7500);
INSERT INTO Backs VALUES ('06@gmail.com', 'Bronze', 1, '2024-01-01', NULL, 2500);
-- Project ID 1, type = A, ratio = 3.0 (even though same amount as Project ID 0)

INSERT INTO Backs VALUES ('04@gmail.com', 'Gold', 2, '2024-01-01', NULL, 10000);
INSERT INTO Backs VALUES ('05@gmail.com', 'Silver', 2, '2024-01-01', NULL, 5000);
INSERT INTO Backs VALUES ('06@gmail.com', 'Bronze', 2, '2024-01-01', NULL, 1000);
INSERT INTO Backs VALUES ('07@gmail.com', 'Gold', 2, '2024-01-01', NULL, 10000);
INSERT INTO Backs VALUES ('08@gmail.com', 'Silver', 2, '2024-01-01', NULL, 6000);
INSERT INTO Backs VALUES ('09@gmail.com', 'Bronze', 2, '2024-01-01', NULL, 1000);
INSERT INTO Backs VALUES ('10@gmail.com', 'Bronze', 2, '2024-01-01', NULL, 1000);
-- Project ID 2, type = A, ratio = 1.2 (even though different amount as Project ID 0)



-- Backs Table - Project B
INSERT INTO Backs VALUES ('01@gmail.com', 'Gold', 3, '2024-01-01', '2024-12-31', 20000);    -- Reject
INSERT INTO Backs VALUES ('02@gmail.com', 'Silver', 3, '2024-01-01', '2024-12-31', 7500);   -- Reject
INSERT INTO Backs VALUES ('03@gmail.com', 'Bronze', 3, '2024-01-01', '2024-12-31', 2500);   -- Reject
-- Project ID 3, type = B, ratio = 0.6

INSERT INTO Backs VALUES ('04@gmail.com', 'Gold', 4, '2024-01-01', '2024-12-31', 20000);    -- Reject
INSERT INTO Backs VALUES ('05@gmail.com', 'Silver', 4, '2024-01-01', '2024-12-31', 7500);   -- Reject
INSERT INTO Backs VALUES ('06@gmail.com', 'Bronze', 4, '2024-01-01', '2024-12-31', 2500);   -- Reject
-- Project ID 4, type = B, ratio = 3.0 (even though same amount as Project ID 3)

INSERT INTO Backs VALUES ('07@gmail.com', 'Gold', 5, '2024-01-01', '2024-06-30', 10000);    -- No Reject
INSERT INTO Backs VALUES ('08@gmail.com', 'Silver', 5, '2024-01-01', '2024-06-30', 6000);   -- No Reject
INSERT INTO Backs VALUES ('09@gmail.com', 'Bronze', 5, '2024-01-01', '2024-06-30', 1000);   -- No Reject
INSERT INTO Backs VALUES ('10@gmail.com', 'Bronze', 5, '2024-01-01', '2024-06-30', 1000);   -- No Reject
-- Project ID 5, type = B, ratio = 0.6 (even though different amount as Project ID 3)

-- SELECT * FROM find_top_success(3, '2025-01-01', 'A') should return in the following order of pid: 1, 2, 0 
-- SELECT * FROM find_top_success(3, '2025-01-01', 'B') should return in the following order of pid: 4 (the other 2 do not meet funding goals)

-- CALL auto_reject(3, '2023-10-23') should reject all refund request on the lower 10 insertion