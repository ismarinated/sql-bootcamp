select m.pizza_name as pizza_name, piz.name as pizzeria_name
from person_order as po
join person as p on po.person_id = p.id
join menu as m on po.menu_id = m.id
join pizzeria as piz on m.pizzeria_id = piz.id
where p.name = 'Denis' or p.name = 'Anna'
order by 1, 2