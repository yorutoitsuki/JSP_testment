
create table student_tbl_01(
	student_no number primary key,
	student_name varchar2(20) not null,
	student_addr varchar2(100),
	student_phone varchar2(14),
	student_birth date,
	student_email varchar2(50),
	student_id varchar2(12) unique,
	student_pw varchar2(50)
);

/*
 * unique : 중복X -> 유일한 값 = 고유값 -> 고유키(암시적 index 자동생성)
 * 			**'null('')값을 허용' 하지만 동일한 값이 저장되는 것만은 허용하지 않음
 * 			동일한 값 저장시 무결성 제약조건에 위배되어 저장안됨
 */

create sequence register_seq
start with 1
increment by 1
minvalue 1;


select student_name, nvl(student_addr,'-1'), student_phone, to_char(student_birth,'yyyy/mm/dd'), 
nvl(student_email,'-1'), nvl(student_id,'-1'), nvl(student_pw,'-1')
from student_tbl_01 where student_no = 201801

select * from student_tbl_01;

update student_tbl_01 set student_name = 'test1', student_addr = 'testCity1', student_phone = '010-9999-9999',
student_birth = to_date(19991231,'yyyy/mm/dd'), student_email = '', student_id = '', student_pw = '' 
where student_no = 201804;

select to_date(student_birth,'yyyy/mm/dd') from student_tbl_01

select * from student_tbl_01;

delete from student_tbl_01 where student_no >= 201804

select student_no, student_name, student_addr, student_phone, student_birth,
nvl(student_email,'-1'), nvl(student_id,'-1'), nvl(student_pw,'-1') from student_tbl_01;

select max(student_no) + 1 from student_tbl_01;

insert into student_tbl_01 values(201801, '이기자', '경산지 진량읍', '011222333', '01/09/26', 'abc@naver.com', '', '');
insert into student_tbl_01 values(201802, '김을동', '대구시 수성구 수성1가', '010444555', '97/05/19', 'asd@chol.net', '', '');
insert into student_tbl_01 values(201803, '김희선', '제주도 제주시 외나무골', '054111222', '02/09/06', 'qwe@gmail.com', '', '');

select * from student_tbl_01;

create table subject_tbl_01(
	subject_seq varchar2(10) primary key,
	subject_startdate date,
	subject_enddate date,
	subject_name varchar2(50),
	subject_desc clob,
	subject_teacher varchar2(12)
);


select null ,to_char(sysdate,'yyyy/mm/dd') from dual
union all select student_no, null from student_tbl_01


delete from subject_tbl_01;

insert into subject_tbl_01 values('C001','18/09/01','18/09/21','자바프로그래밍','','p04');
insert into subject_tbl_01 values('C002','18/09/05','18/09/26','안드로이드프로그래밍','','p02');
insert into subject_tbl_01 values('D001','18/10/01','18/10/21','HTML/CSS','','p04');
insert into subject_tbl_01 values('D002','18/10/01','18/10/10','운영체제','','p02');

create table register_tbl_01(
	register_seq number primary key,
	student_no number,
	subject_seq varchar2(10),
	register_date date,
	register_status char(1) default 0
);

select * from register_tbl_01;

delete from register_tbl_01;

insert into register_tbl_01 values(1,'201801','C001','18/08/30',0);
insert into register_tbl_01 values(2,'201802','C001','18/08/30',0);
insert into register_tbl_01 values(3,'201801','D001','18/09/02',1);
insert into register_tbl_01 values(4,'201803','D001','18/09/02',2);
insert into register_tbl_01 values(5,'201803','D002','18/09/03',1);

select * from student_tbl_01;
select * from subject_tbl_01;
select * from register_tbl_01;


select student_no, student_name, student_phone, student_birth,
nvl(student_email,'-1'), nvl(student_id,'-1'), nvl(student_pw,'-1') from student_tbl_01;

select student_no, count(student_no)
from student_tbl_01 join register_tbl_01
using (student_no)
group by student_no;

select * from (select student_no, student_name, student_phone, to_char(student_birth, ''),
nvl(student_email,'-1') as email , nvl(student_id,'-1') as id , nvl(student_pw,'-1') as pw from student_tbl_01)
join (select student_no, count(student_no) as LC from student_tbl_01 join register_tbl_01
using (student_no) group by student_no) using (student_no)

select student_no, student_name, student_phone, student_birth,
nvl(student_email,'-1'), nvl(student_id,'-1'), nvl(student_pw,'-1') from student_tbl_01





select student_no, student_name, student_phone, birth, email, id, pw, nvl(LC, 0)
from (select student_no, student_name, student_phone, to_char(student_birth, 'yyyy/mm/dd') as birth ,
nvl(student_email,'-1') as email , nvl(student_id,'-1') as id , nvl(student_pw,'-1') as pw from student_tbl_01)
left outer join (select student_no, count(student_no) as LC from student_tbl_01 join register_tbl_01
using (student_no) group by student_no) using (student_no);


select * from student_tbl_01;
select * from subject_tbl_01;
select * from register_tbl_01;

select register_seq, student_no, subject_name, register_date, register_status
from subject_tbl_01 sub join register_tbl_01 reg
using(subject_seq)

select register_seq, student_no, student_name, subject_name, register_date, register_status
from student_tbl_01 join
(select register_seq, student_no, subject_name, register_date, register_status
from subject_tbl_01 sub join register_tbl_01 reg
using(subject_seq))
using(student_no);


select register_seq, student_no, student_name, subject_name, register_date,
(case when register_status = '0' then '신청' 
	  when register_status = '1' then '완료'
	  when register_status = '2' then '취소'
	  else '-1' end) from student_tbl_01 join
	(select register_seq, student_no, subject_name, register_date, register_status
from subject_tbl_01 sub join register_tbl_01 reg
using(subject_seq)) using(student_no) order by register_seq desc;

select to_char(register_date,'yyyy/mm'), count(to_char(register_date,'yyyy/mm'))
from register_tbl_01
group by to_char(register_date,'yyyy/mm')



select * from register_tbl_01
delete from register_tbl_01 where student_no is null;

select -1, count(to_char(register_date,'yyyy/mm')), 
to_char(register_date,'yyyy/mm'), null, null, null from register_tbl_01
group by to_char(register_date,'yyyy/mm') union all select * from (
select register_seq, student_no, student_name, subject_name, register_date,
(case when register_status = '0' then '신청' 
	  when register_status = '1' then '완료'
	  when register_status = '2' then '취소'
	  else '-1' end) from student_tbl_01 join
	(select register_seq, student_no, subject_name, register_date, register_status
from subject_tbl_01 sub join register_tbl_01 reg
using(subject_seq)) using(student_no) order by register_seq desc);






