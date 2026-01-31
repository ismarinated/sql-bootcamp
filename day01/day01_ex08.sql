-- select po.order_date, concat(p.name, ' (age:', p.age, ')') as person_information
-- from person_order as po
-- join person as p on p.id = po.person_id
-- order by po.order_date asc, person_information asc

select po.order_date, concat(p.name, ' (age:', p.age, ')') as person_information
from person_order as po
natural JOIN
    (select name, id as person_id, age from person) as p
order by po.order_date asc, person_information asc