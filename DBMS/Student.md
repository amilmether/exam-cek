create database college;
use college;

create table course (
    course_id varchar(15) not null primary key,
    name varchar(15),
    fee int,
    duration int
);

create table student (
    roll_no int not null,
    name varchar(20),
    date_of_birth date,
    course_id varchar(15) not null,
    foreign key (course_id) references course (course_id)
);

insert into course values ("1", "B.Tech", 50000,4);
insert into course values ("2", "M.Tech", 80000,2);
insert into course values ("3", "BCA", 60000,3);
insert into course values ("4", "MCA", 45000,2);

insert into student values (22, "Aswathy", "2002-10-21","1");
insert into student values (22, "Aswathy", "2002-10-21","2");
insert into student values (40, "Josmy", "2002-08-30","1");
insert into student values (40, "Josmy", "2002-08-30","2");
insert into student values(40, "Josmy", "2002-08-30","4");
insert into student values (50, "Naveena", "2002-05-26","2");
insert into student values (50, "Naveena", "2002-05-26","3");
insert into student values (50, "Naveena", "2002-05-26","4");
insert into student values (50, "Naveena", "2002-05-26","1");
insert into student values (21, "Aswathi", "2001-05-23","4");
insert into student values (35, "Minu", "2006-08-24","1");

/*Query (a) */
select S.name
from student as S, course as C
where S.course_id= C.course_id and S.course_id = "1" and year(curdate())-year(S.date_of_birth) < 18;

/*Query (b) */
select d.course_id,d.name,d.fee,d.duration
from course as c,course as d
where d.fee > c.fee and c.course_id = "1";

/*Query (c) */
select roll_no, name, date_of_birth
from student
group by roll_no, name, date_of_birth
having count(course_id)>2;

/*Query (d) */
SELECT name, fee, duration, MAX(studentCount) AS 'studentCount'
FROM (
    SELECT C.name, C.fee,C.duration, COUNT(S.course_id) AS 'studentCount'
    FROM student as S, course as C
    where S.course_id = C.course_id
    GROUP BY S.course_id
    ORDER BY studentCount DESC
) AS max
UNION
SELECT name, fee, duration, MIN(studentCount) AS 'studentCount'
FROM (
    SELECT C.name, C.fee,C.duration, COUNT(S.course_id) AS 'studentCount'
    FROM student as S, course as C
    where S.course_id = C.course_id
    GROUP BY S.course_id
    ORDER BY studentCount ASC
) AS min;

/*Query (e) */
select roll_no,name, date_of_birth
from student
group by roll_no, name, date_of_birth
having count(course_id)=4;

drop table student;
drop table course;
drop database college;