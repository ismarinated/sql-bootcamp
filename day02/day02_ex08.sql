select p.name as name
from person_order as po
inner join person as p on po.person_id = p.id
inner join menu as m on po.menu_id = m.id
where p.gender = 'male'
    and (p.address = 'Moscow' or p.address = 'Samara')
    and (m.pizza_name = 'pepperoni pizza' or m.pizza_name = 'mushroom pizza')
order by 1 desc