with recursive nodes as(
	select point1 as path,
	point1,
	point2,
	cost
	from roads
	where point1='a'
	union
	select concat(nodes.path,',',roads.point1) as path,
	roads.point1,
	roads.point2,
	nodes.cost+roads.cost
	from nodes
	join roads on roads.point1=nodes.point2
	where path not like concat('%',roads.point1,'%')
)
select cost as total_cost,
	concat('{', path,',a}') as tour
from nodes
where length(path)=7 and point2='a' and 
	cost=(select cost from nodes where length(path)=7 and point2='a' order by cost limit 1)
union all
select cost as total_cost,
	concat('{', path,',a}') as tour
from nodes
where length(path)=7 and point2='a' and 
	cost=(select cost from nodes where length(path)=7 and point2='a' order by cost desc limit 1)
order by total_cost,tour;