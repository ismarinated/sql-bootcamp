select id as menu_id
from menu
except
select po.menu_id
from person_order as po
order by 1