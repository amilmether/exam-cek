# CSL-333: DBMS Lab Record

This repository contains the SQL and PL/SQL scripts for the CSL-333 Database Management Systems lab.

## Index of Experiments

1.  [Experiment 1: Faculty Database](#experiment-1-faculty-database)
2.  [Experiment 2: Library Database](#experiment-2-library-database)
3.  [Experiment 3: Student Database](#experiment-3-student-database)
4.  [Experiment 4: Result Database](#experiment-4-result-database)
5.  [Experiment 5: Book Issue Database](#experiment-5-book-issue-database)
6.  [Experiment 6: Bank Database](#experiment-6-bank-database)
7.  [Experiment 7: College DB](#experiment-7-college-db)
8.  [Experiment 8: Even or Odd (PL/SQL)](#experiment-8-even-or-odd)
9.  [Experiment 9: Prime or Composite (PL/SQL)](#experiment-9-prime-or-composite)
10. [Experiment 10: Factorial (PL/SQL)](#experiment-10-factorial)
11. [Experiment 11: Perfect Number (PL/SQL)](#experiment-11-perfect-number)
12. [Experiment 12: Calculator (PL/SQL)](#experiment-12-calculator)
13. [Experiment 13: Age Calculation (Cursor)](#experiment-13-age-calculation)
14. [Experiment 14: Employee Database (Cursor)](#experiment-14-employee-database)
15. [Experiment 15: Rank Determination (PL/SQL)](#experiment-15-rank-determination)
16. [Experiment 16: Employee DB (Trigger)](#experiment-16-employee-db-trigger)
17. [Experiment 17: Salary Database (Trigger)](#experiment-17-salary-database-trigger)
-   [Project Report: Student Database Management System](#project-report-student-database-management-system)

---

## Experiment 1: Faculty Database

### Question

> Create the following two tables:
>
> * **College**: consisting of college-code, college-name, address
> * **Faculty**: consisting of fields College-code, faculty-code, faculty-name, qualification, experience (in no. of years), department, address.
>
> The field college-code is foreign key. Generate Queries for the following.
>
> (a) List all faulty members of a specified college whose experience is greater than or equal to 10 years.
> (b) List all Faculty Members of a specified college who have at least 10 years of experience but not having M.Tech Degree.
> (c) List out the Faculty of a specified college department wise in non decreasing order of their seniority.
> (d) List out the Names of the Colleges having more than a specified number of faculty members.
> (e) List out the names of the colleges having the least number of faculties and the largest number of faculty.

### Answer

```sql
CREATE DATABASE campus;
USE campus;

CREATE TABLE College (
    collegecode VARCHAR (15) PRIMARY KEY,
    collegename VARCHAR(15),
    address VARCHAR(20)
);

CREATE TABLE Faculty (
    collegecode VARCHAR(15),
    facultycode VARCHAR (10) PRIMARY KEY,
    facultyname VARCHAR(20),
    qualification VARCHAR(20),
    experience INT,
    department VARCHAR(20),
    address VARCHAR(20),
    FOREIGN KEY (collegecode) REFERENCES College (collegecode)
);

INSERT INTO College VALUES ("KTE", "RIT, Kottayam", "Vellor P.O, Pampady");
INSERT INTO College VALUES ("GECT", "GEC, Thrissur", "Thiruvanathapuram");
INSERT INTO College VALUES("WYD", "GEC, Wayanad", "Wayanad");

INSERT INTO Faculty VALUES ("KTE", "9087", "Priya", "MTECH", 15, "CSE", "ABCD 686539");
INSERT INTO Faculty VALUES ("KTE", "9987", "Ajith", "BTECH", 6, "CSE", "SDFT 634429");
INSERT INTO Faculty VALUES ("WYD", "8465", "Nitya", "MTECH", 20, "MCA", "DFGJW, 634328");
INSERT INTO Faculty VALUES ("KTE", "9004", "Swathi", "BTECH", 11, "EEE", "HJDJD, 623990");
INSERT INTO Faculty VALUES ("KTE", "8924", "Ajitha", "MTECH", 17, "EEE", "REIFT, 633280");
INSERT INTO Faculty VALUES ("GECT", "8745", "Serah", "MTECH", 28, "MCA", "DFGJWT, 604328");
INSERT INTO Faculty VALUES ("GECT", "8795", "Aswathy", "MTECH", 20, "CE", "DFGJHH, 634308");
INSERT INTO Faculty VALUES ("GECT", "8766", "Arun", "MTECH", 16, "ECE", "DFGJWU, 634358");

/*Query (a) */
SELECT
    F.facultyname, F.facultycode, F.qualification, F.collegecode, F.department
FROM Faculty AS F, College AS C
WHERE F.collegecode = "KTE" AND F.experience >= 10 AND F.collegecode = C.collegecode;

/*Query (b) */
SELECT
    F.facultyname, F.facultycode, F.qualification, F.collegecode, F.department
FROM Faculty AS F, College AS C
WHERE F.collegecode = "KTE" AND F.experience >= 10 AND F.qualification != "MTECH" AND F.collegecode = C.collegecode;

/*Query (c) */
SELECT
    F.facultyname, F.facultycode, F.qualification, F.collegecode, F.department
FROM Faculty AS F, College AS C
WHERE F.collegecode = "KTE" AND F.collegecode = C.collegecode
ORDER BY F.department, F.experience ASC;

/*Query (d) */
SELECT COUNT(*) ,C.collegename
FROM Faculty AS F, College AS C
WHERE F.collegecode = C.collegecode
GROUP BY F.collegecode
HAVING (COUNT(*)>3);

/*Query (e) */
SELECT collegename, MAX(empCount) AS 'empCount'
FROM (
    SELECT C.collegename, F.collegecode, COUNT(*) AS 'empCount'
    FROM Faculty as F, College as C
    WHERE F.collegecode = C.collegecode
    GROUP BY F.collegecode
    ORDER BY empCount DESC
) AS max
UNION
SELECT collegename, MIN (empCount) AS 'empCount'
FROM (
    SELECT C.collegename, F.collegecode, COUNT(*) AS 'empCount'
    FROM Faculty as F, College as C
    WHERE F.collegecode = C.collegecode
    GROUP BY F.collegecode
    ORDER BY empCount ASC
) AS min;

DROP TABLE Faculty;
DROP TABLE College;
DROP DATABASE campus;