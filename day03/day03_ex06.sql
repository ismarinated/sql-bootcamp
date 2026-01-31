select m1.pizza_name as pizza_name,
    piz1.name as pizzeria_name_1,
    piz2.name as pizzeria_name_2,
    m1.price as price
from menu as m1
inner join menu as m2 on m1.pizza_name = m2.pizza_name and m1.price = m2.price
inner join pizzeria as piz1 on m1.pizzeria_id = piz1.id
inner join pizzeria as piz2 on m2.pizzeria_id = piz2.id
where m1.id > m2.id
order by 1