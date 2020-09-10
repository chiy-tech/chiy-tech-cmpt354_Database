select res.custid,res.moneys
from (
		select good.custid,good.moneys
		from 
		(select  cc.custid,cc.moneys
						   from (select od.custid,sum(od.qty*od.price) as moneys
						   		 from (select c.custid, d.qty, p.price
												from Orders o, Details d,Products p,Customers c
												where c.custid = o.ocust and o.ordid = d.ordid and p.pcode = d.pcode and p.ptype = 'MUSIC'  and o.odate between'2016-01-01' and '2016-06-30'
									  )as od
						   		 group by od.custid
						   		 ) as cc 
						   	)as good
		where  good.moneys < 50 
						 
) as res
union
select c.custid,0
from Customers c
		where c.custid not in (select distinct cc.ocust
						   from (select od.pcode , od.ocust
						   		 from (select o.ocust, o.ordid, d.pcode
												from Orders o, Details d
												where o.ordid = d.ordid and  o.odate between '2016-01-01'and'2016-06-30'
									  )as od
						   		 ) as cc, Products p
						   		where cc.pcode = p.pcode and p.ptype = 'MUSIC'
						   	)
ORDER BY custid ASC;



