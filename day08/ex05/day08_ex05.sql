--Session #1
show transaction isolation level;

--Session #2
show transaction isolation level;

--Session #1
begin transaction isolation read committed;

--Session #2
begin transaction isolation read committed;

--Session #1
select sum(rating) from pizzeria;

--Session #2
insert into pizzeria values(10, 'Kazan Pizza', 5);
commit;

--Session #1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

--Session #2
select sum(rating) from pizzeria;