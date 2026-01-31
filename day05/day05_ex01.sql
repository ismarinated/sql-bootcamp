-- set enable_seqscan to on;
set enable_seqscan to off;
explain analyze
select m.pizza_name as pizza_name, piz.name as pizzeria_name
from menu as m
inner join pizzeria as piz on m.pizzeria_id = piz.id