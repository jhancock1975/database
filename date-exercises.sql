/**
 * john hancock
 * 2014-08-24
 * create schema 
 * from Date text on
 * databases
 */
drop table S;
drop table P;
drop table J;
drop table SPJ;
drop table SP;

create table S (s# varchar(255) not null, sname varchar(255),  status int,  city varchar(255), primary key(s#));
create table P (p# varchar(255) not null, pname varchar(255), color varchar(255), weight int, city varchar(255), primary key(p#));
create table J (j# varchar(255) not null, jname varchar(255), city varchar(255), primary key(j#));
create table SPJ (s# varchar(255), p# varchar(255), j# varchar(255), qty int, 
	primary key(s#,p#,j#), foreign key(s#) references S, foreign key(p#) references P, foreign key(j#) references J);
create table SP (s# varchar(255), p# varchar(255), qty int, primary key (s#,p#), foreign key(s#) references S, foreign key(p#) references P);

insert into S values ('S1',  'Smith',  20,  'London' );
insert into S values ('S2',  'Jones',  10,  'Paris' );
insert into S values ('S3',  'Blake',  30,  'Paris' );
insert into S values ('S4',  'Clark',  20,  'London' );
insert into S values ('S5',  'Adams',  30,  'Athens' );


insert into P values ('P1',  'Nut',  'Red',  12,  'London' );
insert into P values ('P2',  'Bolt',  'Green',  17,  'Paris' );
insert into P values ('P3',  'Screw',  'Blue',  17,  'Rome' );
insert into P values ('P4',  'Screw',  'Red',  14,  'London' );
insert into P values ('P5',  'Cam',  'Blue',  12,  'Paris' );
insert into P values ('P6',  'Cog',  'Red',  19,  'London' );


insert into J values ('J1',  'Sorter',  'Paris' );
insert into J values ('J2',  'Punch',  'Rome' );
insert into J values ('J3',  'Reader',  'Athens' );
insert into J values ('J4',  'Console',  'Athens' );
insert into J values ('J5',  'Collator',  'London' );
insert into J values ('J6',  'Terminal',  'Oslo' );
insert into J values ('J7',  'Tape',  'London' );


insert into SPJ values ('S1',  'P1',  'J1',  200 );
insert into SPJ values ('S1',  'P1',  'J4',  700 );
insert into SPJ values ('S2',  'P3',  'J1',  400 );
insert into SPJ values ('S2',  'P3',  'J2',  200 );
insert into SPJ values ('S2',  'P3',  'J3',  200 );
insert into SPJ values ('S2',  'P3',  'J4',  500 );
insert into SPJ values ('S2',  'P3',  'J5',  600 );
insert into SPJ values ('S2',  'P3',  'J6',  400 );
insert into SPJ values ('S2',  'P3',  'J7',  800 );
insert into SPJ values ('S2',  'P5',  'J2',  100 );
insert into SPJ values ('S3',  'P3',  'J1',  200 );
insert into SPJ values ('S3',  'P4',  'J2',  500 );
insert into SPJ values ('S4',  'P6',  'J3',  300 );
insert into SPJ values ('S4',  'P6',  'J7',  300 );
insert into SPJ values ('S5',  'P2',  'J2',  200 );
insert into SPJ values ('S5',  'P2',  'J4',  100 );
insert into SPJ values ('S5',  'P5',  'J5',  500 );
insert into SPJ values ('S5',  'P5',  'J7',  100 );
insert into SPJ values ('S5',  'P6',  'J2',  200 );
insert into SPJ values ('S5',  'P1',  'J4',  100 );
insert into SPJ values ('S5',  'P3',  'J4',  200 );
insert into SPJ values ('S5',  'P4',  'J4',  800 );
insert into SPJ values ('S5',  'P5',  'J4',  400 );
insert into SPJ values ('S5',  'P6',  'J4',  500 );


create view GOOD_SUPPLIERS as select s#, status, city from S where status > 15;


insert into SP values ('S1', 'P1', 300);
insert into SP values ('S1', 'P2', 200);
insert into SP values ('S1', 'P3', 400);
insert into SP values ('S1', 'P4', 200);
insert into SP values ('S1', 'P5', 100);
insert into SP values ('S1', 'P6', 100);
insert into SP values ('S2', 'P1', 300);
insert into SP values ('S2', 'P2', 400);
insert into SP values ('S3', 'P2', 200);
insert into SP values ('S4', 'P2', 200);
insert into SP values ('S4', 'P4', 300);
insert into SP values ('S4', 'P5', 400);

/* necessary so that results show  formatted 
	in tabular form */
 
column S# format a20
column SNAME format a20
column STATUS format a20
column CITY format a20
column P# format a20
column PNAME format a20
column COLOR format a20
column WEIGHT format a20
column J# format a20
column JNAME format a20
column QTY format 999999999

/* queries for excersises 6.1-6.14 */
select * from J;

select * from J where city='London';

select distinct s# from SPJ where j#='J1' order by s#;

select s#,p#,j#, qty from SPJ 
where qty <= 750
and qty >= 300;

select distinct city, color from P;

select  s#,p#,j# from S s, P p, J j
where s.city=p.city and p.city=j.city;

select  s#,p#,j# from S s, P p, J j 
where not (s.city=p.city and p.city=j.city);

select  s#,p#,j# from S s, P p, J j
where not (s.city=p.city or s.city=j.city or p.city=j.city);

select s#,p#,j# from S,P,J 
where S.city <> P.city and P.city <> J.city and J.city <> S.city;

select distinct spj.p# 
from S s, SPJ spj
where spj.s#=s.s# and s.city='London';

select distinct spj.p# 
from SPJ spj, S s, J j 
where spj.s#=s.s# and spj.j#=j.j# 
and s.city='London' and j.city='London';

select distinct s.city, j.city 
from SPJ spj, S s, J j
where spj.s#=s.s# and spj.j#=j.j#;

select distinct spj.p# from SPJ spj, P p, J j 
where spj.p#=p.p# and spj.j#=j.j# and j.city=p.city;

select distinct j.j# from SPJ spj, S s, J j
where spj.s#=s.s# and spj.j#=j.j# and s.city <> j.city;

select distinct spj1.p#, spj2.p# from SPJ spj1, SPJ spj2 
where spj1.p# > spj2.p# and spj1.s#=spj2.s#;
