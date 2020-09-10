
select res.ocust
from (	select l.ocust, (min(r.odate)-l.odate) as interval
		from (	select o.ocust, o.odate
				from Orders o
				where o.ocust in (	select temp.ocust
										from (	select o.ocust, o.odate
												from Orders o
												group by o.ocust, o.odate )as temp
										group by temp.ocust
										having count(*) >= 5 )
				group by o.ocust, o.odate )as l,
			(	select o.ocust, o.odate
				from Orders o
				where o.ocust in (	select temp.ocust
										from (	select o.ocust, o.odate
												from Orders o
												group by o.ocust, o.odate )as temp
										group by temp.ocust
										having count(*) >= 5 )
				group by o.ocust, o.odate )as r
		where l.ocust = r.ocust and l.odate < r.odate
		group by l.ocust, l.odate
		)as res

group by res.ocust
having avg(res.interval) >0 and avg(res.interval) < 30

order by res.ocust asc;