SELECT C.country, 
COUNT(case when O.odate between '2016-1-1' and '2016-12-31' then 0 else null end) 
FROM Customers C LEFT JOIN  Orders O  ON C.custid = O.ocust
GROUP BY C.country

