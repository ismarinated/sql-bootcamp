create view v_generated_dates AS
select date(days) as generated_date
from generate_series('2022-01-01', '2022-01-31', interval '1 day') as days
order by generated_date

-- select * from v_generated_dates

-- drop view v_generated_dates