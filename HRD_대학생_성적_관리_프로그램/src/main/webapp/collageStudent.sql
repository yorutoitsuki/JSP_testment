create table student_tbl(
	studno number,
	syear char(2),
	sname varchar2(20) not null,
	address varchar2(100) not null,
	gender char(1) not null,
	tel varchar(30) not null,
	idnum char(14) not null,
	primary key(studno, syear),
	unique(idnum)
);


select * from STUDENT_TBL;

insert into STUDENT_TBL values(1001, '04', '김학생', '경북 경산시 중방동', 'F', '010-1234-1001', '970101-2000001');
insert into STUDENT_TBL values(1002, '04', '이학생', '경북 경산시 중산동', 'M', '010-1234-1002', '970201-1000001');
insert into STUDENT_TBL values(2001, '03', '최학생', '경북 경산시 옥산동', 'M', '010-1234-1003', '980301-1000001');
insert into STUDENT_TBL values(2002, '03', '박학생', '경북 경산시 삼북동', 'F', '010-1234-1004', '980401-2000001');
insert into STUDENT_TBL values(3001, '02', '유학생', '대구 광역시 수성구', 'M', '010-1234-1005', '990501-1000001');
insert into STUDENT_TBL values(3002, '02', '전학생', '대구 광역시 달서구', 'M', '010-1234-1006', '990601-1000001');
insert into STUDENT_TBL values(4001, '01', '남학생', '대구 광역시 북구', 'M', '010-1234-1007', '000701-3000001');
insert into STUDENT_TBL values(4002, '01', '여학생', '대전 광역시 유성구', 'F', '010-1234-1008', '000801-4000001');
insert into STUDENT_TBL values(4003, '01', '정학생', '경북 경산시 중앙동', 'F', '010-1234-1009', '000901-4000001');


create table grade_tbl(
	grade char(1)  not null,
	loscore number  not null,
	hiscore number  not null
);

insert into grade_tbl values('A', 90, 100);
insert into grade_tbl values('B', 80, 89);
insert into grade_tbl values('C', 70, 79);
insert into grade_tbl values('D', 60, 69);
insert into grade_tbl values('F', 0, 59);

create table score_tbl(
	studno number,
	syear char(2),
	m_subject1 number check(m_subject1 between 0 and 100),
	m_subject2 number check(m_subject2 between 0 and 100),
	m_subject3 number check(m_subject3 between 0 and 100),
	s_subject1 number check(s_subject1 between 0 and 100),
	s_subject2 number check(s_subject2 between 0 and 100),
	primary key(studno, syear)
);

insert into score_tbl values(1001, '04', 80, 90, 50, 20, 80);
insert into score_tbl values(1002, '04', 70, 80, 80, 70, 30);
insert into score_tbl values(2001, '03', 80, 80, 80, 70, 90);
insert into score_tbl values(2002, '03', 90, 80, 90, 70, 50);
insert into score_tbl values(3001, '02', 70, 60, 70, 70, 70);
insert into score_tbl values(3002, '02', 90, 50, 70, 80, 90);
insert into score_tbl values(4001, '01', 90, 80, 90, 90, 80);
insert into score_tbl values(4002, '01', 70, 60, 90, 50, 80);
insert into score_tbl values(4003, '01', 60, 80, 90, 50, 40);

drop table score_tbl;

select max(studno)+1 from student_tbl;

delete from student_tbl where 4004 <= studno and studno <= 4009;

select * from STUDENT_TBL;
select * from score_tbl;

select studno, sname, m_subject1, m_subject2, m_subject3, s_subject1, s_subject2, 
		(m_subject1 + m_subject2 + m_subject3 + s_subject1 + s_subject2),
		((m_subject1 + m_subject2 + m_subject3 + s_subject1 + s_subject2)/5),
		sum(m_subject1) over(), sum(m_subject2) over(), sum(m_subject3) over(), sum(s_subject1) over(), sum(s_subject2) over(),
		round(avg(m_subject1) over() ,1) , round(avg(m_subject2) over(),1), round(avg(m_subject3) over(),1),
		round(avg(s_subject1) over(),1), round(avg(s_subject2) over(), 1)
from STUDENT_TBL join score_tbl
using(studno);


