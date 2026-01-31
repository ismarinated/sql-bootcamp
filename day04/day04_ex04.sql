create view v_symmetric_union as
select * from (
    select person_id
    from person_visits
    where visit_date = '2022-01-02'
    except all
    select person_id
    from person_visits
    where visit_date = '2022-01-06'
)
union all
select * from (
    select person_id
    from person_visits
    where visit_date = '2022-01-06'
    except all
    select person_id
    from person_visits
    where visit_date = '2022-01-02'
)
order by 1

-- select * from v_symmetric_union