with person_visits_CTE(person_id, count_of_visits) as (
    select person_id, count(*) as count_of_visits
    from person_visits
    group by person_id
),
temp_CTE(person_id, count_of_visits) as (
    select
        case
            when pvc.count_of_visits > 3
            then person_id
        end as person_id,
        case
            when pvc.count_of_visits > 3
            then pvc.count_of_visits
        end as count_of_visits
    from person_visits_CTE as pvc
)
select p.name, t1.count_of_visits
from temp_CTE as t1
inner join temp_CTE as t2 on t1.person_id = t2.person_id
inner join person as p on t1.person_id = p.id