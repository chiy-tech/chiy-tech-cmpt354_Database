select after_tax.invid
from(
		select invoice.invid, cast(sum(details.qty*products.price)*1.2 as DECIMAL(5,2)) amount
		from Invoices invoice, Details details, Orders orders, Products products
		where invoice.ordid = orders.ordid and details.ordid = orders.ordid and details.pcode = products.pcode
		group by invoice.invid
	) after_tax,
	(
		select invoice.invid, invoice.amount
		from Invoices invoice
	) invoices
where after_tax.invid = invoices.invid and after_tax.amount = invoices.amount
ORDER BY invid ASC;
