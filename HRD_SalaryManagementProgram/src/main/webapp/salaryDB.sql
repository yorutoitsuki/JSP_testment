create table employee_tbl_13(
	employee_no number primary key,
	employee_nam varchar2(20) not null,
	dept_no char(2),
	hire_date date,
	employee_status char(1)
);

insert into employee_tbl_13 values(1001, '김을동', 10, '18/02/10','1');
insert into employee_tbl_13 values(1002, '박기자', 10, '18/02/10','2');
insert into employee_tbl_13 values(1003, '최순자', 20, '18/02/10','1');
insert into employee_tbl_13 values(1004, '강하나', 20, '18/02/10','1');
insert into employee_tbl_13 values(1005, '채시라', 30, '18/02/10','1');

select * from employee_tbl_13






























