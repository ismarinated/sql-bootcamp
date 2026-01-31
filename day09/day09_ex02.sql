create or replace function fnc_trg_person_delete_audit() returns trigger as $person_audit$
begin
    if (TG_OP = 'DELETE') then
        insert into person_audit(created, type_event, row_id, name, age, gender, address)
                select
                    current_timestamp,
                    'D',
                    OLD.*;
    end if;
    return null;
end;
$person_audit$ language plpgsql;

create trigger trg_person_delete_audit after delete
on person for each row execute function fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

-- select * from person;
-- select * from person_audit;

-- drop trigger if exists trg_person_delete_audit on person;
-- drop function if exists fnc_trg_person_delete_audit();