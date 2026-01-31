with temp_CTE(id) as (
    select f_cnt.p_id
    from (
        select pv.pizzeria_id as p_id, count(*) as cnt
        from person_visits as pv
        inner join person as p on pv.person_id = p.id
        where p.gender = 'female'
        group by pv.pizzeria_id
    ) as f_cnt inner join (
        select pv.pizzeria_id as p_id, count(*) as cnt
        from person_visits as pv
        inner join person as p on pv.person_id = p.id
        where p.gender = 'male'
        group by pv.pizzeria_id
    ) as m_cnt on f_cnt.p_id = m_cnt.p_id and f_cnt.cnt = m_cnt.cnt
), temp_ex_CTE(id) as (
    select piz.id from pizzeria as piz
    except
    select piz.id from pizzeria as piz
    inner join person_visits as pv on piz.id = pv.pizzeria_id
)
select name as pizzeria_name from pizzeria
where id not in (select * from temp_CTE)
    and id not in (select * from temp_ex_CTE)
order by 1

-- select * from (
--     select piz.name as pizzeria_name
--     from person_visits as pv
--     inner join person as p on pv.person_id = p.id
--     inner join pizzeria as piz on pv.pizzeria_id = piz.id
--     where p.gender = 'female'
--     except all
--     select piz.name as pizzeria_name
--     from person_visits as pv
--     inner join person as p on pv.person_id = p.id
--     inner join pizzeria as piz on pv.pizzeria_id = piz.id
--     where p.gender = 'male'
-- )
-- union all
-- select * from (
--     select piz.name as pizzeria_name
--     from person_visits as pv
--     inner join person as p on pv.person_id = p.id
--     inner join pizzeria as piz on pv.pizzeria_id = piz.id
--     where p.gender = 'male'
--     except all
--     select piz.name as pizzeria_name
--     from person_visits as pv
--     inner join person as p on pv.person_id = p.id
--     inner join pizzeria as piz on pv.pizzeria_id = piz.id
--     where p.gender = 'female'
-- )
-- order by 1