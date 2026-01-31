-- select name, rating
-- from pizzeria
-- where id not in (
--     select pizzeria_id from person_visits
-- )

select name, rating
from pizzeria as piz
left join person_visits as pv on piz.id = pv.pizzeria_id
where pv.id is null