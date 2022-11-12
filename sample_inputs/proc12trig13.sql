INSERT INTO Employees
VALUES (69, 'john', 3500);

INSERT INTO ProjectTypes
VALUES ('testtype', 69);

-- Invalid role
CALL add_user('no1@gmail.com', '01name', 'cc01', NULL, '01street', '01num', '01zip', 'SG', 'backend');
CALL add_user('no2@gmail.com', '01name', 'cc01', NULL, '01street', '01num', '01zip', 'SG', 'BOTH?');
-- Shouldn't appear on either Users, Backers, or Creators

-- Add user
CALL add_user('01@gmail.com', '01name', 'cc01', NULL, '01street', '01num', '01zip', 'SG', 'BACKER');
CALL add_user('02@gmail.com', '02name', 'cc02', NULL, '02street', '02num', '02zip', 'SG', 'BACKER');
CALL add_user('03@gmail.com', '03name', 'cc03', NULL, '03street', '03num', '03zip', 'SG', 'BACKER');
CALL add_user('04@gmail.com', '04name', 'cc04', NULL, '04street', '04num', '04zip', 'SG', 'BACKER');
CALL add_user('05@gmail.com', '05name', 'cc05', NULL, '05street', '05num', '05zip', 'SG', 'BACKER');
CALL add_user('06@gmail.com', '06name', 'cc06', NULL, '06street', '06num', '06zip', 'SG', 'BACKER');
CALL add_user('07@gmail.com', '07name', 'cc07', NULL, '07street', '07num', '07zip', 'SG', 'BACKER');
CALL add_user('08@gmail.com', '08name', 'cc08', NULL, '08street', '08num', '08zip', 'SG', 'BACKER');
CALL add_user('09@gmail.com', '09name', 'cc09', NULL, '09street', '09num', '09zip', 'SG', 'BACKER');
CALL add_user('10@gmail.com', '10name', 'cc10', NULL, '10street', '10num', '10zip', 'SG', 'CREATOR');
CALL add_user('11@gmail.com', '11name', 'cc11', NULL, '11street', '11num', '11zip', 'SG', 'CREATOR');
CALL add_user('12@gmail.com', '12name', 'cc12', NULL, '12street', '12num', '12zip', 'SG', 'CREATOR');
CALL add_user('13@gmail.com', '13name', 'cc13', NULL, '13street', '13num', '13zip', 'SG', 'CREATOR');
CALL add_user('14@gmail.com', '14name', 'cc14', NULL, '14street', '14num', '14zip', 'SG', 'CREATOR');
CALL add_user('15@gmail.com', '15name', 'cc15', NULL, '15street', '15num', '15zip', 'SG', 'CREATOR');
CALL add_user('16@gmail.com', '16name', 'cc16', NULL, '16street', '16num', '16zip', 'SG', 'CREATOR');
CALL add_user('17@gmail.com', '17name', 'cc17', NULL, '17street', '17num', '17zip', 'SG', 'BOTH');
CALL add_user('18@gmail.com', '18name', 'cc18', NULL, '18street', '18num', '18zip', 'SG', 'BOTH');
CALL add_user('19@gmail.com', '19name', 'cc19', NULL, '19street', '19num', '19zip', 'SG', 'BOTH');
CALL add_user('20@gmail.com', '20name', 'cc20', NULL, '20street', '20num', '20zip', 'SG', 'BOTH');

-- Test Trigger 1
INSERT INTO Users VALUES ('trig@gmail.com', 'trigname', 'cctr', NULL);
-- unsuccessful, must add trigname to Backers and/or Creators as well
CALL add_user('21@gmail.com', '21name', 'cc21', NULL, '21street', '21num', '21zip', 'SG', 'BOTH');
-- works

SELECT * FROM Users;

