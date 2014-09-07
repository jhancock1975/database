/*
6.15
-----
Print the total number of projects supplied by S1
*/
select count(distinct j#) from spj where s#='S1';

/*
6.16
----
Print the total number of P1 supplied by S1
*/
select sum(qty) from spj where p#='P1' and s#='S1';

/*
6.17
For each part supplied to a project, print p# , j# , corresponding total quantity
*/
select p#,j#,sum(qty) from spj group by p#,j#;

/*
6.18
----
Print p# of parts supplied to some project in an average quantity of more than 320
*/

select p# from spj group by p#,j# having avg(qty) > 320;

/*
6.28
----
Print the J#s of projects supplied with part P1 in an average quantity 
greater than the greatest quantity in which any part is supplied to project J1
*/

select j# from spj where p#='P1' 
group by j# 
having avg(qty) > (select max(qty) from spj where j#='J1');