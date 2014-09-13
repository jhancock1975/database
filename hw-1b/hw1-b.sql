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


/* Problem 8  (b) */

select s# from spj 
where
(select count(distinct j.j#) from p,j 
  where p.color='Red' and j.city='Rome'
  and spj.p#=p.p# and spj.j#=j.j#) =
(select count(*) from j where j.city='Rome');
  

/* Problem 9 (a) */

/* Problem 9 (b) */

/* Problem 10  */