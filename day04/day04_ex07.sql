insert into person_visits(id, person_id, pizzeria_id, visit_date)
values (
    (select max(id) + 1 from person_visits),
    (select id from person where name = 'Dmitriy'),
    (
        select piz.id
        from pizzeria as piz
        inner join menu as m on piz.id = m.pizzeria_id
        inner join mv_dmitriy_visits_and_eats as mv on piz.name != mv.pizzeria_name
        where m.price < 800
        limit 1
    ),
    '2022-01-08'
);

refresh materialized view mv_dmitriy_visits_and_eats;

-- select * from mv_dmitriy_visits_and_eats