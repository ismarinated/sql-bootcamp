-- select person_id, order_date from person_order
-- where order_date = '2022-01-07'

-- select person_id, visit_date from person_visits
-- where visit_date = '2022-01-07'

select * from (
    select person_id, order_date from person_order
    where order_date = '2022-01-07'
)
except all
select * from (
    select person_id, visit_date from person_visits
    where visit_date = '2022-01-07'
)