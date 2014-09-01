/*
 * formatting options
 */
 
column S# format a10
column SNAME format a10
column STATUS format a10
column CITY format a10
column P# format a10
column PNAME format a10
column COLOR format a10
column WEIGHT format a10
column J# format a10
column JNAME format a10
column QTY format 999999999

/* 6.21 */
select jname from J where j# in (select j# from SPJ where s#='S1');

select jname from J j, SPJ spj
where spj.s#='S1' and j.j#=spj.j#;

/* 6.22 */
select distinct color from P where p# in (select p# from SPJ where s#='S1');

select distinct p.color  from P p, SPJ spj
where p.p#=spj.p# and spj.s#='S1';

/* 6.23 */
select p# from P where p# in (select p# from SPJ where j# in (select j# from J where city='London'));

select distinct p# from SPJ where j# in (select j# from J where city='London');

select distinct spj.p# from J j, SPJ spj
where j.city='London' and spj.j#=j.j#;

/* 6.24 */
select distinct j# from SPJ where p# in (select p# from SPJ where s#='S1');

select distinct j# from P p, SPJ spj where p.p#=spj.p#
and spj.s#='S1';

/* 6.25 */

/* book answer
   I had an answer but was wrong
 */
select distinct s# from SPJ
where p# in (select p# from SPJ
where s# in (select s# from SPJ
where p# in (select p# from P where color='Red')));


select distinct spj1.s# from
SPJ spj1, SPJ spj2, SPJ spj3, P p
where spj1.p#=spj2.p#
and spj2.s# = spj3.s#
and spj3.p#=p.p# and p.color='Red';
