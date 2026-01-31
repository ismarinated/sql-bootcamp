-- select date(days) as missing_date
-- from generate_series('2022-01-01', '2022-01-10', interval '1 day') as days
-- left join (
--     select *
--     from person_visits as pv
--     where pv.person_id = 1 or pv.person_id = 2
-- ) as temp
-- on days = temp.visit_date
-- where temp.person_id is null
-- order by temp.visit_date

with days_CTE (gen_date) as (
    select date(days) as gen_date
    from generate_series('2022-01-01', '2022-01-10', interval '1 day') as days
)
select gen_date as missing_date
from days_CTE
left join (
    select *
    from person_visits as pv
    where pv.person_id = 1 or pv.person_id = 2
) as pv_temp
on gen_date = pv_temp.visit_date
where pv_temp.person_id is null
order by pv_temp.visit_date