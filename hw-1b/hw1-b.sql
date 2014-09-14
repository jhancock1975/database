set echo on

/* Problem 6  */

select p#,avg(qty) from spj 
group by p# 
having avg(qty) > 
(select avg(qty) from spj where p# in (select p# from p where p.color='Red'));

/* Problem 7  */

select p# from p where 
(select avg(qty) from spj where spj.p#=p.p#) >
(select avg(qty) from spj where p.color='Red');

/* Problem 8  (a) */

select s# from spj where
  j# in (select j# from j where j.city='Rome') and
  p# in (select p# from p where p.color='Red')
group by s#
having count(distinct j#)=(select count(*) from j where j.city='Rome');


/* Problem 8  (b) */

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