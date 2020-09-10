select res.ptype, count(*)
from (  select temp2.ordid, p.ptype
        from (  select temp.ordid
                from (  select o.ordid, p.ptype
                        from Orders o, Details d, Products p
                        where o.ordid = d.ordid and d.pcode = p.pcode
                        group by o.ordid, p.ptype) temp
                group by temp.ordid
                having count(*) = 1) temp2, Details d, Products p
        where temp2.ordid = d.ordid and d.pcode = p.pcode
        group by temp2.ordid, p.ptype ) res
group by res.ptype;