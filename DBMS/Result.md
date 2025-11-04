create database Student_details;
use Student_details;

create table student (
    rollno int not null primary key,
    name varchar(30),
    category varchar(10),
    district varchar(20),
    state varchar(20)
);

create table student_rank(
    rollno int not null,
    mark int,
    erank int,
    foreign key (rollno) references student (rollno)
);

INSERT INTO student (rollno, name, category, district, state)
VALUES
(001, 'Hrithik', 'OBC', 'Ballari', 'Karnataka'),
(002, 'Himanshi', 'OBC', 'Chitradurga', 'Karnataka'),
(003, 'Angel', 'SC', 'Bangalore', 'Karnataka'),
(004, 'Harris', 'GENERAL', 'Tumkur', 'Karnataka'),
(005, 'Fathima', 'GENERAL', 'Raichur', 'Karnataka'),
(006, 'Meena', 'OBC', 'Bagalkot', 'Karnataka'),
(007, 'Glory', 'SC', 'Ballari', 'Karnataka'),
(008, 'Ann Mary', 'SC', 'Ernakulam', 'Kerala'),
(009, 'Ancilla', 'GENERAL', 'Kottayam', 'Kerala'),
(010, 'Alex', 'SC', 'Ernakulam', 'Kerala'),
(011, 'Aadhil', 'GENERAL', 'Malappuram', 'Kerala'),
(012, 'Sana', 'GENERAL', 'Kozhikode', 'Kerala'),
(013, 'Aravind', 'OBC', 'Thrissur', 'Kerala'),
(014, 'Gayathri', 'OBC', 'Kollam', 'Kerala'),
(015, 'Aleena', 'GENERAL', 'Ernakulam', 'Kerala');

INSERT INTO student_rank (rollno, mark, erank)
VALUES
(001,256,15),
(002,392,54),
(003,473,3),
(004,402,7),
(005,305,13),
(006,406,54),
(007,419,6),
(008,389,46),
(009,498,1),
(010,473,2),
(011,387,10),
(012,434,4),
(013,285,14),
(014,344,12),
(015,389,46);

/*Query (a) */
create view Temp1
as
select *
from student
natural join student_rank;

select *
from Temp1;

select S1.*
from Temp1 as S1, Temp1 as S2
where S1.category = S2.category and S1.erank = S2.erank and S1.rollno != S2.rollno
ORDER BY S1.category, S1.erank;

/*Query(b)*/
select s.rollno,s.name,s.category,s.district,s.state, min(t.erank) as 'minrank'
from student as s, student_rank as t
where s.rollno = t.rollno
group by s.state,s.category
order by minrank ASC;

/*Query (c) */
create table T_Status(
    Status varchar(30)
);

insert into T_Status values
("same mark different rank"),
("same rank different mark");

create view same_mark as
select distinct s.name as Student_1,s.erank as Rank_1,s.mark as Mark_1, Status
from Temp1 as s, Temp1 as t, T_Status
where s.mark = t.mark and s.erank != t.erank and Status="same mark different rank"
order by s.mark;

create view same_rank as
select distinct s.name as Student_1,s.erank as Rank_1,s.mark as Mark_1, Status
from Temp1 as s, Temp1 as t, T_Status
where s.erank = t.erank and s.mark != t.mark and Status="same rank different mark"
order by s.erank;

select * from same_mark
union
select * from same_rank;

drop view same_mark;
drop view same_rank;

/*Query (d) */
select category, max(avgac) as 'avgac'
from(select s.category, avg(t.mark) as 'avgac'
    from student as s, student_rank as t
    where s.rollno = t.rollno
    group by s.category
    order by avgac DESC) as maxm
UNION
select category, min(avgac) as 'avgac'
from(select s.category,avg(t.mark) as 'avgac'
    from student as s, student_rank as t
    where s.rollno = t.rollno
    group by s.category
    order by avgac ASC) as minm;

/*Query(e)*/
/* (Note: Query (e) seems to be asking for categories below average, but the provided code finds the minimum again. This implementation matches the provided code.) */
select category, min(avgac) as 'avgac'
from (select s.category,avg(t.mark) as 'avgac'
    from student as s, student_rank as t
    where s.rollno = t.rollno
    group by s.category
    order by avgac ASC) AS minm;

drop view Temp1;
drop table T_Status;
drop table student_rank;
drop table student;
drop database Student_details;