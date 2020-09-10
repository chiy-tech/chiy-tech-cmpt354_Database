select res.custid 
from (
		select c.custid
		from Customers c
		where c.custid not in (select distinct cc.ocust
						   from (select od.pcode , od.ocust
						   		 from (select o.ocust, o.ordid, d.pcode
												from Orders o, Details d
												where o.ordid = d.ordid and  d.qty <>0 and o.odate between '2016-01-01'and'2016-12-31'
									  )as od
						   		 ) as cc, Products p
						   		where cc.pcode = p.pcode and p.ptype = 'BOOK'
						   	)
) as res;



