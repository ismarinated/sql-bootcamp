create or replace function fnc_person_visits_and_eats_on_date(
    in pperson varchar default 'Dmitriy',
    in pprice numeric default 500,
    in pdate date default '2022-01-08')
returns table (
        name varchar
) as $$
begin
return query
select
    piz.name
    from person_visits as pv
    inner join person_order as po on po.person_id = pv.person_id and pv.visit_date = po.
    inner join pizzeria as piz on pv.pizzeria_id = piz.id
    inner join menu as m on m.id = po.menu_id and m.pizzeria_id = piz.id
    inner join person as p on p.id = po.person_id and p.id = pv.person_id
    where 
        p.name = pperson and
        pv.visit_date = pdate and
        m.price < pprice;
end;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

-- select * from person_visits where visit_date = '2022-01-01';
-- select * from person_order where order_date = '2022-01-01';

-- drop function if exists fnc_person_visits_and_eats_on_date();