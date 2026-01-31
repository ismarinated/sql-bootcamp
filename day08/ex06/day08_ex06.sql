--Session #1
show transaction isolation level;

--Session #2
show transaction isolation level;

--Session #1
begin transaction isolation level repeatable read;

--Session #2
begin transaction isolation level repeatable read;

--Session #1
select sum(rating) from pizzeria;

--Session #2
insert into pizzeria values(11, 'Kazan Pizza 2', 4);
commit;

--Session #1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

--Session #2
select sum(rating) from pizzeria;