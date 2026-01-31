Select distinct p.name
from person_order as po
inner join person as p on po.person_id = p.id
order by 1