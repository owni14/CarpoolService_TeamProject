create or replace PROCEDURE pr_everyday_info
 
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
             
             pr_everyday_get_drv_id(drv_no);
             pr_everyday_update_grade_passenger(psg_id);
             
        END LOOP;

        CLOSE cr_mjoin;
    END;
    commit;
END;

create or replace PROCEDURE pr_everyday_update_grade_passenger(psg_id varchar2)
 
IS
code varchar2(50);
cnt number;
blck_id varchar2(50);

BEGIN

       select p.pe_ride_count, b.m_id into cnt, blck_id from passenger_evl p, blocklist b 
       where p.m_id = b.m_id(+)
       and p.m_id = psg_id; 

            
            if cnt >= 150 and blck_id is null then code := '1006';
            elsif cnt >= 100 then code := '1007';
            elsif cnt >= 40 then code := '1008';
            elsif cnt >= 8 then code := '1009';
            else code := '1010';
            
            END if;

            update passenger_evl set
            g_code = code
            where m_id = psg_id;
  
END;

create or replace PROCEDURE pr_everyday_get_drv_id(drv_no number)
 
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
            
            dbms_output.put_line(' drv_id : ' || drv_id); 

            update driver_evl set
            de_drive_count = de_drive_count + 1
            where m_id = drv_id;

           pr_everyday_update_grade_driver(drv_id);
        END LOOP;

        CLOSE cr_mjoin;
    END;
 
END;

create or replace PROCEDURE pr_everyday_update_grade_driver(drv_id varchar2)
 
IS
code varchar2(50);
cnt number;
blck_id varchar2(50);
evl1 number;
evl2 number;
evl3 number;
evl4 number;
evl5 number;
evl_count number;
evl_avg number;
BEGIN

       select d.de_drive_count, b.m_id, d.evl1, d.evl2, d.evl3, d.evl4, d.evl5, d.evl_count into cnt, blck_id, evl1, evl2, evl3, evl4, evl5, evl_count
       from driver_evl d, blocklist b 
       where d.m_id = b.m_id(+)
       and d.m_id = drv_id; 
       
      
       if (evl_count > 0) then evl_avg := ((evl1 * 1) + (evl2 * 2) + (evl3 * 3) + (evl4 * 4) + (evl5 * 5)) / (evl_count);
       elsif(evl_count <= 0) then evl_avg := 0;
       END if;
       --evl_avg := ((evl1 * 1) + (evl2 * 2) + (evl3 * 3) + (evl4 * 4) + (evl5 * 5)) / (evl_count);--
       
             
            if cnt >= 65 and blck_id is null and 4.5 <= evl_avg
                then code := '1001';
            elsif cnt >= 50 and 4 <= evl_avg
                then code := '1002';
            elsif cnt >= 35 and 3.5 <= evl_avg
                then code := '1003';
            elsif cnt >= 8 and 3.0 <= evl_avg
                then code := '1004';
            else code := '1005';
            
          

            END if;
            
            dbms_output.put_line(' cnt : ' || cnt); 
            dbms_output.put_line(' evl_avg : ' || evl_avg); 
            
            update driver_evl set
            g_code = code
            where m_id = drv_id;

END;

-- 스케쥴러
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        --스케줄 이름
        JOB_NAME => 'JOB_EVERY'
        --언제 시작할지
        , START_DATE => TRUNC(SYSDATE)
        --반복간격(지금은 1분간격으로 실행)
        , REPEAT_INTERVAL => 'FREQ = DAILY; BYHOUR = 10'
        , END_DATE => NULL
        , JOB_CLASS => 'DEFAULT_JOB_CLASS'
        , JOB_TYPE => 'PLSQL_BLOCK'
        --프로시저 입력
        , JOB_ACTION => 'BEGIN pr_everyday_info; END;'
        , COMMENTS => '매일 10시에 실행할 스케줄러'
    );
    DBMS_SCHEDULER.ENABLE('JOB_EVERY');
END;
