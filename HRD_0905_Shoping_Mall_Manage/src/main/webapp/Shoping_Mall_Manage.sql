select to_char(sysdate,'yyyy-mm-dd') from dual;--가입일
select NVL(max(memno),0)+1 from member --회원번호
--My SQL : now()

select NVL(max(memno),0)+1 as memno, to_char(sysdate,'yyyymmdd') as hirdate from member;
select to_char(sysdate,'yyyy-mm-dd') as hirdate from member; -- 레코드 수가 9개

drop table member;

--selectMamber.jsp
select memno, name, address,
to_char(hiredate,'yyyy.mm.dd.'),
decode(gender,'M','남','F','여','불명'),
tel1||'-'||tel2||'-'||tel3
from MEMBER;

--update.jsp
select memno, name, address,
to_char(hiredate,'yyyy-mm-dd'),
gender,
tel1, tel2, tel3
from MEMBER;

select * from member;

create table member(
memno char(4) primary key,
name varchar2(30) not null,
address varchar2(100) not null,
hiredate date,
gender char(1),
tel1 char(3),
tel2 char(4),
tel3 char(4));

select * from MEMBER;

create sequence member_seq
start with 1001
increment by 1
minvalue 1001;

insert into member values('1001', '김고객','경북 경산시 중방동','02/01/01','F','010','1234','1001');
insert into member values('1002', '이고객','경북 경산시 삼방동','02/02/01','M','010','1234','1002');
insert into member values('1003', '박고객','경북 경산시 옥방동','02/03/01','M','010','1234','1003');
insert into member values('1004', '조고객','대구 광역시 달서구','02/04/01','M','010','1234','1004');
insert into member values('1005', '유고객','대구 광역시 유성구','02/05/01','M','010','1234','1005');
insert into member values('1006', '여고객','대구 광역시 수성구','02/06/01','M','010','1234','1006');
insert into member values('1007', '남고객','충남 금산군 중도리','02/07/01','F','010','1234','1007');
insert into member values('1008', '황고객','서울 특별시 관악구','02/08/01','F','010','1234','1008');
insert into member values('1009', '전고객','서울 특별시 강서구','02/09/01','F','010','1234','1009');

drop table grade;

create table grade(
memgrade number(1) not null,
loprice number(30) not null,
hiprice number(30) not null
);

insert into grade values(1, 150001, 500000); --vip
insert into grade values(2, 100001, 150000); --gold
insert into grade values(3, 50001, 100000); --silver
insert into grade values(4, 1, 50000); --normal

--구입액 조회
select * from buy;

select memno, (price*bno) as money
from buy;
--구입 총액 확인 완료
select memno , sum(money) as hap
from (select memno, (price*bno) as money
		from buy
)
group by memno
order by memno;
--이중 PK에서 자유로워 짐
--join 시작, 우선은 이름
select memno, name, to_char(hap, 'fm999,999,999,999')
from member join 
	(select memno , sum(money) as hap
	from (	select memno, (price*bno) as money
			from buy
			)
	group by memno)
using(memno);
--번호, 이름, 구입액 조회 완료

--등급 조회
select memgrade, memno, name, hap
from grade, (select memno, name, hap
from member join 
	(select memno , sum(money) as hap
	from (select memno, (price*bno) as money from buy)
	group by memno)
using(memno))
where loprice<= hap and hap <= hiprice
order by hap desc;

--sql을 좀 더 짧게 만들어보자
select memno, name, sum(price*bno) as money
from buy join MEMBER
using(memno)
group by name
--이중(double) primary key 영향이 아직 남아있어서 불가
--아래처럼 두 속성 전부로 group by로 해야함

------------------------------------------------------------
select memgrade, memno, name, to_char(totalprice,'L999,999,999')
from grade join (select memno, name, sum(price*bno) as totalprice
				 from member natural join buy
				 group by memno, name)
on (loprice <= totalprice and totalprice <= hiprice)
order by totalprice desc;
--------------------------------------------------------
select DECODE(memgrade, 1, 'VIP', 2, 'Gold', 3, 'Silver', 4, 'Normal') as memgrade, memno, name, to_char(totalprice,'L999,999,999')
from grade join (select memno, name, sum(price*bno) as totalprice
				 from member natural join buy
				 group by memno, name)
on (loprice <= totalprice and totalprice <= hiprice)
order by totalprice desc;
---------------case ~ end 사용
select case when memgrade = 1 then 'VIP'
			when memgrade = 2 then 'Gold' 
			when memgrade = 3 then 'Silver'
			when memgrade = 4 then 'Normal'
			end as memgrade, memno, name, to_char(totalprice,'FML999,999,999')--왼쪽 공백 제거(FM) + 지역화폐단위(L) + 전단위 구분 쉼표
from grade join (select memno, name, sum(price*bno) as totalprice
				 from member natural join buy
				 group by memno, name)
on (loprice <= totalprice and totalprice <= hiprice)
order by totalprice desc;




create table buy(
memno char(4) not null,
prodno char(4) not null,
product varchar2(20) not null,
price Number(30),
bno number(30),

primary key(memno, prodno)
);

drop table buy;

select * from buy;

insert into buy values('1009', '0001', '긴 바지', 30000, 4);
insert into buy values('1009', '0002', '점퍼', 100000, 1);
insert into buy values('1006', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values('1006', '0002', '점퍼', 100000, 1);
insert into buy values('1005', '0003', '반팔 셔츠', 20000, 3);
insert into buy values('1002', '0003', '반팔 셔츠', 20000, 2);
insert into buy values('1002', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values('1001', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values('1001', '0005', '긴팔 후드티', 23000, 2);


































