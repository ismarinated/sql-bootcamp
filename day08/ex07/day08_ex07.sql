--Session #1
show transaction isolation level;

--Session #2
show transaction isolation level;

--Session #1
begin;

--Session #2
begin;

--Session #1
update pizzeria set rating = 1 where id = 1;

--Session #2
update pizzeria set rating = 2 where id = 2;

--Session #1
update pizzeria set rating = 3 where id = 2;

--Session #2
update pizzeria set rating = 4 where id = 1;

--Session #1
commit;

--Session #2
commit;

--Session #1
select * from pizzeria;

--Session #2
select * from pizzeria;