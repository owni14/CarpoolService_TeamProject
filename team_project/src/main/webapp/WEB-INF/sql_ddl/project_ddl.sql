--멤버
create table member (
m_id 	varchar2(50)	primary key,
m_name	varchar2(50)	not null,
m_pw 	varchar2(32)	not null,
gender	varchar2(1)	not null,
m_company	varchar2(50)	not null,
m_dept	varchar2(20)	default null,
m_is_drop 	varchar2(1) default 'N' not null,
m_point 	number	default 0,
m_evl 	number	default 0,
m_blackpoint	number	default 0,
m_joindate	date	default sysdate,
m_is_smoke	char(1)	default 'N' not null,
m_address	varchar2(1000)	not null,
m_cellphone	varchar2(11)	not null
);
--자동차정보
create table carinfo(
ci_code 	char(4)	primary key,
ci_name 	varchar2(50)	not null,
ci_brand 	varchar2(25)	not null,
ci_brand_img  	varchar2(300)	not null,
ci_car_img 	varchar2(300)	not null,
ci_people_count	number	check (ci_people_count between 2 and 4)
);
--차량
create table car(
c_no 	varchar2(50)	 primary key,
c_code 	char(4) 	references carinfo(ci_code) not null,
m_id 	varchar2(50)	references member(m_id) not null,
c_is_driver 	char(1)	default 'N' not null,
c_approvedate	date	default sysdate
);
--포인트 내역
create table point_history (
p_seq	number	primary key,
m_id	varchar2(50)	references member(m_id),
pc_code	char(4)	references point_code(pc_code),
p_date	date	default sysdate
);
--포인트 코드
create table point_code (
pc_code	char(4)	primary key,
pc_desc	varchar2(100)	not null,
pc_point	number	default 0
);
-- 운전자
create table driver (
driver_seq  	number	primary key,
m_id  	varchar2(50)	references member(m_id),
driver_depart_location   	varchar2(1000)	not null,
driver_is_smoke   	char(1)	default 'N',
driver_comment  	varchar2(100),
driver_depart_time   	varchar2(100)	not null 
);
--동승자
create table passenger (
passenger_seq   	number	primary key,
m_id  	varchar2(50)	references member(m_id),
passenger_depart_location  	varchar2(1000)	not null,
passenger_depart_time   	varchar2(100)	not null,
driver_seq   	number	references driver(driver_seq)
);
--관리자
create table admin (
admin_code	varchar2(300)	primary key,
admin_regdate	date	default sysdate	
);
--이벤트
create table event (
event_seq	number	primary key,
event_name	varchar2(100)	not null,
event_startdate	date	default sysdate,
event_enddate	date	default sysdate + 7,
event_content	varchar2(4000)	not null,
event_is_finish	char(1)	default 'N',
event_img	varchar2(500),
event_max_count	number	default 10,
event_point	number	default 500
);
--이벤트 당첨자
create table event_winner (
e_winner_seq	number	primary key,
m_id  	varchar2(50)	references member(m_id),
event_seq	number	references event(event_seq),
e_winner_is_get	char(1)	default 'N'
);
--운전 승인 대기자
create table approve_wait(
aw_seq  	number	primary key,
aw_license_img 	varchar2(300)	not null,
m_id 	varchar2(50)	references  member(m_id),
aw_regdate 	date	default sysdate

);
-- 문의
create table complain (
complain_seq	number	primary key,
admin_code	varchar2(300)	references admin(admin_code),
m_id  	varchar2(50)	references  member(m_id),
complain_content	varchar2(4000)	not null,
complain_regdate	date	default sysdate,
complain_group	number	default 0,
complain_attach_file	varchar2(500),
complain_classification	varchar2(100)	not null
);

--신고
create table blacklist (
blackList_seq	number	primary key,
m_id  	varchar2(50)	references  member(m_id),
black_m_id  	varchar2(50)	references  member(m_id),
black_content 	varchar2(4000)	not null,
black_is_processed	char(1)	default 'N',
black_regdate	date	default sysdate
);

--이벤트 참가 리스트 자동으로 만들기
create table event_participation_event_seq1(
	ep_seq	number	primary key,
m_id varchar2(50)	references  member(m_id),
event_seq	number	references  event(event_seq),
ep_is_winner	char(1)	default 'N'

);

<<<<<<< HEAD
-- 쪽지 
create table message (
    message_seq number primary key,
    receiver_m_id varchar2(50) references member(m_id),
    receiver_admin_code varchar2(300) references admin(admin_code),
    sender_m_id varchar2(50) references member(m_id),
    sender_admin_code varchar2(300) references admin(admin_code),
    content varchar2(2000) not null,
    senddate date default sysdate,
    opendate date null

--faq
create table faq (
faq_seq number primary key,
faq_title varchar2(500) not null,
faq_content varchar2(4000) not null
);

--sequence

create sequence seq_point_history;
create sequence seq_driver;
create sequence seq_passenger;
create sequence seq_event;
create sequence seq_event_winner;
create sequence seq_approve_wait;
create sequence seq_complain;
create sequence seq_blacklist;

create sequence seq_message;

create sequence seq_faq;

--동적 시퀀스
create sequence seq_event_participation;