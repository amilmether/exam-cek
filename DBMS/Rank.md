CREATE TABLE STUDENT (
    roll int primary key,
    name varchar2(30),
    sub1 int,
    sub2 int,
    sub3 int,
    total int,
    rank int
);

set serveroutput on
DECLARE
  CURSOR DETAILS IS
    SELECT roll, name, total, rank() over (order by total desc) as rank
    FROM STUDENT;
  stud DETAILS%rowtype;
BEGIN
  insert into STUDENT (roll, name, sub1, sub2, sub3, total) values (1, 'Melodee Corbishley', 28, 81, 16, 125);
  insert into STUDENT (roll, name, sub1, sub2, sub3, total) values (2, 'Mike Thurner', 86, 36, 54, 176);
  insert into STUDENT (roll, name, sub1, sub2, sub3, total) values (3, 'Nydia Tonry', 32, 80, 71, 183);
  insert into STUDENT (roll, name, sub1, sub2, sub3, total) values (4, 'Pearle Piddock', 16, 54, 31, 101);
  insert into STUDENT (roll, name, sub1, sub2, sub3, total) values (5, 'Lennard Fishly', 39, 100, 18, 157);
  insert into STUDENT (roll, name, sub1, sub2, sub3, total) values (6, 'Rosita Ionesco', 79, 91, 16, 186);
  insert into STUDENT (roll, name, sub1, sub2, sub3, total) values (7, 'Terrie Denness', 81, 59, 21, 161);
  insert into STUDENT (roll, name, sub1, sub2, sub3, total) values (8, 'Prentiss Leale', 4, 32, 18, 54);
  insert into STUDENT (roll, name, sub1, sub2, sub3, total) values (9, 'Torrey Iacopo', 44, 92, 81, 217);
  insert into STUDENT (roll, name, sub1, sub2, sub3, total) values (10, 'Wrennie Crotch', 84, 98, 66, 248);

  OPEN DETAILS;
  LOOP
    FETCH DETAILS INTO stud;
    EXIT WHEN DETAILS%NOTFOUND;
    UPDATE STUDENT SET rank = stud.rank where roll = stud.roll;
  END LOOP;
  CLOSE DETAILS;
END;
/

SELECT * FROM STUDENT ORDER BY student.rank;