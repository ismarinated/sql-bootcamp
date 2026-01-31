with popular_visits_CTE(name, count) as (
    select name, count(*) as count
    from person_visits as pv
    inner join pizzeria as piz on pv.pizzeria_id = piz.id
    group by name
    order by 2 desc
),
popular_order_CTE(name, count) as (
    select name, count(*) as count
    from person_order as po
    inner join menu as m on po.menu_id = m.id
    inner join pizzeria as piz on m.pizzeria_id = piz.id
    group by name
    order by 2 desc
)
select
    piz.name,
    case
        when sum(count) is null then 0
        else sum(count)
    end as total_count
from (
    select name, count, 'order' as action_type
    from popular_order_CTE as poc
    union
    select name, count, 'visit' as action_type
    from popular_visits_CTE as pvc
    order by 3 asc, 2 desc
) as union_cte
right join pizzeria as piz on union_cte.name = piz.name
group by piz.name
order by 2 desc, 1 asc