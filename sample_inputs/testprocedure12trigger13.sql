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

-- Fire trigger?
--INSERT INTO Users VALUES ('trig@gmail.com', 'trigname', 'cctr', NULL);
--CALL add_user('21@gmail.com', '21name', 'cc21', NULL, '21street', '21num', '21zip', 'SG', 'BOTH');

-- Invalid project
CALL add_project(11, '17@gmail.com', 'testtype', '2021-01-01', 'Project 01', '2022-12-31', 1000, ARRAY[]::TEXT[], ARRAY[]::NUMERIC[]);
CALL add_project(22, '18@gmail.com', 'testtype', '2021-01-01', 'Project 02', '2022-12-31', 1000, ARRAY[]::TEXT[], ARRAY[]::NUMERIC[]);
-- Shouldn't appear on either Projects or Rewards
-- Given assumption is that both arrays are of the same length

-- Add project
CALL add_project(1, '11@gmail.com', 'testtype', '2021-01-01', 'Project 01', '2022-12-31', 1000, ARRAY['Gold', 'Trash'], ARRAY[10, 1]);
CALL add_project(2, '12@gmail.com', 'testtype', '2021-01-01', 'Project 02', '2022-12-31', 1000, ARRAY['Silver', 'Trash'], ARRAY[10, 2]);
CALL add_project(3, '12@gmail.com', 'testtype', '2021-01-01', 'Project 03', '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);

-- Fire trigger?
--INSERT INTO Projects VALUES (0, '10@gmail.com', 'A', '2023-10-23', 'zero_project', '2024-06-30', 50000);
--CALL add_project(4, '13@gmail.com', 'testtype', '2021-01-01', 'Project 04', '2023-12-31', 10000, ARRAY['Gold', 'Silver', 'Trash'], ARRAY[10, 5, 3]);