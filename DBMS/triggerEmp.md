CREATE TABLE Employee (
    empid int PRIMARY KEY,
    empname VARCHAR(50),
    designation VARCHAR(50),
    dept VARCHAR(50),
    salary int
);

set serveroutput on

CREATE OR REPLACE TRIGGER employee_trig
BEFORE INSERT OR DELETE OR UPDATE ON Employee
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM Employee;
  DBMS_OUTPUT.PUT_LINE('Number of tuples in Employee relation: ' || v_count);
END;
/

-- Test the trigger
INSERT INTO Employee VALUES (22, 'Aswathy S', 'Team Lead', 'AI', 10000);