select studno, sname, m_subject1, m_subject2, m_subject3, s_subject1, s_subject2, 
		(m_subject1 + m_subject2 + m_subject3 + s_subject1 + s_subject2),
		((m_subject1 + m_subject2 + m_subject3 + s_subject1 + s_subject2)/5)
from STUDENT_TBL join score_tbl using(studno) union all

select -1, '과목총점', sum(m_subject1), sum(m_subject2), sum(m_subject3), sum(s_subject1), sum(s_subject2), null, null
from score_tbl union all

select -1, '과목평균', round(avg(m_subject1),1) , round(avg(m_subject2),1), round(avg(m_subject3),1), round(avg(s_subject1),1), round(avg(s_subject2), 1), null, null
from score_tbl

--------------------------------------------------union_start-----------------------------------------------------------------------------
select studno, sname, m_subject1, m_subject2, m_subject3, s_subject1, s_subject2, 
		(m_subject1 + m_subject2 + m_subject3 + s_subject1 + s_subject2),
		((m_subject1 + m_subject2 + m_subject3 + s_subject1 + s_subject2)/5)
from STUDENT_TBL left outer join score_tbl
using(studno)

union

select null, '과목총점', sum(m_subject1), sum(m_subject2), sum(m_subject3), sum(s_subject1), sum(s_subject2), null, null
from score_tbl

union

select null, '과목평균', avg(m_subject1), avg(m_subject2), avg(m_subject3), avg(s_subject1), avg(s_subject2), null, null
from score_tbl
---------------------------------------------------union_end----------------------------------------------------------------------------

--union 중복제거, union all 중복제거

select * from score_tbl;
select * from grade_tbl;

delete from score_tbl where studno = 4004;

select m_subject1, m_subject2, m_subject3, s_subject1, s_subject2 from score_tbl;


------------------------------------------------------------------------------------
select  m1.grade,  m2.grade,  m3.grade,  s1.grade,  s2.grade from

(select studno, grade from score_tbl, grade_tbl
where loscore <= m_subject1 and m_subject1 <= hiscore) m1

join (select studno, grade from score_tbl, grade_tbl
where loscore <= m_subject2 and m_subject2 <= hiscore) m2 using (studno) 

join (select studno, grade from score_tbl, grade_tbl
where loscore <= m_subject3 and m_subject3 <= hiscore) m3 using (studno) 

join (select studno, grade from score_tbl, grade_tbl
where loscore <= s_subject1 and s_subject1 <= hiscore) s1 using (studno)

join (select studno, grade from score_tbl, grade_tbl
where loscore <= s_subject2 and s_subject2 <= hiscore) s2 using (studno)
order by studno
----------------------------------------------------------------------------------------



select 	sum(case when m_subject1 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject3 between loscore and hiscore then 1 else 0 end),
		sum(case when s_subject1 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end)
		from score_tbl, grade_tbl where grade = 'A' union all
select	sum(case when m_subject1 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject3 between loscore and hiscore then 1 else 0 end),
		sum(case when s_subject1 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end)
		from score_tbl, grade_tbl where grade = 'F';
		
		
select 	'성적우수자' as subject,
		sum(case when m_subject1 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject3 between loscore and hiscore then 1 else 0 end),
		sum(case when s_subject1 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end)
		from score_tbl, grade_tbl where grade = 'A' union all
select	'재수강대상자' as subject,
		sum(case when m_subject1 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject3 between loscore and hiscore then 1 else 0 end),
		sum(case when s_subject1 between loscore and hiscore then 1 else 0 end),
		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end)
		from score_tbl, grade_tbl where grade = 'F';

-------------------------------------------------------------------------------------------------
		
select 	'성적우수자' as subject,
		count(case when m_subject1 between loscore and hiscore then 1 end),
		count(case when m_subject2 between loscore and hiscore then 1 end),
		count(case when m_subject3 between loscore and hiscore then 1 end),
		count(case when s_subject1 between loscore and hiscore then 1 end),
		count(case when m_subject2 between loscore and hiscore then 1 end)
		from score_tbl, grade_tbl where grade = 'A' union all
