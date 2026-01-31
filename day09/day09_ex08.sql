create or replace function fnc_fibonacci(in pstop integer default 10)
returns table (num integer) as $$
with recursive cte_fibonacci(a, b) as (
    select 0 as a, 1 as b
    union all
    select b, a+b from cte_fibonacci
    where b < pstop
)
select a from cte_fibonacci;
$$ language sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();