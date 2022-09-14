create table examtbl_1(
	syear char(1),
	sclass char(2),
	sno char(2),
	sname varchar2(20),
	birth char(8),
	gender char(1),
	tel1 char(3),
	tel2 char(4),
	tel3 char(4),
	primary key(syear, sclass, sno)
);

select * from examtbl_1;
delete from examtbl_1;

insert into examtbl_1 values('1','01','01','김학생','20020101','F','010','1234','1001');
insert into examtbl_1 values('1','01','02','이학생','20020201','M','010','1234','1002');
insert into examtbl_1 values('1','01','03','박학생','20020301','M','010','1234','1003');
insert into examtbl_1 values('1','02','01','조학생','20020401','M','010','1234','1004');
insert into examtbl_1 values('1','02','02','유학생','20020501','M','010','1234','1005');
insert into examtbl_1 values('1','02','03','여학생','20020601','M','010','1234','1006');
insert into examtbl_1 values('1','03','01','남학생','20020701','F','010','1234','1007');
insert into examtbl_1 values('1','03','02','황학생','20020801','F','010','1234','1008');
insert into examtbl_1 values('1','03','03','전학생','20020901','F','010','1234','1009');

create table examtbl_2(
syear char(1),
sclass char(2),
tname varchar2(20),
primary key(syear, sclass)
);

insert into examtbl_2 values('1','01','김교사');
insert into examtbl_2 values('1','02','이교사');
insert into examtbl_2 values('1','03','박교사');

create table examtbl_3(
syear char(1),
sclass char(2),
sno char(2),
kor number(3),
eng number(3),
math number(3),
primary key(syear, sclass, sno)
);

insert into examtbl_3 values('1', '01', '01', 50, 50, 50);
insert into examtbl_3 values('1', '01', '02', 60, 40, 100);
insert into examtbl_3 values('1', '01', '03', 70, 70, 70);
insert into examtbl_3 values('1', '02', '01', 80, 80, 80);
insert into examtbl_3 values('1', '02', '02', 50, 50, 50);
insert into examtbl_3 values('1', '02', '03', 40, 90, 80);
insert into examtbl_3 values('1', '03', '01', 80, 60, 90);
insert into examtbl_3 values('1', '03', '02', 90, 80, 70);
insert into examtbl_3 values('1', '03', '03', 70, 70, 70);






















































