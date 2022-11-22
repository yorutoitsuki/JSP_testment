



create table USER_TBLE_08(
	USER_NO CHAR(5) PRIMARY KEY,
	USER_NAME VARCHAR2(50) NOT NULL,
	USER_PW VARCHAR2(50),
	DEPT_NO CHAR(3),
	USER_GBN CHAR(2),
	REG_DATE DATE
);

select max(USER_NO) + 1 from USER_TBLE_08

select case when DEPT_NO = 'A01' then '인사'
			 when DEPT_NO ='A02' then '개발'
	 		when DEPT_NO =  'B01' then '총무'
	 		when DEPT_NO =  'B02' then '회계'
	 		end as DEPT_NO from USER_TBLE_08

select case DEPT_NO when 'A01' then '인사'
			 when 'A02' then '개발'
	 		when 'B01' then '총무'
	 		when 'B02' then '회계' from USER_TBLE_08
	 		
 select user_no, user_name,
 case when DEPT_NO ='A01' then '인사'
 	  when DEPT_NO ='A02' then '개발'
  	  when DEPT_NO ='B01' then '총무'
 	  when DEPT_NO ='B02' then '회계'
 	  else ' ' end as DEPT_NO,
 USER_GBN, to_char(REG_DATE,'YYYY/MM/DD') as REG_DATE 
 from USER_TBLE_08

INSERT INTO USER_TBLE_08 values(10001, '홍길동', '1111', 'A01', 'U1' , to_date('18/01/10','YY/MM/DD'));
INSERT INTO USER_TBLE_08 values(10002, '김유신', '1111', 'A02', 'U1' , to_date('18/02/10','YY/MM/DD'));
INSERT INTO USER_TBLE_08 values(10003, '이순신', '1111', null, 'U2' , to_date('18/03/10','YY/MM/DD'));

create table dept_auth_tbl_08(
	dept_no char(3),
	menu_no number,
	primary key(dept_no, menu_no)
);

insert into dept_auth_tbl_08 values('A01', 10);
insert into dept_auth_tbl_08 values('A01', 11);
insert into dept_auth_tbl_08 values('A02', 12);
insert into dept_auth_tbl_08 values('A02', 13);

create table usert_auth_tbl_08(
	user_no char(5),
	menu_no number,
	primary key(user_no, menu_no)
);

메뉴번호 메뉴명
10	부서관리
11	사원관리
12	기초정보관리
13	급여계산

create sequence user_tbl_08_seq
start with 10001
increment by 1
minvalue 10001;

user_tbl_08_seq.currval from 

insert into usert_auth_tbl_08 values('10001','12');
insert into usert_auth_tbl_08 values('10003','13');


select * from USER_TBLE_08
select * from dept_auth_tbl_08
select * from usert_auth_tbl_08

select user_no, user_name, menu_no, case menu_no 
when 10 then '부서관리' when 11 then '사원관리'
when 12 then '기초정보관리' when 13 then '급여계산'
end as menu_name from (
	select USER_NO, USER_NAME, menu_no
	from USER_TBLE_08 a cross join dept_auth_tbl_08 b
	where a.DEPT_NO = b.DEPT_NO
	union all
	select c.USER_NO, USER_NAME,menu_no
	from USER_TBLE_08 c cross join usert_auth_tbl_08 d
	where c.USER_NO = d.USER_NO
	order by user_no, menu_no );

select USER_NO, USER_NAME, menu_no
from USER_TBLE_08 a cross join dept_auth_tbl_08 b
where a.DEPT_NO = b.DEPT_NO
union all
select c.USER_NO, USER_NAME,menu_no
from USER_TBLE_08 c cross join usert_auth_tbl_08 d
where c.USER_NO = d.USER_NO
order by user_no, menu_no


select * from usert_auth_tbl_08
























