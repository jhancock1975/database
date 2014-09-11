 SELECT P#,avg(qty) FROM SPJ 
  GROUP BY P# 
  HAVING AVG(QTY) > 
  ( SELECT avg(QTY) FROM SPJ, P WHERE color = 'Red' and spj.p#=p.p# );
