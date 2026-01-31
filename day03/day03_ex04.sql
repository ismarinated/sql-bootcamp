select * from (
    select piz.name as pizzeria_name
    from menu as m
    inner join person_order as po on m.id = po.menu_id
    inner join person as p on po.person_id = p.id
    inner join pizzeria as piz on m.pizzeria_id = piz.id
    where p.gender = 'female'
    except
    select piz.name as pizzeria_name
    from menu as m
    inner join person_order as po on m.id = po.menu_id
    inner join person as p on po.person_id = p.id
    inner join pizzeria as piz on m.pizzeria_id = piz.id
    where p.gender = 'male'
)
union
select * from (
    select piz.name as pizzeria_name
    from menu as m
    inner join person_order as po on m.id = po.menu_id
    inner join person as p on po.person_id = p.id
    inner join pizzeria as piz on m.pizzeria_id = piz.id
    where p.gender = 'male'
    except
    select piz.name as pizzeria_name
    from menu as m
    inner join person_order as po on m.id = po.menu_id
    inner join person as p on po.person_id = p.id
    inner join pizzeria as piz on m.pizzeria_id = piz.id
    where p.gender = 'female'
)
order by 1