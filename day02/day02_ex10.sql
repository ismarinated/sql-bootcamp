select a.name as person_name1, b.name as person_name2, a.address as common_address
from person as a
inner join person as b on a.address = b.address
where a.name != b.name and a.id > b.id
order by 1, 2, 3

-- with first_CTE (id, name, address) as (
--     select id, name, address from person
-- ),
--     second_CTE (id, name, address) as (
--     select id, name, address from person
-- )
-- select f.name as person_name1, s.name as person_name2, f.address as common_address
-- from first_CTE as f
-- inner join second_CTE as s on f.address = s.address
-- where f.name != s.name and f.id > s.id
-- order by 1, 2, 3