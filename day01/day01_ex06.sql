-- select order_date as action_date, person_id from person_order
-- intersect
-- select visit_date as action_date, person_id from person_visits
-- order by action_date asc, person_id desc


select * from (
    select po.order_date as action_date, p.id, p.name as person_name from person_order as po
    join person as p on p.id = po.person_id
)
intersect
select * from (
    select pv.visit_date as action_date, p.id, p.name as person_name from person_visits as pv
    join person as p on p.id = pv.person_id
)
order by action_date asc, person_name desc