select
    p.address,
    piz.name,
    count(*) as count_of_orders
from person_order as po
inner join menu as m on po.menu_id = m.id
inner join pizzeria as piz on m.pizzeria_id = piz.id
inner join person as p on po.person_id = p.id
group by p.address, piz.name
order by 1, 2