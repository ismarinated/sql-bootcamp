comment on table person_discounts is 'Реляционная таблица, хранящая информацию о персональных скидках';
comment on column person_discounts.id is 'Первичный ключ';
comment on column person_discounts.person_id is 'Внешний ключ к таблице person';
comment on column person_discounts.pizzeria_id is 'Внешний ключ к таблице pizzeria';
comment on column person_discounts.discount is 'Аттрибут, значение скидки в процентах';