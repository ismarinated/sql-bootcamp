select
    m.pizza_name as pizza_name,
    m.price as price,
    piz.name as pizzeria_name,
    pv.visit_date as visit_date
from menu as m
inner join pizzeria as piz on m.pizzeria_id = piz.id
inner join person_visits as pv on piz.id = pv.pizzeria_id
inner join person as p on pv.person_id = p.id
where p.name = 'Kate' and m.price between 800 and 1000
order by 1, 2, 3, 41