create index idx_menu_pizzeria_id on menu (pizzeria_id);
create index idx_person_order_person_id on person_order (person_id);
create index idx_person_order_menu_id on person_order (menu_id);
create index idx_person_visists_person_id on person_visits (person_id);
create index idx_person_visists_pizzeria_id on person_visits (pizzeria_id);


-- explain analyze select pizzeria_id from menu;
-- explain analyze select person_id, menu_id from person_order;
-- explain analyze select person_id, pizzeria_id from person_visits;