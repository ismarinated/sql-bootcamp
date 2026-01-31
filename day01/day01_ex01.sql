select * from (
    select
        (select name from person where id = po.person_id) as object_name
    from person_order as po order by object_name
)
union all
select * from (
    select
        (select pizza_name from menu where id = po.menu_id) as object_name
    from person_order as po order by object_name
)