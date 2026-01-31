create materialized view mv_dmitriy_visits_and_eats as
select piz.name as pizzeria_name
from person_visits as pv
inner join person as p on pv.person_id = p.id
inner join pizzeria as piz on pv.pizzeria_id = piz.id
inner join menu as m on piz.id = m.pizzeria_id
where p.name = 'Dmitriy' and pv.visit_date = '2022-01-08' and m.price < 800
order by 1

-- select * from mv_dmitriy_visits_and_eats