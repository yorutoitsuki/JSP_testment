
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
	m_subject1 number,
	m_subject2 number,
	m_subject3 number,
	s_subject1 number,
	s_subject2 number,
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



select max(studno)+1 from student_tbl;

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



select * from score_tbl;
select * from grade_tbl;


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













































