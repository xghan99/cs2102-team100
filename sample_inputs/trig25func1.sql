/* for test triggers 2 and 5 */
INSERT INTO Users
VALUES ('testemail', 'testusername', 123456);

INSERT INTO Creators
VALUES ('testemail', 'Singapore');

INSERT INTO Employees
VALUES (69, 'john', 3500);

INSERT INTO ProjectTypes
VALUES ('testtype', 69);

INSERT INTO Backers
VALUES ('testemail', 'Aljunied','22','123456','Singapore')

INSERT INTO Projects
VALUES (10,'testemail','testtype','2022-10-20','testname', '2022-12-20', 500)

INSERT INTO Rewards
VALUES ('Silver',10,300)

/*Edit the backing date or the amount to check trigger 2 and 5*/
INSERT INTO BACKS 
VALUES ('testemail','Silver',10,'2022-10-21',null,299)

SELECT * FROM BACKS


/* for testing function 1 */
INSERT INTO Users
VALUES ('backer1@gmail.com', 'backer1', 123456), ('backer2@gmail.com', 'backer2', 123456),('creator1@gmail.com', 'creator1', 123456);

INSERT INTO Creators
VALUES ('creator1@gmail.com', 'Singapore');

INSERT INTO Backers
VALUES ('backer1@gmail.com', 'bukit batok', '22','123456','Singapore'), ('backer2@gmail.com', 'jurong', '22','123456','Singapore');

INSERT INTO Employees
VALUES (672, 'Bob', 3500)

INSERT INTO Verifies
VALUES ('backer1@gmail.com',672,'2022-10-01'), ('backer2@gmail.com',672,'2022-10-01');

INSERT INTO ProjectTypes
VALUES ('food',672),('toys',672),('talent',672)

INSERT INTO Projects
VALUES (1,'creator1@gmail.com','food','2022-10-02','p1','2022-10-25',10),(2,'creator1@gmail.com','toys','2022-10-02','p2','2022-10-25',10),(3,'creator1@gmail.com','talent','2022-10-02','p3','2022-10-25',10),(4,'creator1@gmail.com','food','2022-10-02','p4','2022-10-25',10),(5,'creator1@gmail.com','toys','2022-10-02','p5','2022-10-25',10)

INSERT INTO Rewards
VALUES ('gold',1,10),('gold',2,10),('gold',3,10),('gold',4,10),('gold',5,10)

/* check for condition 1: edit parameters as you see fit */
INSERT INTO Backs
VALUES ('backer1@gmail.com','gold',1,'2022-10-03',null,10),('backer1@gmail.com','gold',2,'2022-10-03',null,10),('backer1@gmail.com','gold',3,'2022-10-03',null,10),('backer1@gmail.com','gold',4,'2022-10-03',null,10),('backer1@gmail.com','gold',5,'2022-10-03',null,10)

/* check for condition 2: edit parameters as you see fit */
INSERT INTO Backs
VALUES('backer2@gmail.com','gold',1,'2022-10-03',null,1500);

SELECT find_superbackers('2022-10-27')
