select p.name, temp.count_of_visits
from (
    select person_id, count(*) as count_of_visits
    from person_visits
    group by person_id
) as temp
inner join person as p on temp.person_id = p.id
order by 2 desc, 1 asc
limit 4

-- select person_id, count(*) as count_of_visits
-- from person_visits
-- group by person_id
-- order by 2 desc, 1 asc