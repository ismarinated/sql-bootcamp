insert into person_order (id, person_id, menu_id, order_date)
select 
    generate_series((select max(id) from person_order) + 1, (select max(id) from person_order) + max(p.id)),
    generate_series(min(p.id), max(p.id)),
    (select id from menu where pizza_name = 'greek pizza'),
    '2022-02-25'
from person as p