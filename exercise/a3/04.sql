
select tot.ocust,tot.interval
from(
	select res.ocust, max(res.theInterval)as interval
	from (	select l.ocust, (min(r.odate)-l.odate)as theInterval
			from Orders l, Orders r
			where l.ocust = r.ocust and l.odate < r.odate and l.ocust in (	select o.ocust from Orders o group by o.ocust having count(o.ordid) >=2 and  (max(o.odate)-min(o.odate)) <> 0)
			group by l.ocust, l.odate)as  res
	group by res.ocust
	union
	select o.ocust, 0
	from Orders o
	group by o.ocust
	having count(o.ordid) >=2 and  (max(o.odate)-min(o.odate)) = 0
) as tot
ORDER BY  ocust asc;