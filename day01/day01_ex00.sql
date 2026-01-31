select
    po.id as object_id,
    (select name from person where id = po.person_id) as object_name
from person_order as po
union
select
    po.id as object_id,
    (select pizza_name from menu where id = po.menu_id) as object_name
from person_order as po
order by object_id, object_name