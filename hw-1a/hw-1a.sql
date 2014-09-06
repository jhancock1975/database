set echo on
/* Problem 1 (a) */
select s# from spj, p, j
where p.weight > 15 
and j.city='London'
and spj.j#=j.j#
and spj.p#=p.p#;

/* Problem 1 (b) */

select s# from spj
where 
j# in (select j# from j where j.city='London')
and
p# in (select p# from p where p.weight > 15);

/* problem 2 */
select s# from spj, p
where p.weight > 15 
and spj.p#=p.p#
intersect
select s# from spj, j
where j.city='London'
and spj.j#=j.j#;

/* problem 3 */
select s# from spj, p
where p.weight > 15 
and spj.p#=p.p#
minus
select s# from spj, j
where j.city='London'
and spj.j#=j.j#;

/* problem 4 */
select spjx.j#, spjy.j#
from s, spj spjx, spj spjy
where s.city='London'
and spjx.j# < spjy.j#
and spjx.s#=s.s#
and spjy.s#=s.s#;

/* problem 5 */
select city from p where color='Red'
union
select city from s where status > 20
union
select city from j where jname='Terminal'
order by city;
