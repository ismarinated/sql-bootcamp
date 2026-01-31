create table person_audit (
    created timestamp with time zone not null default current_timestamp,
    type_event char(1) default 'I' not null,
    constraint ch_type_event check (type_event in ('I', 'U', 'D'))
    row_id bigint not null,
    name varchar,
    age integer,
    gender varchar,
    address varchar,
);

create or replace function fnc_trg_person_insert_audit() returns trigger as $person_audit$
begin
    if (TG_OP = 'INSERT') then
        insert into person_audit
            select
                current_timestamp,
                'I',
                new.*;
    end if;
    return null;
end;
$person_audit$ language plpgsql;

create trigger trg_person_insert_audit after insert
on person for each row execute function fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- select * from person;
-- select * from person_audit;