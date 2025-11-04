create database library;
use library;

create table book (
    accession_no int primary key,
    title varchar(40),
    publisher varchar(40),
    year_of_publishing YEAR,
    date_of_purchase date,
    status varchar(20)
);

create table member(
    member_id int primary key,
    name varchar(30),
    number_of_books_issued int,
    max_limit int
);

create table books_issue (
    accession_no int,
    member_id int,
    date_of_issue date,
    foreign key (accession_no) references book (accession_no),
    foreign key (member_id) references member (member_id)
);

INSERT INTO book VALUES
("122", "MIDNIGHT CHILDREN", "SALMAN RUSHDIE", "1947", "2002-05-18", "ISSUED"),
("123", "THE MAGIC MOUNTAIN", "THOMAS MANN", "1998","2003-05-28","ISSUED"),
("124", "GREAT EXPECTATIONS", "CHARLES DICKENS", "2005", "2008-01-28","ISSUED"),
("125", "LEAVES OF GRASS", "WALT WHITMAN", "2008","2011-11-26", "ISSUED"),
("126", "TRISTRAM SHANDY", "LAURENCE STRENE", "1996","2002-01-08","ISSUED"),
("127", "DAVID COPPERFIELD", "CHARLES DICKENS", "1999", "2003-02-07","ISSUED"),
("128", "THE AENEID", "VIRGIL", "2000", "2001-12-10","ISSUED"),
("129", "JANE EYRE", "CHARLOTTE BRONTE", "2010", "2011-04-05","ISSUED"),
("130", "THE STRANGER", "ALBERT CAMUS", "2021", "2022-04-12","ISSUED"),
("131", "BELOVED", "TONI MORRISON", "2004", "2021-07-22", "ISSUED"),
("132", "MIDDLEMARCH", "GEORGE ELIOT", "2002", "2004-10-21","ISSUED"),
("133", "INVISIBLE MAN", "RALPH ELLISON", "2006", "2007-10-10","ISSUED"),
("134", "MIDNIGHT CHILDREN", "SALMAN RUSHDIE", "1947", "2002-05-18", "NOT ISSUED"),
("135", "THE MAGIC MOUNTAIN", "THOMAS MANN", "1998", "2003-05-28", "NOT ISSUED"),
("136", "GREAT EXPECTATIONS", "CHARLES DICKENS", "2005", "2008-01-28", "NOT ISSUED"),
("137", "LEAVES OF GRASS", "WALT WHITMAN", "2008", "2011-11-26", "NOT ISSUED"),
("138", "TRISTRAM SHANDY", "LAURENCE STRENE", "1996", "2002-01-08", "NOT ISSUED"),
("139", "DAVID COPPERFIELD", "CHARLES DICKENS", "1999", "2003-02-07", "NOT ISSUED"),
("140", "THE AENEID", "VIRGIL", "2000", "2001-12-10", "NOT ISSUED"),
("141", "JANE EYRE", "CHARLOTTE BRONTE", "2010", "2011-04-05", "NOT ISSUED"),
("142", "THE STRANGER", "ALBERT CAMUS", "2021","2022-04-12", "NOT ISSUED"),
("143", "BELOVED", "TONI MORRISON", "2004","2021-07-22", "NOT ISSUED"),
("144", "MIDDLEMARCH", "GEORGE ELIOT", "2002", "2004-10-21", "NOT ISSUED"),
("145", "INVISIBLE MAN", "RALPH ELLISON", "2006", "2007-10-10", "NOT ISSUED"),
("146", "MIDNIGHT CHILDREN", "SALMAN RUSHDIE", "1947","2002-05-18", "REFERENCE"),
("147", "THE MAGIC MOUNTAIN", "THOMAS MANN", "1998","2003-05-28", "REFERENCE"),
("148", "GREAT EXPECTATIONS", "CHARLES DICKENS", "2005", "2008-01-28", "REFERENCE"),
("149", "LEAVES OF GRASS", "WALT WHITMAN", "2008","2011-11-26", "REFERENCE"),
("150", "TRISTRAM SHANDY", "LAURENCE STRENE", "1996", "2002-01-08", "REFERENCE"),
("151", "DAVID COPPERFIELD", "CHARLES DICKENS", "1999", "2003-02-07", "REFERENCE"),
("152", "THE AENEID", "VIRGIL", "2000", "2001-12-10", "REFERENCE"),
("153", "JANE EYRE", "CHARLOTTE BRONTE", "2010", "2011-04-05", "REFERENCE"),
("154", "THE STRANGER", "ALBERT CAMUS", "2021", "2022-04-12", "REFERENCE"),
("155", "BELOVED", "TONI MORRISON", "2004", "2021-07-22", "REFERENCE"),
("156", "MIDDLEMARCH", "GEORGE ELIOT", "2002", "2004-10-21", "REFERENCE"),
("157", "INVISIBLE MAN", "RALPH ELLISON", "2006","2007-10-10", "REFERENCE");

