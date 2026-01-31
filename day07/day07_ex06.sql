select
    piz.name,
    count(*) as count_of_orders,
    round(avg(m.price), 2) as average_price,
    max(m.price) as max_price,
    min(m.price) as min_price
from person_order as po
inner join menu as m on po.menu_id = m.id
inner join pizzeria as piz on m.pizzeria_id = piz.id
group by piz.name
order by 1