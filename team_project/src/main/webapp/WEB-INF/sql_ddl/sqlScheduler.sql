--프로시저 만들기
CREATE OR REPLACE PROCEDURE test_1Pr()
AS
BEGIN
	--입력할곳
    update (select m.m_id, m.m_point, de.g_code,gb.g_benefit from member m, driver_evl de , grade_benefit gb
where m.m_id = de.m_id and  de.g_code = gb.g_code
) b
	set b.m_point = b.m_point + b.g_benefit;
	--입력 끝
    COMMIT;
END;

exec test_1pr;--프로시저 실행
drop PROCEDURE test_1pr;--프로시저 삭제
--스케줄러 등록
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        --스케줄 이름
        JOB_NAME => 'PR_TEST_JOB'
        --언제 시작할지
        , START_DATE => TRUNC(SYSDATE)
        --반복간격
        , REPEAT_INTERVAL => 'FREQ = MINUTELY; INTERVAL = 1'
        , END_DATE => NULL
        , JOB_CLASS => 'DEFAULT_JOB_CLASS'
        , JOB_TYPE => 'PLSQL_BLOCK'
        --프로시저 입력
        , JOB_ACTION => 'BEGIN test_1Pr; END;'
        , COMMENTS => 'JOB 등록 예제'
    );
    DBMS_SCHEDULER.ENABLE('PR_TEST_JOB');
END;

select * from user_jobs;
select * from user_scheduler_programs;
 --스케줄 조회
 select * from user_scheduler_jobs ;
 --스케줄 지우기
 begin
   dbms_scheduler.drop_job(
 job_name => 'PR_TEST_JOB',
 force => false) ;
end ;
/
--스케줄 등록
exec dbms_scheduler.enable('PR_TEST_JOB');  
--테스트용 멤버 포인트
select * from member;

(select m.m_id, m.m_point, de.g_code,gb.g_benefit from member m, driver_evl de , grade_benefit gb
where m.m_id = de.m_id and  de.g_code = gb.g_code
)
 
