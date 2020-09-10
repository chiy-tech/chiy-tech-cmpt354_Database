select sub.ptype, sub.ocust
from (	select products.ptype, orders.ocust, sum(details.qty) as qty
		from Details details,Products products,Orders orders
		where details.pcode = products.pcode and details.ordid = orders.ordid
		group by orders.ocust, products.ptype) as sub
where sub.qty >= all (	select sum(details.qty) as qty
						from Details details,Products products, Orders orders
						where products.ptype = sub.ptype and details.pcode = products.pcode and details.ordid = orders.ordid
						group by orders.ocust, products.ptype);

