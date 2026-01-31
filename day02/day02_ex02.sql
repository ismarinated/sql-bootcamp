select coalesce(p.name, '-') as person_name, date(days) as visit_date, coalesce(piz.name, '-') as pizzeria_name
from generate_series('2022-01-01', '2022-01-03', interval '1 day') as days
join person_visits as pv on days = pv.visit_date
full join person as p on p.id = pv.person_id
full join pizzeria as piz on piz.id = pv.pizzeria_id
order by person_name, visit_date, pizzeria_name