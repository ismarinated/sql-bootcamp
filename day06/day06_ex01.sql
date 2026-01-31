insert into person_discounts
    select 
        row_number() over () as id,
        person_id,
        pizzeria_id,
        case
            when cnt = 1 then 10.5
            when cnt = 2 then 22
            else 30
        end as discount
    from (
        select po.person_id, m.pizzeria_id, count(po.person_id) as cnt
        from person_order as po
        inner join menu as m on po.menu_id = m.id
        group by po.person_id, m.pizzeria_id
    )