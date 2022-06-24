--동승자 vvip 만 포인트 지급
select m.m_id, m.m_point, gb.g_benefit from member m, passenger_evl pe , grade_benefit gb
where m.m_id = pe.m_id and  pe.g_code = gb.g_code and pe.g_code='1006';


update (select m.m_id, m.m_point, de.g_code,gb.g_benefit from member m, driver_evl de , grade_benefit gb
where m.m_id = de.m_id and  de.g_code = gb.g_code
) b
	set b.m_point = 0;
--커서 생성 프로시저
CREATE OR REPLACE PROCEDURE pr_oneMonth_passenger
 
IS
   
BEGIN
    DECLARE
    c_id varchar2(50);
    c_point number;
    c_point_benefit number;
       
        CURSOR cr_joinPassenger
        IS
       select m.m_id, m.m_point, gb.g_benefit from member m, passenger_evl pe , grade_benefit gb
where m.m_id = pe.m_id and  pe.g_code = gb.g_code and pe.g_code='1006';

    BEGIN    
        OPEN cr_joinPassenger;
       
        LOOP
            FETCH cr_joinPassenger INTO c_id, c_point,c_point_benefit;
            EXIT WHEN cr_joinPassenger %NOTFOUND;
            update member set m_point=m_point+c_point_benefit where m_id=c_id ;
           
    insert into point_history (p_seq, m_id, pc_code) values (SEQ_POINT_HISTORY.nextval, c_id, '1005');
            insert into message values
(seq_message.nextval ,c_id ,null ,null, '1004', '시스템 일괄 지급 : ' || c_point_benefit || '포인트', sysdate, null, null);

            dbms_output.put_line(' c_id : ' || c_id); 
            dbms_output.put_line('c_point : ' || c_point); 
            dbms_output.put_line('c_point_benefit : ' || c_point_benefit);
                    
        END LOOP;
        
        CLOSE cr_joinPassenger;
        
         insert into is_update_point
	(iup_seq, iup_date, iup_what)
	values
	(seq_is_update_point.nextval, sysdate, 'P');
    END;
    commit;
END;

drop PROCEDURE pr_oneMonth_passenger;

exec pr_oneMonth_passenger;

create or replace PROCEDURE pr_oneMonthPassengervalChk
 
IS
upcount number;
BEGIN

       select count(*) into upcount
       from is_update_point where to_char(iup_date, 'yyyy/mm/dd')=to_char(sysdate, 'yyyy/mm/dd') and iup_what ='P';

            if upcount<=0 then
            pr_oneMonth_passenger;
            end if;

END;

exec pr_oneMonthPassengervalChk;

select count(*) from is_update_point where to_char(iup_date, 'yyyy/mm/dd')=to_char(sysdate, 'yyyy/mm/dd') and iup_what ='P';

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        --스케줄 이름
        JOB_NAME => 'pr_passengerJob'
        --언제 시작할지
        , START_DATE => TRUNC(SYSDATE)
        --반복간격
        , REPEAT_INTERVAL => 'FREQ = MINUTELY; INTERVAL = 2'
        , END_DATE => NULL
        , JOB_CLASS => 'DEFAULT_JOB_CLASS'
        , JOB_TYPE => 'PLSQL_BLOCK'
        --프로시저 입력
        , JOB_ACTION => 'BEGIN pr_oneMonthPassengervalChk; END;'
        , COMMENTS => '승객용 스케줄'
    );
    -- 스케줄 등록
    DBMS_SCHEDULER.ENABLE('pr_passengerJob');
END;

 --스케줄 조회
 select * from user_scheduler_jobs ;
  --스케줄 지우기
 begin
   dbms_scheduler.drop_job(
 job_name => 'pr_passengerJob',
 force => false) ;
end ;
/