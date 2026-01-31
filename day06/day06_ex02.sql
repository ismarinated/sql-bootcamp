select
    p.name,
    m.pizza_name,
    m.price,
    cast (m.price - (m.price * pd.discount / 100) as int) as discount_price,
    piz.name
from person_order as po
inner join menu as m on po.menu_id = m.id
inner join person_discounts as pd
on
    po.person_id = pd.person_id and
    m.pizzeria_id = pd.pizzeria_id
inner join person as p on po.person_id = p.id
inner join pizzeria as piz on m.pizzeria_id = piz.id
order by 1, 2