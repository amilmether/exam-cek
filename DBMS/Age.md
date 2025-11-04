CREATE TABLE PERSON (
    PID int,
    P_name varchar(15),
    DOB date
);

INSERT INTO PERSON (PID, P_name, DOB) VALUES (1, 'Aswathy', '26-05-2002');
INSERT INTO PERSON (PID, P_name, DOB) VALUES (2, 'Amalu', '16-09-2000');
INSERT INTO PERSON (PID, P_name, DOB) VALUES (3, 'Jerry', '10-10-1999');
INSERT INTO PERSON (PID, P_name, DOB) VALUES (4, 'Nandhu', '06-09-2001');
INSERT INTO PERSON (PID, P_name, DOB) VALUES (5, 'Abhi', '17-03-2001');
INSERT INTO PERSON (PID, P_name, DOB) VALUES (6, 'Ansa', '22-05-2001');
INSERT INTO PERSON (PID, P_name, DOB) VALUES (7, 'Julie', '03-10-2002');
INSERT INTO PERSON (PID, P_name, DOB) VALUES (8, 'Arya', '03-06-2002');
INSERT INTO PERSON (PID, P_name, DOB) VALUES (9, 'Manu', '29-01-2001');
INSERT INTO PERSON (PID, P_name, DOB) VALUES (10, 'Annie', '21-07-2001');

SELECT * FROM PERSON;
/

DECLARE
  name_ PERSON.P_name%TYPE;
  age int;
  CURSOR Age IS
    SELECT P_name, TRUNC(MONTHS_BETWEEN(sysdate, DOB) / 12) age FROM PERSON;
BEGIN
  OPEN Age;
  LOOP
    FETCH Age INTO name_, age;
    EXIT WHEN Age%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(name_ || ' is ' || age || ' years old');
  END LOOP;
  CLOSE Age;
END;
/