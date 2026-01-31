create view v_persons_female AS
select * from person
where gender = 'female'
order by name;
create view v_persons_male AS
select * from person
where gender = 'male'
order by name;

-- select * from v_persons_female;
-- select * from v_persons_male

-- drop view v_persons_female
-- drop view v_persons_male