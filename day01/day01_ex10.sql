select p.name as person_name, m.pizza_name as pizza_name, piz.name as pizzeria_name
from person_order as po
join person as p on po.person_id = p.id
join menu as m on po.menu_id = m.id
join person_visits as pv on po.person_id = pv.person_id and po.order_date = pv.visit_date
join pizzeria as piz on pv.pizzeria_id = piz.id
order by person_name, pizza_name, pizzeria_name