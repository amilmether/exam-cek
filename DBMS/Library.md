CREATE DATABASE Library;
USE Library;

CREATE TABLE BOOK (
    accession_no int,
    title varchar(20),
    publisher varchar(30),
    author varchar(25),
    date_of_purchase DATE,
    date_of_publishing DATE,
    status varchar(20),
    PRIMARY KEY (accession_no)
);

INSERT INTO BOOK (accession_no,title, publisher, author, date_of_purchase, date_of_publishing, status)
VALUES
(001, 'Computer Networks', 'Thakur Publications', 'Saurabh Singhal', '2015-06-10', '2015-05-19', 'issued'),
(002, 'Computer Networks', 'Sun India Publications', 'Subhash Kumar Verma', '2015-05-10', '2009-10-06', 'Cannot be issued'),
(003, 'Data Structures', 'McGraw', 'Lipschute', '2017-07-02', '2007-10-04', 'present in library'),
(004, 'Turbo C++', 'Galgotia', 'Robort Lafore', '2018-08-27', '2003-09-17', 'issued'),
(005, 'Basic for Beginners', 'BPB', 'Norton', '2018-08-27', '2008-07-12', 'present in library'),
(006, 'Computer Studies', 'Galgotia', 'French', '2018-02-04', '2010-06-16', 'reference'),
(007, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22', '2005-04-15', 'reference'),
(008, 'Guide Network', 'Zpress', 'Freed', '2017-07-02', '2009-03-19', 'issued'),
(009, 'Advanced Pascal', 'McGraw', 'Schildt', '2018-08-27', '2010-06-04', 'Cannot be issued'),
(010, 'Dbase Dummies', 'PustakM', 'Palmer', '2022-08-04','2008-07-18', 'present in library'),
(011, 'Data Structures', 'McGraw', 'Lipschute', '2008-07-02', '2007-10-04', 'issued'),
(012, 'Data Structures', 'McGraw', 'Lipschute', '2017-07-02', '2007-10-04', 'reference'),
(013, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22', '2005-04-15', 'present in library'),
(014, 'Computer Studies', 'Galgotia', 'French', '2018-02-04', '2010-06-16', 'reference'),
(015, 'Computer Studies', 'Galgotia', 'French', '2018-02-04', '2010-06-16', 'reference'),
(016, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22', '2005-04-15', 'reference'),
(017, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22', '2005-04-15', 'issued'),
(018, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22','2005-04-15', 'present in library'),
(019, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22', '2005-04-15', 'present in library'),
(020, 'Advanced Pascal', 'McGraw', 'Schildt', '2018-08-27', '2010-06-04', 'Cannot be issued'),
(021, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22', '2005-04-15', 'reference'),
(022, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22', '2005-04-15', 'Cannot be issued'),
(023, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22', '2005-04-15', 'reference'),
(024, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22', '2005-04-15', 'issued'),
(025, 'Mastering Windows', 'BPB', 'Cowart', '2005-07-22','2005-04-15', 'reference');

/*Query (a) */
SELECT title, author, publisher, count(accession_no)
FROM BOOK
GROUP BY title, author, publisher;

/*Query (b) */
SELECT title, author, publisher, count(accession_no)
FROM BOOK
WHERE status = 'reference'
GROUP BY title, author, publisher;

/*Query (c) */
SELECT title, author, publisher, status, count(accession_no)
FROM BOOK
WHERE status='reference' OR status ='issued' OR status = 'present in library'
GROUP BY title, author, publisher, status;

/*Query (d) */
SELECT *
FROM BOOK
WHERE status='cannot be issued';

/*Query (e) */
SELECT title, author, publisher, date_of_purchase, date_of_publishing, DATEDIFF(CURDATE(),date_of_purchase)
FROM BOOK
GROUP BY title, author, publisher
HAVING DATEDIFF(CURDATE(),date_of_purchase) < 180;

/*Query (f) */
SELECT title, author, publisher, date_of_purchase, date_of_publishing
FROM BOOK
GROUP BY title, author, publisher
HAVING DATEDIFF(date_of_purchase, date_of_publishing) < 365 AND count(accession_no) > 10;

DROP TABLE BOOK;
DROP DATABASE Library;