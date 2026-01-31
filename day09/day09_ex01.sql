create or replace function fnc_trg_person_update_audit() returns trigger as $person_audit$
begin
    if (TG_OP = 'UPDATE') then
        insert into person_audit(created, type_event, row_id, name, age, gender, address)
                select
                    current_timestamp,
                    'U',
                    OLD.*;
    end if;
    return null;
end;
$person_audit$ language plpgsql;

create trigger trg_person_update_audit after update
on person for each row execute function fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

-- select * from person;
-- select * from person_audit;

-- drop trigger if exists trg_person_update_audit on person;
-- drop function if exists fnc_trg_person_update_audit();