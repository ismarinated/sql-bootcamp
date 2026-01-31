create unique index idx_menu_unique on menu(pizzeria_id, pizza_name);

-- set enable_seqscan to on;
set enable_seqscan to off;
explain analyze select pizzeria_id from menu