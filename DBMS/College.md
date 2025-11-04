CREATE DATABASE EXPT;
USE EXPT;

CREATE TABLE STU_DET(
    stname varchar(50),
    stroll int,
    utyreg varchar(20) primary key,
    addr varchar(50),
    adm_year int,
    pass_year int,
    branch varchar(30),
    cl_teach varchar(50),
    e_mail varchar(50),
    phno varchar(15)
);

CREATE TABLE QUALIF (
    utyreg varchar(20),
    total int,
    grade varchar(15),
    year varchar(5),
    CONSTRAINT f1 FOREIGN KEY (utyreg) REFERENCES STU_DET (utyreg) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PROJECT(
    utyreg varchar(20),
    title varchar(100),
    guide varchar(50),
    period int,
    core varchar(40),
    CONSTRAINT F2 FOREIGN KEY (utyreg) REFERENCES STU_DET (utyreg) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE FACULTY (
    fac_name varchar (50),
    fac_id varchar(20) primary key,
    email varchar(50),
    desig varchar(30),
    joindate date,
    reldate date
);

INSERT INTO STU_DET VALUES
('Reade', 1, 'KTE59XX70', '72025 Sherman Parkway', 2020, 2024, 'EEE', 'Aswin', 'rblumer0@mapy.cz', '7044958412'),
('Gracia', 2, 'KTE96XX57', '9723 Buhler Crossing', 2020, 2024, 'CSE', 'Amalia', 'gcruftsl@mlb.com', '6059232571'),
('Larine', 3, 'KTE99XX66', '57 Anderson Park', 2017, 2021, 'MEC', 'Arya', 'lduffill2@histats.com', '9301870105'),
('Cyrill', 4, 'KTE05XX60', '8 Forest Circle', 2017, 2021, 'CIV', 'Hrishikesh', 'cdemaid3@imageshack.us', '6098931285'),
('Alberto', 5, 'KTE84XX84', '65863 Stephen Pass', 2017, 2021, 'MEC', 'Arya', 'amacmychem4@domainmarket.com', '7478791342'),
('Rowland', 6, 'KTE78XX78', '1954 Lerdahl Junction', 2017, 2021, 'CSE', 'Shaju', 'rkimmitt5@google.co.jp', '6436096352'),
('Querida', 7, 'KTE97XX42', '75 Mayer Hill', 2017, 2021, 'CSE', 'Shaju', 'qboyles6@dedecms.com', '7259647900'),
('Cortney', 8, 'KTE33XX46', '72058 Farragut Junction', 2017, 2021, 'EEE', 'Abru', 'ckelbie7@simplemachines.org', '8767658796'),
('Wendell', 9, 'KTE08XX56', '5452 Clarendon Lane', 2018, 2022, 'ECE', 'Aswin', 'wsandever8@studiopress.com', '8376102289'),
('Ruggiero', 10, 'KTE08XX40', '2050 Quincy Park', 2018, 2022, 'ECE', 'Aswin', 'rdionisio9@a8.net', '9047797177'),
('Othelia', 11, 'KTE22XX47', '94542 Russell Court', 2019, 2023, 'MEC', 'Hrishikesh', 'olidyarda@guardian.co.uk', '8771090635'),
('Evanne', 12, 'KTE32XX50', '7 Reindahl Avenue', 2017, 2021, 'CIV', 'Hrishikesh', 'echarnickb@cdbaby.com', '8917709000'),
('Werner', 13, 'KTE67XX12', '477 Banding Point', 2017, 2021, 'MEC', 'Arya', 'wfargiec@uol.com.br', '6222432090'),
('Rickie', 14, 'KTE94XX98', '4974 Clarendon Court', 2018, 2022, 'CSE', 'Amalia', 'ralessandruccid@bluehost.com', '6431856826'),
('Joell', 15, 'KTE84XX57', '609 Lawn Drive', 2020, 2024, 'EEE', 'Aswin', 'jrobroee@adobe.com', '6280780207'),
('Percival', 16, 'KTE52XX11', '6 Vahlen Hill', 2018, 2022, 'ECE', 'Aswin', 'pcruttendenf@cmu.edu', '9673248954'),
('Kara-lynn', 17, 'KTE63XX38', '8 Delaware Park', 2018, 2022, 'CSE', 'Amalia', 'kquiltyg@amazon.com', '8107687778'),
('Matty', 18, 'KTE30XX07', '173 Cherokee Court', 2020, 2024, 'CIV', 'Arya', 'mmeiningerh@51.la', '7379857870'),
('Cristi', 19, 'KTE99XX47', '582 Reinke Pass', 2018, 2022, 'CSE', 'Amalia', 'cscholeyi@blinklist.com', '9571826511'),
('Orel', 20, 'KTE64XX48', '54 Heath Center', 2020, 2024, 'CIV', 'Arya', 'osharpj@over-blog.com', '9903333410');

INSERT INTO QUALIF VALUES
('KTE59XX70', 76, 'secondClass', 2021),
('KTE59XX70', 87, 'firstClass', 2022),
('KTE59XX70', 79, 'secondClass', 2023),
('KTE59XX70', 76, 'secondClass', 2024),
('KTE96XX57', 98, 'distinct', 2021),
('KTE96XX57', 99, 'distinct', 2022),
('KTE96XX57', 77, 'secondClass', 2023),
('KTE96XX57', 85, 'firstClass', 2024),
('KTE99XX66', 75, 'secondClass', 2018),
('KTE99XX66', 99, 'distinct', 2019),
('KTE99XX66', 82, 'firstClass', 2020),
('KTE99XX66', 94, 'distinct', 2021),
('KTE05XX60', 80, 'secondClass', 2018),
('KTE05XX60', 81, 'firstClass', 2019),
('KTE05XX60', 92, 'distinct', 2020),
('KTE05XX60', 97, 'distinct', 2021),
('KTE84XX84', 96, 'distinct', 2018),
('KTE84XX84', 77, 'secondClass', 2019),
('KTE84XX84', 97, 'distinct', 2020),
('KTE84XX84', 83, 'firstClass', 2021),
('KTE78XX78', 86, 'firstClass', 2018),
('KTE78XX78', 81, 'firstClass', 2019),
('KTE78XX78', 90, 'firstClass', 2020),
('KTE78XX78', 92, 'distinct', 2021),
('KTE97XX42', 81, 'firstClass', 2018),
('KTE97XX42', 96, 'distinct', 2019),
('KTE97XX42', 92, 'distinct', 2020),
('KTE97XX42', 92, 'distinct', 2021),
('KTE33XX46', 80, 'secondClass', 2018),
('KTE33XX46', 88, 'firstClass', 2019),
('KTE33XX46', 85, 'firstClass', 2020),
('KTE33XX46', 79, 'secondClass', 2021),
('KTE08XX56', 84, 'firstClass', 2019),
('KTE08XX56', 90, 'firstClass', 2020),
('KTE08XX56', 90, 'firstClass', 2021),
('KTE08XX56', 90, 'firstClass', 2022),
('KTE08XX40', 80, 'secondClass', 2019),
('KTE08XX40', 75, 'secondClass', 2020),
('KTE08XX40', 78, 'secondClass', 2021),
('KTE08XX40', 95, 'distinct', 2022),
('KTE22XX47', 87, 'firstClass', 2020),
('KTE22XX47', 84, 'firstClass', 2021),
('KTE22XX47', 97, 'distinct', 2022),
('KTE22XX47', 80, 'secondClass', 2023),
('KTE32XX50', 77, 'secondClass', 2018),
('KTE32XX50', 77, 'secondClass', 2019),
('KTE32XX50', 85, 'firstClass', 2020),
('KTE32XX50', 87, 'firstClass', 2021),
('KTE67XX12', 97, 'distinct', 2018),
('KTE67XX12', 99, 'distinct', 2019),
('KTE67XX12', 91, 'distinct', 2020),
('KTE67XX12', 75, 'secondClass', 2021),
('KTE94XX98', 95, 'distinct', 2019),
('KTE94XX98', 100, 'distinct', 2020),
('KTE94XX98', 84, 'firstClass', 2021),
('KTE94XX98', 100, 'distinct', 2022),
('KTE84XX57', 79, 'secondClass', 2021),
('KTE84XX57', 88, 'firstClass', 2022),
('KTE84XX57', 87, 'firstClass', 2023),
('KTE84XX57', 92, 'distinct', 2024),
('KTE52XX11', 92, 'distinct', 2019),
('KTE52XX11', 80, 'secondClass', 2020),
('KTE52XX11', 87, 'firstClass', 2021),
('KTE52XX11', 80, 'secondClass', 2022),
('KTE63XX38', 81, 'firstClass', 2019),
('KTE63XX38', 80, 'secondClass', 2020),
('KTE63XX38', 97, 'distinct', 2021),
('KTE63XX38', 80, 'secondClass', 2022),
('KTE30XX07', 94, 'distinct', 2021),
('KTE30XX07', 86, 'firstClass', 2022),
('KTE30XX07', 75, 'secondClass', 2023),
('KTE30XX07', 96, 'distinct', 2024),
('KTE99XX47', 86, 'firstClass', 2019),
('KTE99XX47', 96, 'distinct', 2020),
('KTE99XX47', 80, 'secondClass', 2021),
('KTE99XX47', 97, 'distinct', 2022),
('KTE64XX48', 96, 'distinct', 2021),
('KTE64XX48', 91, 'distinct', 2022),
('KTE64XX48', 94, 'distinct', 2023),
('KTE64XX48', 86, 'firstClass', 2024);

INSERT INTO PROJECT VALUES ('KTE59XX70', 'edu.stanford.Daltfresh', 'Aswin', 2, 'ECE');
INSERT INTO PROJECT VALUES ('KTE96XX57', 'org.pbs.Toughjoyfax', 'Hrishikesh', 3, 'CIV');
INSERT INTO PROJECT VALUES ('KTE99XX66', 'com.chronoengine.Matsoft', 'Arya', 3, 'MEC');
INSERT INTO PROJECT VALUES ('KTE05XX60', 'org.npr.Kanlam', 'Amalia', 2, 'CSE');
INSERT INTO PROJECT VALUES ('KTE84XX84', 'gov.census.Flowdesk', 'Amalia', 1, 'CSE');
INSERT INTO PROJECT VALUES ('KTE78XX78', 'com.springer.Quo Lux', 'Shaju', 3, 'CSE');
INSERT INTO PROJECT VALUES ('KTE97XX42', 'com.deviantart.Kanlam', 'Arya', 2, 'CIV');
INSERT INTO PROJECT VALUES ('KTE33XX46', 'br.com.uol.Job', 'Aswin', 1, 'ECE');
INSERT INTO PROJECT VALUES ('KTE08XX56', 'com.msn.Regrant', 'Arya', 1, 'CIV');
INSERT INTO PROJECT VALUES ('KTE08XX40', 'com.friendfeed.Greenlam', 'Arya', 2, 'MEC');
INSERT INTO PROJECT VALUES ('KTE22XX47', 'jp.co.yahoo.Span', 'Amalia', 1, 'CSE');
INSERT INTO PROJECT VALUES ('KTE32XX50', 'com.printfriendly.Quo Lux', 'Hrishikesh', 3, 'MEC');
INSERT INTO PROJECT VALUES ('KTE67XX12', 'com.blogtalkradio.Tampflex', 'Arya', 3, 'CIV');
INSERT INTO PROJECT VALUES ('KTE94XX98', 'jp.co.yahoo.Daltfresh', 'Hrishikesh', 1, 'CIV');
INSERT INTO PROJECT VALUES ('KTE84XX57', 'edu.wisc.Namfix', 'Aswin', 3, 'ECE');
INSERT INTO PROJECT VALUES ('KTE52XX11', 'org.wikipedia.Tresom', 'Hrishikesh', 2, 'CIV');
INSERT INTO PROJECT VALUES ('KTE63XX38', 'jp.co.amazon.Latlux', 'Arya', 2, 'MEC');
INSERT INTO PROJECT VALUES ('KTE30XX07', 'com.forbes.Matsoft', 'Arya', 2, 'CIV');
INSERT INTO PROJECT VALUES ('KTE99XX47', 'com.deviantart.Fintone', 'Aswin', 1, 'EEE');
INSERT INTO PROJECT VALUES ('KTE64XX48', 'org.unicef.Kanlam', 'Abru', 3, 'EEE');

INSERT INTO FACULTY VALUES ('Abru', 'KTF52YY80', 'solenane0@example.com', 'Prof', '2022-05-01', '2022-10-22');
INSERT INTO FACULTY VALUES ('Arya', 'KTF45YY93', 'jlivenl@posterous.com', 'Prof', '2021-07-24', '2022-07-13');
INSERT INTO FACULTY VALUES ('Hrishikesh', 'KTF85YY58', 'efeldmesser2@chicagotribune.com', 'Prof', '2020-09-03', null);
INSERT INTO FACULTY VALUES ('Aswin', 'KTF11YY19', 'ecantos3@walmart.com', 'Ad_Hoc', '2018-01-14', null);
INSERT INTO FACULTY VALUES ('Amalia', 'KTF37YY55', 'marling4@toplist.cz', 'Asst_Prof', '2021-08-30', '2022-09-23');
INSERT INTO FACULTY VALUES ('Shaju', 'KTF40YY60', 'clyle5@reddit.com', 'Asst_Prof', '2018-08-17', null);

/* Query (b) i */
SELECT stname, stroll,addr, pass_year as Year_of_Completion, 'CSE' as Branch
FROM STU_DET
WHERE branch = 'CSE'
ORDER BY pass_year;

/* Query (b) ii */
SELECT stname, stroll, pass_year as Year_of_Completion, branch
FROM STU_DET
WHERE pass_year IS NOT NULL
ORDER BY branch, pass_year;

/* Query (b) iii */
SELECT stname as name, stroll as rollno, P.*
FROM PROJECT P, STU_DET S
WHERE P.utyreg = S.utyreg AND branch LIKE 'CIV';

/* Query (b) iv */
SELECT pass_year as Year_of_Project, COUNT(title) as No_of_Experiments, guide
FROM PROJECT P, STU_DET S
WHERE P.utyreg = S.utyreg
GROUP BY pass_year, guide
HAVING COUNT(title) > 2;

/* Query (b) v */
CREATE VIEW PRE_RES AS
SELECT Q.*, branch, stname, stroll
FROM QUALIF Q, STU_DET S
WHERE S.utyreg = Q.utyreg
ORDER BY year;

CREATE VIEW TAKE AS
SELECT AVG(total) as Ac_Avg, year, branch
FROM PRE_RES
GROUP BY branch, year
ORDER BY year, Ac_Avg desc;

SELECT MAX(Ac_Avg) as Greatest_Average, year, branch
FROM TAKE
GROUP BY year
ORDER BY year;

/* Query (b) vi */
CREATE VIEW HIGHEST AS
SELECT DISTINCT stname, stroll,S.utyreg, branch,cl_teach,e_mail, MAX(total) AS Highest_Score, year
FROM STU_DET S, QUALIF Q
WHERE S.utyreg = Q.utyreg
GROUP BY year, branch
ORDER BY year, branch;

SELECT * FROM HIGHEST;

/* Query (b) vii */
SELECT stname, grade, year
FROM PRE_RES
WHERE grade LIKE 'distinct' AND year LIKE '2022';

/* Query (b) viii */
SELECT title, guide, email, pass_year,core
FROM PROJECT P, FACULTY F, STU_DET S
WHERE guide=fac_name AND core LIKE 'CSE' AND P.utyreg = S.utyreg
ORDER BY pass_year;

/* Query (b) ix */
SELECT adm_year, branch, COUNT(grade) AS Total_Grade
FROM STU_DET S, QUALIF Q
WHERE S.utyreg = Q.utyreg
GROUP BY adm_year, branch
ORDER BY adm_year, branch;

/* Query (b) x */
SELECT *
FROM STU_DET
WHERE adm_year = 2017
ORDER BY branch;

/* Query (b) xi */
SELECT *
FROM STU_DET
ORDER BY adm_year, branch;

/* Query (b) xii */
SELECT branch, year, MAX(total) AS MAXIMUM, MIN(total) AS MINIMUM, AVG(total) AS AVERAGE
FROM PRE_RES
GROUP BY year, branch
ORDER BY year, branch;

DROP VIEW PRE_RES;
DROP VIEW TAKE;
DROP VIEW HIGHEST;
DROP TABLE FACULTY;
DROP TABLE PROJECT;
DROP TABLE QUALIF;
DROP TABLE STU_DET;
DROP DATABASE EXPT;