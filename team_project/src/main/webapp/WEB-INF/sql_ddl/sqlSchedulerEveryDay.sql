create or replace PROCEDURE ps_test1
 
IS
   
BEGIN
    DECLARE
    psg_id varchar2(50);
    drv_no number;

        CURSOR cr_mjoin
        IS
        select m_id, driver_seq from passenger
        where to_char(apply_date, 'yyyy/mm/dd') = to_char(sysdate-1, 'yyyy/mm/dd')
        and is_cancel = 'N'
        and is_approve = 'Y';

    BEGIN    
        OPEN cr_mjoin;

        LOOP
            FETCH cr_mjoin INTO psg_id, drv_no;
            EXIT WHEN cr_mjoin %NOTFOUND;

             update passenger set
             drive_state = 'Y'
             where to_char(apply_date, 'yyyy/mm/dd') = to_char(sysdate-1, 'yyyy/mm/dd')
             and m_id = psg_id;
             
            update driver set
            drive_state = 'Y'
            where to_char(apply_date, 'yyyy/mm/dd') = to_char(sysdate-1, 'yyyy/mm/dd')
            and driver_seq = drv_no;
             
             update passenger_evl set
             pe_ride_count = pe_ride_count + 1
             where m_id = psg_id;
             
             ps_test2(drv_no);
             ps_test3(psg_id);
             
        END LOOP;

        CLOSE cr_mjoin;
    END;
    commit;
END;

create or replace PROCEDURE ps_test2(drv_no number)
 
IS
   
BEGIN
    DECLARE
    drv_id varchar2(50);

        CURSOR cr_mjoin
        IS

       select m_id from driver
       where driver_seq = drv_no
       and drive_state = 'Y';

    BEGIN    
        OPEN cr_mjoin;

        LOOP
            FETCH cr_mjoin INTO drv_id;
            EXIT WHEN cr_mjoin %NOTFOUND;

            update driver_evl set
            de_drive_count = de_drive_count + 1
            where m_id = drv_id;

        END LOOP;

        CLOSE cr_mjoin;
    END;

END;

create or replace PROCEDURE ps_test3(psg_id varchar2)
 
IS
code varchar2(50);
cnt number;
blck_id varchar2(50);

BEGIN

       select p.pe_ride_count, b.m_id into cnt, blck_id from passenger_evl p, blocklist b 
       where p.m_id = b.m_id(+)
       and p.m_id = psg_id; 

            if cnt = 8 then code := '1009';
            elsif cnt = 40 then code := '1008';
            elsif cnt = 100 then code := '1007';
            elsif cnt = 150 and blck_id is null then code := '1006';
            
            END if;

            update passenger_evl set
            g_code = code
            where m_id = psg_id;

END;