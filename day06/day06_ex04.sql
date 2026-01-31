alter table person_discounts add constraint ch_nn_person_id check (person_id is not null);
alter table person_discounts add constraint ch_nn_pizzeria_id check (pizzeria_id is not null);
alter table person_discounts add constraint ch_nn_discount check (discount is not null);
alter table person_discounts alter column discount set default 0;
alter table person_discounts add constraint ch_range_discount check (discount >= 0 and discount <= 100);

-- alter table person_discounts drop constraint ch_nn_person_id;
-- alter table person_discounts drop constraint ch_nn_pizzeria_id;
-- alter table person_discounts drop constraint ch_nn_discount;
-- alter table person_discounts alter column discount drop default;
-- alter table person_discounts drop constraint ch_range_discount;

-- select constraint_name, constraint_type
-- from information_schema.table_constraints
-- where table_name = 'person_discounts';