INSERT INTO member VALUES
("2010", "JOHN WICK", "3","5"),
("2011", "MONKEY D LUFFY", "2", "6"),
("2012", "TONY STARK", "8", "8"),
("2013", "STEVEN GRANT ROGERS", "1","2"),
("2014", "CLINTON FRANCIS BARTON", "2", "7"),
("2015", "WANDA MAXIMOFF", "4","5"),
("2016", "T CHALLA", "1","5"),
("2017", "VICTOR SHADE", "4", "4"),
("2018", "THOR ODINSON", "0", "1"),
("2019", "NATASHA ROMANOFF", "4","5"),
("2020", "JENNIFER SUSAN", "4","5");

INSERT INTO books_issue VALUES
("122", "2010", "2005-11-18"),
("123", "2010", "2022-11-18"),
("124", "2010", "2022-11-18"),
("125", "2011", "2022-11-18"),
("126", "2011", "2022-11-18"),
("127", "2012", "2022-11-18"),
("128", "2012", "2011-11-18"),
("129", "2012", "2022-11-18"),
("130", "2012", "2022-11-18"),
("131", "2012", "2021-11-18"),
("132", "2012", "2022-11-18"),
("133", "2012", "2022-11-18"),
("122", "2012", "2022-11-18"),
("123", "2013", "2022-11-18"),
("124", "2014", "2022-11-18"),
("125", "2014", "2022-11-18"),
("126", "2015", "2022-11-18"),
("127", "2015", "2021-11-18"),
("128", "2015", "2022-11-18"),
("129", "2015", "2022-11-18"),
("130", "2016", "2022-11-18"),
("131", "2017", "2022-11-18"),
("132", "2017", "2022-11-18"),
("133", "2017", "2022-11-18"),
("122", "2017", "2022-11-18"),
("123", "2017", "2022-11-18"),
("124", "2019", "2022-11-18"),
("125", "2019", "2020-11-18"),
("126", "2019", "2022-11-18"),
("127", "2019", "2022-11-18"),
("128", "2020", "2022-11-18"),
("129", "2020", "2022-11-18"),
("130", "2020", "2022-11-18"),
("132", "2020", "2022-11-18");

/* Query (a) */
select b.accession_no,b.title
from book as b, books_issue as c
where b.accession_no = c.accession_no and
DATEDIFF(CURDATE(), c.date_of_issue) > 15;

/* Query (b) */
select m.member_id,m.name,m.number_of_books_issued
from member as m
where m.number_of_books_issued = m.max_limit;

/* Query (c) */
create view temp4 as
select *
from book
natural join books_issue;

create view tempo as
SELECT S.title, S.publisher, COUNT(*) AS 'bookCount'
FROM book as S
where S.status = "ISSUED"
GROUP BY S.title, S.publisher;

create view tempu as
SELECT S.title, S.publisher, COUNT(*) AS 'bookCount'
FROM book as S
GROUP BY S.title, S.publisher;

create view temp1 as
select max(bookCount) as 'maxm'
from tempo;

create view temp2 as
select min(bookCount) as 'minm'
from tempo;

select b.title,b.publisher, count(i.member_id)
from book as b, books_issue as i
where b.accession_no = i.accession_no
group by b.title,b.publisher
having count(i.member_id) = (select maxm from temp1)
union
select b.title,b.publisher, count(i.member_id)
from book as b, books_issue as i
where b.accession_no = i.accession_no
group by b.title,b.publisher
having count(i.member_id) = (select minm from temp2);

/* Query (d) */
/* (Note: The query for "taken by every member" is complex and seems incomplete in the original. 
   The following matches the provided script's intent for "not yet issued".) */
SELECT b.title,b.publisher
FROM book as b, books_issue as t
where b.accession_no = t.accession_no
GROUP BY b.title,b.publisher
having count(*) = 11 /* (Assuming 11 is the total number of members) */
union
select title, publisher
from book
where status = "NOT ISSUED" or status = "REFERENCE"
group by title, publisher
having count(*) = (select bookCount
from tempu
where book.title = title and book.publisher = publisher);


drop view tempu;
drop view tempo;
drop view temp4;
drop view temp1;
drop view temp2;
drop table books_issue;
drop table member;
drop table book;
drop database library;