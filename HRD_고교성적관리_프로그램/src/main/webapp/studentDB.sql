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

select syear||'_'||sclass||'_'||sno, sname, gender
from examtbl_1;

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
kor number(3) check (0<= kor and kor <=100),
eng number(3) check (0<= eng and eng <=100),
math number(3) check (0<= math and math <=100),
primary key(syear, sclass, sno)
);

drop table EXAMTBL_3;

insert into examtbl_3 values('1', '01', '01', 50, 50, 50);
insert into examtbl_3 values('1', '01', '02', 60, 40, 100);
insert into examtbl_3 values('1', '01', '03', 70, 70, 70);
insert into examtbl_3 values('1', '02', '01', 80, 80, 80);
insert into examtbl_3 values('1', '02', '02', 50, 50, 50);
insert into examtbl_3 values('1', '02', '03', 40, 90, 80);
insert into examtbl_3 values('1', '03', '01', 80, 60, 90);
insert into examtbl_3 values('1', '03', '02', 90, 80, 70);
insert into examtbl_3 values('1', '03', '03', 70, 70, 70);

select * from EXAMTBL_3;

select syear||'_'||sclass||'_'||sno, sname, gender
from examtbl_1;

select a.syear||'_'||a.sclass||'_'||a.sno, sname, gender,
		nvl(kor,-1),nvl(eng,-1), nvl(math,-1),
		(nvl(kor,0)+nvl(eng,0)+nvl(math,0)),
		round((nvl(kor,0)+nvl(eng,0)+nvl(math,0))/3,1)
 from examtbl_1 a left outer join EXAMTBL_3 b
 on a.syear = b.syear
 and a.sclass = b.sclass
 and a.sno = b.sno;

select syear||'_'||sclass||'_'||sno, nvl(sname,'-1'), nvl(gender,'-1'),
		nvl(kor,-1),nvl(eng,-1), nvl(math,-1),
		(nvl(kor,0)+nvl(eng,0)+nvl(math,0)),
		round((nvl(kor,0)+nvl(eng,0)+nvl(math,0))/3,1)
 from examtbl_1 a full outer join EXAMTBL_3 b
 using (syear, sclass, sno);
 
 
 
select syear||'_'||sclass||'_'||sno, nvl(sname,'-1'), nvl(gender,'-1'),
		nvl(kor,-1),nvl(eng,-1), nvl(math,-1),
		(nvl(kor,0)+nvl(eng,0)+nvl(math,0)),
		round((nvl(kor,0)+nvl(eng,0)+nvl(math,0))/3,1),
		sum(nvl(kor,0)) over(), sum(nvl(eng,0)) over(),  sum(nvl(math,0)) over(),
		round(avg(nvl(kor,0)) over(),1), round(avg(nvl(eng,0)) over(),1), round(avg(nvl(math,0)) over(),1)
 from examtbl_1 a full outer join EXAMTBL_3 b
 using (syear, sclass, sno);
 
 -----------------------------------------------------
 --avg null값 포함 하지 않는 selectStudent--------------------
 ------------------------------------------------------
select 	a.syear||'_'||a.sclass||'_'||a.sno as "학년반번호", sname, gender,
		nvl(kor,-1) as "kor", nvl(eng,-1) as "eng", nvl(math,-1) as "math",
		(nvl(kor,0)+nvl(eng,0)+nvl(math,0)) as "total",
		round((nvl(kor,0)+nvl(eng,0)+nvl(math,0))/3,1) as "avg",
		sum(nvl(kor,0)) over() as "korT", sum(nvl(eng,0)) over() as "engT",  sum(nvl(math,0)) over() as "mathT" ,
		round(avg(kor) over(),1) as "korA" , round(avg(eng) over(),1) as "engA" , round(avg(math) over(),1) as "mathA"
from examtbl_1 a left outer join EXAMTBL_3 b
on a.syear = b.syear
and a.sclass = b.sclass
and a.sno = b.sno;

------------------------------------------------------
--avg null값 포함하는 selectStudent-------------------------
 ------------------------------------------------------
