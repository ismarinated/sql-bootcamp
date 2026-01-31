select date(days) as missing_date
from generate_series('2022-01-01', '2022-01-10', interval '1 day') as days
left join (
    select *
    from person_visits as pv
    where pv.person_id = 1 or pv.person_id = 2
) as temp
on days = temp.visit_date
where temp.person_id is null
order by temp.visit_date

-- select days :: date
-- from generate_series('2022-01-01', '2022-01-12', interval '1 day') as days

-- select date(days)
-- from generate_series('2022-01-01', '2022-01-12', interval '1 day') as days