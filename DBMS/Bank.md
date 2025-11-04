create database exp6;
use exp6;

create table Branch (
    branch_id int primary key,
    branch_name varchar(30),
    branch_city varchar(30)
);

create table Customer(
    customer_id int primary key,
    customer_name varchar(30),
    customer_city varchar(30)
);

create table Savings (
    customer_id int not NULL,
    branch_id int not NULL,
    saving_accno int,
    balance int,
    constraint fkc foreign key (customer_id) references Customer (customer_id),
    constraint fkb foreign key (branch_id) references Branch (branch_id)
);

create table Loan (
    customer_id int not NULL,
    branch_id int not NULL,
    loan_accno int,
    balance int,
    constraint fkc2 foreign key (customer_id) references Customer (customer_id),
    constraint fkb2 foreign key (branch_id) references Branch (branch_id)
);

insert into Branch values
(401, "Thiruvananthapuram", "Thiruvananthapuram"),
(402, "Kottayam", "Kottayam"),
(403, "Ernakulam", "Kochi"),
(404, "Kozhikode", "Kozhikode");

insert into Customer values
(6001, "Ananthakrishnan", "Thiruvananthapuram"),
(6002, "Irfan", "Thiruvananthapuram"),
(6003, "Suneeth", "Thiruvananthapuram"),
(6004, "Sreejith", "Kottayam"),
(6005, "Jafar", "Kazhakoottam"),
(6006, "Radika", "Pampady"),
(6007, "Jameela", "Kanjikuzhi"),
(6008, "Bindu", "Kottayam"),
(6009, "Purushothaman", "Kollam"),
(6010, "Vincy", "Kottayam"),
(6011, "Abdul Rahman", "Thrissur"),
(6012, "Vishwanathan", "Ernakulam"),
(6013, "Marykutty", "Mattancheri"),
(6014, "Hajara", "Ernakulam"),
(6015, "Revathy", "Kozhikode"),
(6016, "Hameed", "Perambra"),
(6017, "Suchithra", "Kozhikode"),
(6018, "Saneesh", "North Paravoor"),
(6019, "Gokul Das", "Kozhikode"),
(6020, "Abraham", "Kappad");

insert into Savings values
(6001,401,6400101,15000),
(6002,401,6400102,200000),
(6005,401,6400105,30000),
(6007,401,6400107,70000),
(6004,402,6400204,400000),
(6006,402,6400206,100000),
(6007,402,6400207,40000),
(6008,402,6400208,74000),
(6010,402,6400210,128507),
(6011,403,6400311,700000),
(6001,403,6400301,200000),
(6012,403,6400312,500000),
(6013,403,6400313,250000),
(6015,404,6400415,100000),
(6016,404,6400416,90756);

insert into Loan values
(6005,401,4600105,100000),
(6003,401,4600103,200000),
(6009,401,4600109,150000),
(6019,401,4600119,100000),
(6011,403,4600311,1000000),
(6013,403,4600313,500000),
(6014,403,4600314,300000),
(6018,403,4600318,300000),
(6006,403,4600306,100000),
(6009,403,4600309,200000),
(6014,404,4600414,100000),
(6016,404,4600416,150000),
(6017,404,4600417,200000),
(6019,404,4600419,300000),
(6020,404,4600419,400000),
(6008,404,4600408,100000);

create view AllSave as
select s.customer_id,s.branch_id,s.saving_accno as accno,s.balance, b.branch_name,b.branch_city,c.customer_name,c.customer_city
from Savings as s, Branch as b, Customer as c
where s.customer_id=c.customer_id and s.branch_id=b.branch_id;

create view AllLoan as
select s.customer_id,s.branch_id,s.loan_accno as accno, s.balance, b.branch_name,b.branch_city,c.customer_name,c.customer_city
from Loan as s, Branch as b, Customer as c
where s.customer_id=c.customer_id and s.branch_id=b.branch_id;

create view AllAcc as
(select * from AllSave
union
select * from AllLoan)
order by customer_id;

/* Query (a) */
select customer_id,customer_name, customer_city, branch_city
from AllAcc
where customer_city=branch_city;

/* Query (b) */
select distinct customer_id,customer_name, branch_city
from AllAcc
where branch_city="Kochi";

/* Query (c) */
select distinct a1.customer_id,a1.customer_name
from AllAcc as a1, AllAcc as a2
where a1.customer_id=a2.customer_id and a1.branch_id!=a2.branch_id
order by a1.customer_id;

/* Query (d) i */
select distinct l.customer_id,l.customer_name as customer_loan_only
from AllLoan as l
where l.customer_id not in (select customer_id from AllSave)
order by l.customer_id;

/* Query (d) ii */
select distinct l.customer_id, l.customer_name as customer_savings_only
from AllSave as l
where l.customer_id not in (select customer_id from AllLoan)
order by l.customer_id;

/* Query (d) iii */
select distinct l.customer_id,l.customer_name as customer_loan_and_savings
from AllLoan as l, AllSave as s
where l.customer_id = s.customer_id
order by l.customer_id;

/* Query (e) */
select l.customer_id, l.customer_name,count(*) as no_of_loans
from AllLoan as l
where l.customer_id not in (select customer_id from AllSave)
group by l.customer_id
having no_of_loans>1
order by l.customer_id;

/* Query (f) */
create view c_loan as
select distinct l.branch_id, count(*) as no_l
from AllLoan as l
where l.customer_id not in (select s.customer_id from AllSave as s where l.branch_id=s.branch_id)
group by branch_id
order by l.branch_id;

create view c_save as
select distinct l.branch_id, count(*) as no_s
from AllSave as l
where l.customer_id not in (select s.customer_id from AllLoan as s where l.branch_id=s.branch_id)
group by branch_id
order by l.branch_id;

create view c_both as
select distinct l.branch_id, count(*) as no_bo
from AllLoan as l, AllSave as s
where l.customer_id=s.customer_id and l.branch_id=s.branch_id
group by branch_id
order by l.branch_id;

create view branch_details as
select b.branch_id,b.branch_name,
ifnull(l.no_l,0) as no_of_customer_loan_only,
ifnull(s.no_s,0) as no_of_customer_savings_only,
ifnull(bo.no_bo, 0) as no_of_customer_both,
ifnull(l.no_l,0)+ifnull(s.no_s,0)+ifnull(bo.no_bo, 0) as no_of_customers_total
from Branch as b
left join c_both as bo on b.branch_id=bo.branch_id
left join c_loan as l on b.branch_id = l.branch_id
left join c_save as s on b.branch_id = s.branch_id;

select * from branch_details;

/* Query (g) */
create view t_loan as
select branch_id, branch_name,sum(balance) as total
from AllLoan group by branch_id;

select * from t_loan
where total in (select max(total) from t_loan);

/* Query (h) */
select branch_id, branch_name, no_of_customer_loan_only
from branch_details
where no_of_customer_loan_only = 0;

/* Query (i) */
create view customer_details as
select c.customer_id,c.customer_name, ifnull(l.balance, 0) as l_balance, ifnull(s.balance, 0) as s_balance
from AllAcc as c
left join Loan as l on c.accno = l.loan_accno
left join Savings as s on c.accno = s.saving_accno;

select customer_id, customer_name, sum(l_balance) as loan_balance, sum(s_balance) as savings_balance
from customer_details
group by customer_id;

drop view c_loan;
drop view c_save;
drop view c_both;
drop view branch_details;
drop view t_loan;
drop view customer_details;
drop view AllAcc;
drop view AllLoan;
drop view AllSave;
drop table Loan;
drop table Savings;
drop table Customer;
drop table Branch;
drop database exp6;