select 	a.syear||'_'||a.sclass||'_'||a.sno as "학년반번호", sname, gender,
		nvl(kor,-1) as "kor", nvl(eng,-1) as "eng", nvl(math,-1) as "math",
		(nvl(kor,0)+nvl(eng,0)+nvl(math,0)) as "total",
		round((nvl(kor,0)+nvl(eng,0)+nvl(math,0))/3,1) as "avg",
		sum(nvl(kor,0)) over() as "korT", sum(nvl(eng,0)) over() as "engT",  sum(nvl(math,0)) over() as "mathT" ,
		round(avg(nvl(kor,0)) over(),1) as "korA" , round(avg(nvl(eng,0)) over(),1) as "engA" , round(avg(nvl(math,0)) over(),1) as "mathA"
from examtbl_1 a left outer join EXAMTBL_3 b
on a.syear = b.syear
and a.sclass = b.sclass
and a.sno = b.sno;

select * 
from (select syear, sclass, sno, NVL(sname, ' '),
		DECODE(gender , 'M' , '남', 'F', '여' , ' ') as decodeGender,
		NVL(to_char(kor), ' ') as korScore,
		NVL(to_char(eng), ' ') as engScore,
		NVL(to_char(math), ' ') as mathScore,
		NVL(to_char(SUM(kor+eng+math)), ' ') as totalSum,
		NVL(to_char(round(SUM(kor+eng+math) / 3 , 1)), ' ') as totalAvg
		from examtbl_1 FULL OUTER JOIN examtbl_3
		USING(syear,sclass,sno)
		group by syear, sclass, sno, sname, gender, kor, eng, math
		order by syear, sclass, sno asc)
CROSS JOIN (select SUM(NVL(kor, 0)) as korSum,
			SUM(NVL(eng, 0)) as engSum, SUM(NVL(math, 0)) as mathSum,
			round(AVG(NVL(kor, 0)), 1) as korAvg,
			round(AVG(NVL(eng, 0)), 1) as engAvg, round(AVG(NVL(math, 0)), 1) as mathAvg
			from examtbl_3);


select sum(nvl(kor,0)),sum(nvl(eng,0)),sum(nvl(math,0)),
round(avg(nvl(kor,0)),1),round(avg(nvl(eng,0)),1),round(avg(nvl(math,0)),1)
from examtbl_3;

select * from examtbl_1;
select * from examtbl_2;
select * from examtbl_3;

select nvl(kor,-1) from examtbl_3;

select sclass, sum(kor) as k1, sum(eng) as e1, sum(math) as m1, 
		round(avg(kor),1) as k2 ,round(avg(eng),1) as e2 ,round(avg(math),1) as m2
from examtbl_3
group by sclass

--------------------testing 99 sclass score------------------
select b.syear, b.sclass, nvl(tname,'미배치'),
		k1, e1,  m1, k2 , e2 , m2
from EXAMTBL_2 a
right outer join ( 	select syear, sclass, sum(kor) as k1, sum(eng) as e1, sum(math) as m1, 
		round(avg(kor),1) as k2 ,round(avg(eng),1) as e2 ,round(avg(math),1) as m2
		from examtbl_3 group by (sclass,syear)) b
on a.sclass = b.sclass;

--------------------------------------------------------------------

select syear, sclass, nvl(tname,'미배치'),
		k1, e1,  m1, k2 , e2 , m2
from EXAMTBL_2
full outer join ( 	select syear, sclass, nvl(sum(kor),-1) as k1, nvl(sum(eng),-1) as e1, nvl(sum(math),-1) as m1, 
		round(avg(nvl(kor,0)),1) as k2 ,round(avg(nvl(eng,0)),1) as e2 ,round(avg(nvl(math,0)),1) as m2
		from examtbl_3 full outer join EXAMTBL_1
		using(syear, sclass)
		group by (sclass,syear))
using(syear, sclass)





select * from EXAMTBL_3;

delete from examtbl_3 where sno = 99;















































