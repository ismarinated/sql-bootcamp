select name from pizzeria
where id not in (
    select pizzeria_id from person_visits
)

select name from pizzeria as p
where not EXISTS (
    select *
    from person_visits as pv
    where p.id = pv.pizzeria_id
)