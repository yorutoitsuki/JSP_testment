create table employee_tbl_13(
	employee_no number primary key,
	employee_nam varchar2(20) not null,
	dept_no char(2),
	hire_date date,
	employee_status char(1)
);

insert into employee_tbl_13 values(1001, '김을동', 10, '18/02/10','1');
insert into employee_tbl_13 values(1002, '박기자', 10, '18/02/10','2');
insert into employee_tbl_13 values(1003, '최순자', 20, '18/02/11','1');
insert into employee_tbl_13 values(1004, '강하나', 20, '18/02/11','1');
insert into employee_tbl_13 values(1005, '채시라', 30, '18/03/10','1');

select * from employee_tbl_13;

select employee_nam, dept_no, to_char(hire_date,'yyyy-MM-dd'), employee_status
from employee_tbl_13 where employee_no =

update employee_tbl_13 set hire_date = '20220929'
where employee_no = 1006

select employee_nam, dept_no, to_char(hire_date,'yyyy-MM-dd'), employee_status
from employee_tbl_13;

create table work_tbl_13(
	work_date char(8),
	employee_no number,
	work_in_time varchar(4),
	work_out_time varchar(4),
	primary key(work_date, employee_no)
);

delete from work_tbl_13;

insert into work_tbl_13 values('20180901', '1001','0910','1510');
insert into work_tbl_13 values('20180902', '1001','0910','1510');
insert into work_tbl_13 values('20180903', '1001','0910','1520');
insert into work_tbl_13 values('20180904', '1001','0810','1610');
insert into work_tbl_13 values('20180907', '1001','0910','1630');
insert into work_tbl_13 values('20180908', '1001','0900','1500');
insert into work_tbl_13 values('20180909', '1001','0930','1500');
insert into work_tbl_13 values('20180911', '1001','0920','1540');
insert into work_tbl_13 values('20180912', '1001','0900','1500');
insert into work_tbl_13 values('20180911', '1003','1210','1710');
insert into work_tbl_13 values('20180912', '1003','1210','1710');
insert into work_tbl_13 values('20180913', '1003','1210','1720');
insert into work_tbl_13 values('20180914', '1003','1210','1710');
insert into work_tbl_13 values('20180915', '1003','1210','1730');
insert into work_tbl_13 values('20180916', '1003','1200','1700');
insert into work_tbl_13 values('20180917', '1003','1230','1700');
insert into work_tbl_13 values('20180918', '1003','1220','1740');

create table work_tbl_13_2(
	work_date char(8),
	employee_no number,
	work_in_time varchar(4),
	work_out_time varchar(4),
	primary key(work_date, employee_no)
);

insert into work_tbl_13_2 values('20180901', '1001','1910','0510');
insert into work_tbl_13_2 values('20180902', '1001','1910','0510');
insert into work_tbl_13_2 values('20180903', '1001','1910','0520');
insert into work_tbl_13_2 values('20180904', '1001','1810','0610');
insert into work_tbl_13_2 values('20180907', '1001','1910','0630');
insert into work_tbl_13_2 values('20180908', '1001','1900','0500');
insert into work_tbl_13_2 values('20180909', '1001','1930','0500');
insert into work_tbl_13_2 values('20180911', '1001','1920','0540');
insert into work_tbl_13_2 values('20180912', '1001','1900','0500');
insert into work_tbl_13_2 values('20180911', '1003','1210','1710');
insert into work_tbl_13_2 values('20180912', '1003','1210','1710');
insert into work_tbl_13_2 values('20180913', '1003','1210','1720');
insert into work_tbl_13_2 values('20180914', '1003','1210','1710');
insert into work_tbl_13_2 values('20180915', '1003','1210','1730');
insert into work_tbl_13_2 values('20180916', '1003','1200','1700');
insert into work_tbl_13_2 values('20180917', '1003','1230','1700');
insert into work_tbl_13_2 values('20180918', '1003','1220','1740');



select a.*, to_char(hire_date,'yyyy-MM-dd') ,decode(employee_status,'1','입사','2','퇴사','3','휴직')
from employee_tbl_13 a order by employee_no

select * from work_tbl_13 order by work_date;

select work_date, employee_no,  (round(work_out_time/100)-round(work_in_time/100)),substr(work_out_time,3)-substr(work_in_time,3) from work_tbl_13;

select substr(work_date,1,6), 
employee_no, sum((round(work_out_time/100)-round(work_in_time/100))), 
sum((substr(work_out_time,3)-substr(work_in_time,3)))
from work_tbl_13 group by (substr(work_date,1,6),employee_no) order by employee_no desc


select * from work_tbl_13_2 order by work_date;

select substr(work_date,1,6), 
employee_no, sum((24-round(work_in_time/100)+round(work_out_time/100))),
sum((substr(work_out_time,3)-substr(work_in_time,3)))
from work_tbl_13_2 group by (substr(work_date,1,6),employee_no) order by employee_no desc


select substr(work_date,1,6), employee_no, 
--case로 선별된 시간들을 sum 하겠다.
--sum 함수 내에 case가 존재함
sum(case when work_in_time > work_out_time then --출근 시간이 더 클 경우 저녁출근
((24-round(work_in_time/100)+round(work_out_time/100))) 
--24시 빼기 출근시간 = 밤에 일한 시간, 그리고 퇴근시간은 0시에서 퇴근시간 까지 일한것과 같음 
--고로 24시 - 출근시간 + 퇴근시간
else ((round(work_out_time/100)-round(work_in_time/100))) end), --출근시간이 퇴근시간 보다 작으면, 아침출근
--분 단위를 처리하는 sum
sum((substr(work_out_time,3)-substr(work_in_time,3)))
from work_tbl_13_2 group by (substr(work_date,1,6),employee_no) 
order by employee_no desc














