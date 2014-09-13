set echo on

/* Problem 6  */

select p#,avg(qty) from spj 
group by p# 
having avg(qty) > 
( select avg(qty) from spj, p where color = 'Red' and spj.p#=p.p# );

/* Problem 7  */

select p# from p where 
(select avg(qty) from spj where spj.p#=p.p#) >
(select avg(qty) from spj, p where p.color='Red' and spj.p#=p.p#);

/* Problem 8  (a) */

select spj.s# from spj, p, j
where p.color='Red' and j.city='Rome'
and spj.j#=j.j# and spj.p#=p.p#
group by s#
having count( distinct spj.j#) =
(select count(distinct j#) from j where j.city='Rome');

/* this is like the one in the lecture */
select s# from spj where
  j# in (select j# from j where j.city='Rome') and
  p# in (select p# from p where p.color='Red')
group by s#
having count(distinct j#)=(select count(*) from j where j.city='Rome');

select * from spj where j#='J2' and p# in ('P1', 'P4', 'P6');
select * from j where j.city='Rome';
select * from p where p.color='Red';
select * from spj order by s#;
select * from s;

/* Problem 8  (b) */

select s# from spj 
where
(select count(distinct spj.j#) from p,j 
  where p.color='Red' and j.city='Rome'
  and spj.p#=p.p# and spj.j#=j.j#) =
(select count(*) from j where j.city='Rome');

/* i think count(*) from j because j is primary key
   count distinct from spj, p, j because table can have
   multi j#'s */

select s# from s
 where (select count(distinct j#) from spj where spj.s#=s.s#
        and spj.j# in (select j# from j where j.city='Rome')
        and spj.p# in (select p# from p where p.color='Red')
        ) =
        (select count(*) from j where j.city='Rome');

/* Problem 9 (a) */

select s# from spj 
where p# in (select p# from p where p.color='Red')
minus
select s# from spj
where p# in (select p# from p where p.color <> 'Red');

/* Problem 9 (b) */

select sname from s where s# in
(
select s# from spj 
where p# in (select p# from p where p.color='Red')
minus
select s# from spj
where p# in (select p# from p where p.color <> 'Red')
);

/* Problem 10  (a)*/
select j1.j#, j2.j# from j j1, j j2 where j1.j# < j2.j#
minus 
select spj1.j#, spj2.j# from spj spj1, s s1, spj spj2, s s2
where s1.city='London' and spj1.s#=s1.s#
and s2.city='London' and spj2.s#=s2.s#;