create view v_price_with_discount as
select
    p.name as name,
    m.pizza_name as pizza_name,
    m.price as price,
    cast(m.price - m.price * 0.1 as int) as discount_price
from person_order as po
inner join person as p on po.person_id = p.id
inner join menu as m on po.menu_id = m.id
order by 1, 2

-- select * from v_price_with_discount