-- Invalid project
CALL add_project(11, '17@gmail.com', 'testtype', '2021-01-01', 'Project 01', '2022-12-31', 1000, ARRAY[]::TEXT[], ARRAY[]::NUMERIC[]);
CALL add_project(22, '18@gmail.com', 'testtype', '2021-01-01', 'Project 02', '2022-12-31', 1000, ARRAY[]::TEXT[], ARRAY[]::NUMERIC[]);
-- Shouldn't appear on either Projects or Rewards
-- Given assumption is that both arrays are of the same length

-- Add project
CALL add_project(1, '11@gmail.com', 'testtype', '2021-01-01', 'Project 01', '2022-12-31', 1000, ARRAY['Gold', 'Trash'], ARRAY[10, 1]);
CALL add_project(2, '12@gmail.com', 'testtype', '2021-01-01', 'Project 02', '2022-12-31', 1000, ARRAY['Silver', 'Trash'], ARRAY[10, 2]);
CALL add_project(3, '12@gmail.com', 'testtype', '2021-01-01', 'Project 03', '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);

-- Test Trigger 3
INSERT INTO Projects VALUES (0, '10@gmail.com', 'testtype', '2023-10-23', 'trig_project', '2024-06-30', 50000);
-- unsuccessful, must add reward level to project 0
CALL add_project(4, '13@gmail.com', 'testtype', '2021-01-01', 'Project 04', '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);
-- works

SELECT * FROM Projects;

-- Test invalid inputs - should fail as a whole
CALL add_user(NULL, '22name', 'cc22', NULL, '22street', '22num', '22zip', 'SG', 'BOTH');
CALL add_user('23@gmail.com', NULL, 'cc23', NULL, '23street', '23num', '23zip', 'SG', 'BOTH');
CALL add_user('24@gmail.com', '24name', NULL, NULL, '24street', '24num', '24zip', 'SG', 'BOTH');
CALL add_user('25@gmail.com', '25name', 'cc25', NULL, NULL, '25num', '25zip', 'SG', 'BOTH');
CALL add_user('26@gmail.com', '26name', 'cc26', NULL, '26street', NULL, '26zip', 'SG', 'BOTH');
CALL add_user('27@gmail.com', '27name', 'cc27', NULL, '27street', '27num', NULL, 'SG', 'BOTH');
CALL add_user('28@gmail.com', '28name', 'cc28', NULL, '28street', '28num', '28zip', NULL, 'BOTH');
CALL add_user('29@gmail.com', '29name', 'cc29', NULL, '29street', '29num', '29zip', 'SG', NULL);

CALL add_project("6", '12@gmail.com', 'testtype', '2021-01-01', 'Project 06', '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);
CALL add_project(NULL, '12@gmail.com', 'testtype', '2021-01-01', 'Project 06', '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);
CALL add_project(7, NULL, 'testtype', '2021-01-01', 'Project 07', '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);
CALL add_project(8, '12@gmail.com', NULL, '2021-01-01', 'Project 08', '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);
CALL add_project(9, '12@gmail.com', 'testtype', NULL, 'Project 09', '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);
CALL add_project(10, '12@gmail.com', 'testtype', '2021-01-01', NULL, '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);
CALL add_project(11, '12@gmail.com', 'testtype', '2021-01-01', 'Project 11', NULL, 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);
CALL add_project(12, '12@gmail.com', 'testtype', '2021-01-01', 'Project 12', '2023-12-31', NULL, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);
CALL add_project(13, '12@gmail.com', 'testtype', '2021-01-01', 'Project 13', '2023-12-31', -10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);
CALL add_project(14, '12@gmail.com', 'testtype', '2021-01-01', 'Project 14', '2023-12-31', 10000, ARRAY['Gold', NULL, 'Trash'], ARRAY[10, 5, 3]);
CALL add_project(15, '12@gmail.com', 'testtype', '2021-01-01', 'Project 15', '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[-10, 5, 3]);

SELECT * FROM Users;
SELECT * FROM Projects;
SELECT * FROM Creators;
SELECT * FROM Backers;
SELECT * FROM Rewards;