select p.name as name
from person_order as po
inner join menu as m on po.menu_id = m.id
inner join person as p on po.person_id = p.id
where p.gender = 'female' and m.pizza_name = 'pepperoni pizza'
intersect
select p.name as name
from person_order as po
inner join menu as m on po.menu_id = m.id
inner join person as p on po.person_id = p.id
where p.gender = 'female' and m.pizza_name = 'cheese pizza'
order by 1

-- select p.name
-- from (
--     select p.name as name
--     from person_order as po
--     inner join menu as m on po.menu_id = m.id
--     inner join person as p on po.person_id = p.id
--     where p.gender = 'female' and m.pizza_name = 'pepperoni pizza'
-- ) as p
-- inner join (
--     select p.name as name
--     from person_order as po
--     inner join menu as m on po.menu_id = m.id
--     inner join person as p on po.person_id = p.id
--     where p.gender = 'female' and m.pizza_name = 'cheese pizza'
-- ) as c on p.name = c.name
-- order by 1

-- with p_CTE (name) as (
--     select p.name as name
--     from person_order as po
--     inner join menu as m on po.menu_id = m.id
--     inner join person as p on po.person_id = p.id
--     where p.gender = 'female' and m.pizza_name = 'pepperoni pizza'
-- ),
--     c_CTE (name) as (
--     select p.name as name
--     from person_order as po
--     inner join menu as m on po.menu_id = m.id
--     inner join person as p on po.person_id = p.id
--     where p.gender = 'female' and m.pizza_name = 'cheese pizza'
-- )
-- select p.name
-- from p_CTE as p
-- inner join c_CTE as c on p.name = c.name
-- order by 1