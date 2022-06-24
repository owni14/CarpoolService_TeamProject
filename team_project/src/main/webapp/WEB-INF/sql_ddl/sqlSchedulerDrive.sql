--모든 메세지 보내기
insert into message values
(seq_message.nextval ,'user01@gmail.com' ,null ,null, '1004', '시스탬 일괄 지급', sysdate, null, null);

select m.m_id, m.m_point, de.g_code,gb.g_benefit from member m, driver_evl de , grade_benefit gb
where m.m_id = de.m_id and  de.g_code = gb.g_code;

update (select m.m_id, m.m_point, de.g_code,gb.g_benefit from member m, driver_evl de , grade_benefit gb
where m.m_id = de.m_id and  de.g_code = gb.g_code
) b
	set b.m_point = 0;
--커서 생성 프로시저
CREATE OR REPLACE PROCEDURE pr_oneMonth_driverPoint
 
IS
   
BEGIN
    DECLARE
    c_id varchar2(50);
    c_point number;
    c_point_benefit number;
       
        CURSOR cr_mjoin
        IS
       select m.m_id, m.m_point,gb.g_benefit from member m, driver_evl de , grade_benefit gb
where m.m_id = de.m_id and  de.g_code = gb.g_code;

    BEGIN    
        OPEN cr_mjoin;
       
        LOOP
            FETCH cr_mjoin INTO c_id, c_point,c_point_benefit;
            EXIT WHEN cr_mjoin %NOTFOUND;
            update member set m_point=m_point+c_point_benefit where m_id=c_id ;
           
    insert into point_history (p_seq, m_id, pc_code) values (SEQ_POINT_HISTORY.nextval, c_id, '1004');
            insert into message values
(seq_message.nextval ,c_id ,null ,null, '1004', '시스템 일괄 지급 : ' || c_point_benefit || '포인트', sysdate, null, null);

            dbms_output.put_line(' c_id : ' || c_id); 
            dbms_output.put_line('c_point : ' || c_point); 
            dbms_output.put_line('c_point_benefit : ' || c_point_benefit);
                    
        END LOOP;
        
        CLOSE cr_mjoin;
        
         insert into is_update_point
	(iup_seq, iup_date, iup_what)
	values
	(seq_is_update_point.nextval, sysdate, 'D');
    END;
    commit;
END;

drop PROCEDURE pr_oneMonth_driverPoint;

exec pr_oneMonth_driverPoint;

create or replace PROCEDURE pr_oneMonthvalChk
 
IS
upcount number;
BEGIN

       select count(*) into upcount 
       from is_update_point where to_char(iup_date, 'yyyy/mm/dd')=to_char(sysdate, 'yyyy/mm/dd') and iup_what ='D';

            if upcount<=0 then
            pr_oneMonth_driverPoint;
            end if;

END;

exec pr_oneMonthvalChk;

select count(*) from is_update_point where to_char(iup_date, 'yyyy/mm/dd')=to_char(sysdate, 'yyyy/mm/dd');
--스케줄 생성시 기존생성된것과 시간을 다르게 줄것 
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        --스케줄 이름
        JOB_NAME => 'pr_driveJob'
        --언제 시작할지
        , START_DATE => TRUNC(SYSDATE)
        --반복간격
        , REPEAT_INTERVAL => 'FREQ = MINUTELY; INTERVAL = 1'
        , END_DATE => NULL
        , JOB_CLASS => 'DEFAULT_JOB_CLASS'
        , JOB_TYPE => 'PLSQL_BLOCK'
        --프로시저 입력
        , JOB_ACTION => 'BEGIN pr_oneMonthvalChk; END;'
        , COMMENTS => '운전자용 스케줄'
    );
    -- 스케줄 등록
    DBMS_SCHEDULER.ENABLE('pr_driveJob');
END;

 --스케줄 조회
 select * from user_scheduler_jobs ;
  --스케줄 지우기
 begin
   dbms_scheduler.drop_job(
 job_name => 'pr_driveJob',
 force => false) ;
end ;
/