select	'재수강대상자' as subject,
		count(case when m_subject1 between loscore and hiscore then 1 end),
		count(case when m_subject2 between loscore and hiscore then 1 end),
		count(case when m_subject3 between loscore and hiscore then 1 end),
		count(case when s_subject1 between loscore and hiscore then 1 end),
		count(case when m_subject2 between loscore and hiscore then 1 end)
		from score_tbl, grade_tbl where grade = 'F';

/*
 * sum과 count 함수 비교
 * sum(컬럼명 number) : 컬럼에 해당하는 전체 합계
 * count() : 테이블에 데이터가 몇 건이 존재하는지 확인
 * 			*count(*) 만 null 포함
 */

drop table test;
create table test(
	name varchar2(5),
	salary number,
	dept varchar2(2),
	commission number
);

insert into test values('test1', 1000, 'd1', '');
insert into test values('test2', 1000, 'd1', '');
insert into test values('test3', 2000, '', '');
insert into test values('test4', 1000, 'd2', '');
insert into test values('test5', 2000, 'd2', '');
insert into test values('test6', '', 'd2', '');

select * from test;

select count(*), count(dept), count(nvl(dept,0)), count(distinct dept)
from test;


select /*sum(*),*/ sum(salary), sum(nvl(salary,0)), sum(distinct salary)
from test;

select count(commission), sum(commission)
from test;

/*
 * sum과 avg함수 비교 설명
 */

select /*avg(*),*/
avg(salary), 
avg(nvl(salary,0)), 
avg(distinct salary)--(null 제외, 중복제외 : 1000과 2000의 평균)
from test;

count(1, null, 1, null) -> count(1, 1) : 행수 2
sum(1, null, 1, null) -> sum(1, 1) : 더하면 2

count(3, null, 4, null) -> count(3, 4) : 행수 2
sum(3, null, 4, null) -> sum(3, 4) : 더하면 7

따라서 아래 sql문은 count 대신 sum 사용 가능
그러나 sum 결과로 null 이 나올 수 있으므로 null 처리 해줘야함

--1
select case when m_subject1 >= 90 then 1 else 0 end,
case when m_subject2 >= 90 then 1 else 0 end,
case when m_subject3 >= 90 then 1 else 0 end,
case when s_subject1 >= 90 then 1 else 0 end,
case when s_subject2 >= 90 then 1 else 0 end
from score_tbl;

--2 
--sum은 null 제외 함에도 else를 넣는 이유? 전부 null이면 null을 뱉어내서
select sum(case when m_subject1 >= 90 then 1 else 0 end),
sum(case when m_subject2 >= 90 then 1 else 0 end),
sum(case when m_subject3 >= 90 then 1 else 0 end),
sum(case when s_subject1 >= 90 then 1 else 0 end),
sum(case when s_subject2 >= 90 then 1 else 0 end)
from score_tbl;


--count 이용시 반드시 else 제거, null값을 카운트 하지 않게하기 위해
select count(case when m_subject1 >= 90 then 1),
count(case when m_subject2 >= 90 then 1 ),
count(case when m_subject3 >= 90 then 1 ),
count(case when s_subject1 >= 90 then 1 ),
count(case when s_subject2 >= 90 then 1 )
from score_tbl;

--grade 테이블을 사용함, java로 처리
java.sql.ResultSetMetaData 클래스 이용
메타 데이터란 ? 저장된 데이터 그 자체는 아니지만 해당 데이터에 대한 정보를 갖고 있는 데이터를 의미한다.
즉, DB 내의 데이터에 대한 데이터의 소유, 데이터의 크기에 관련된 정보들이다.

ResultSetMetaData는 SQL로 받아온 데이터의 정보를 조회/출력하는 용도로 사용된다.
ResultSet 인터페이스 객체의 getMetaData()를 호출하여 ResultSetMetaData 인터페이스 객체를 얻으면
해당 ResultSet과 관련된 메타 데이터를 얻을 수 있다.

String sql = "Select 필드명 from 테이블명";
esultSet = rs = stmt.executeQuery(sql);
ResultSetMetaData resultMetaData = rs.getMetaData();

--성적 우수자
select count(*)
from score_tbl join grade_tbl
on(m_subject1 between loscore and hiscore)
where grade ='A';

--재수강 대상자
select count(*)
from score_tbl join grade_tbl
on(m_subject1 between loscore and hiscore)
where grade ='F';
