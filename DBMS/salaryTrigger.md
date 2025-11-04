CREATE TABLE Employees (
    empid varchar(10) PRIMARY KEY,
    empname VARCHAR(30),
    salary int
);

INSERT INTO Employees VALUES ('71512', 'Joseph', 75000);
INSERT INTO Employees VALUES ('62112', 'George', 56000);
INSERT INTO Employees VALUES ('51912', 'Malavika', 33000);
INSERT INTO Employees VALUES ('81512', 'Rameh', 80000);
INSERT INTO Employees VALUES ('11512', 'Kailas', 55000);

CREATE TABLE Increments (
    empid varchar(10) PRIMARY KEY,
    incr int,
    FOREIGN KEY (empid) references Employees (empid)
);

--creating trigger
CREATE OR REPLACE TRIGGER salary_increment_trigger
AFTER UPDATE OF salary ON Employees
FOR EACH ROW
DECLARE
  diff NUMBER;
BEGIN
  diff := :NEW.salary - :OLD.salary;
  IF diff > 1000 THEN
    INSERT INTO Increments (empid, incr)
    VALUES (:NEW.empid, diff);
  END IF;
END;
/

--updating salary of an employee
update Employees
set salary = 35000
where empid = '51912';

-- check the increments table
select * from Increments;