with unordered_CTE (id) as (
    select id as menu_id
    from menu
    except
    select po.menu_id
    from person_order as po
    order by 1
)
select m.pizza_name as pizza_name, m.price as price, piz.name as pizzeria_name
from menu as m
inner join unordered_CTE as u on m.id = u.id
inner join pizzeria as piz on m.pizzeria_id = piz.id
order by 1, 2