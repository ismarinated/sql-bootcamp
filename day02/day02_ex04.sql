select m.pizza_name as pizza_name, piz.name as pizzeria_name, m.price as price
from menu as m
join pizzeria as piz on m.pizzeria_id = piz.id
where m.pizza_name = 'mushroom pizza' or m.pizza_name = 'pepperoni pizza'
order by 1, 2