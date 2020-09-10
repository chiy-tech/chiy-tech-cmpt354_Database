SELECT RESULT.ptype,CAST(AVG(NUM) AS DECIMAL(10,2)) AS AVG_TIMES
FROM (SELECT OD.ordid, OD.ptype, sum(OD.qty) AS NUM
FROM (SELECT O.ordid ordid, P.ptype, D.qty
FROM Orders O,Details D,Products P
WHERE O.ordid = D.ordid AND D.pcode = P.pcode) AS OD
GROUP BY OD.ordid, OD.ptype) AS RESULT
GROUP BY RESULT.ptype;

