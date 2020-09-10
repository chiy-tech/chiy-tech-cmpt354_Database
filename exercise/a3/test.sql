select sub.ocust, max(sub.datedif)
from (	select order_left.ocust, (min(order_right.odate)-order_left.odate)as datedif
		from Orders order_left, Orders order_right
		where order_left.ocust = order_right.ocust and order_left.odate < order_right.odate and order_left.ocust in (	select orders.ocust
																														from Orders orders
																														group by orders.ocust
																														having count(orders.ordid) >=2)
		group by order_left.ocust, order_left.odate)as  sub
group by sub.ocust

union

select orders.ocust, 0
from Orders orders
group by orders.ocust
having count(orders.ordid) >=2 and  (max(orders.odate)-min(orders.odate)) = 0
ORDER BY  ocust asc;