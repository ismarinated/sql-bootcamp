select
    address,
    round(max(age::numeric) - (min(age::numeric) / max(age::numeric)), 2) as formula,
    round(avg(age::numeric), 2) as average,
    case
        when round(max(age::numeric) - (min(age::numeric) / max(age::numeric)), 2) > cast(avg(age::numeric) as float)
        then true
        else false
    end as comparison
from person
group by address
order by 1