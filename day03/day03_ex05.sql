select piz.name as pizzeria_name
from person as p
inner join person_visits as pv on p.id = pv.person_id
inner join pizzeria as piz on pv.pizzeria_id = piz.id
where p.name = 'Andrey'
except all
select piz.name as pizzeria_name
from person as p
inner join person_visits as pv on p.id = pv.person_id
inner join person_order as po on po.person_id = pv.person_id and po.order_date = pv.visit_date
inner join pizzeria as piz on pv.pizzeria_id = piz.id
where p.name = 'Andrey'
order by 1