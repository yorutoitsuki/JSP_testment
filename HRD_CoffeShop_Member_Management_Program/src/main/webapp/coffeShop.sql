create table member_tbl(
	custno number primary key,
	custname varchar2(20),
	gender char(1),
	phone varchar2(13),
	address varchar2(60),
	joindate date,
	grade char(1),
	city char(2)
);


insert into member_tbl values('100001','김행복','F','010-1111-2222','서울 동대문구 휘경1동','2015-12-02','A','01');
insert into member_tbl values('100002','이축복','M','010-1111-3333','서울 동대문구 휘경2동','2015-12-06','B','01');
insert into member_tbl values('100003','장믿음','F','010-1111-4444','울릉군 울릉읍 독도1리','2015-10-01','B','30');
insert into member_tbl values('100004','최사랑','M','010-1111-5555','울릉군 울릉읍 독도2리','2015-11-13','A','30');
insert into member_tbl values('100005','진평화','F','010-1111-6666','제주도 제주시 외나무골','2015-12-25','B','60');
insert into member_tbl values('100006','차공단','M','010-1111-7777','제주도 제주시 감나무골','2015-12-11','C','60');
insert into member_tbl values('100007','전진주','M','010-1111-8888','대구 수성구 고산1동','2015-11-03','A','90');
insert into member_tbl values('100008','중고차','M','010-1111-9999','대구 수성구 고산2동','2015-09-23','A','90');
insert into member_tbl values('100009','상수리','F','010-2222-0000','대구 수성구 고산3동','2015-12-03','B','90');
insert into member_tbl values('100010','외다리','F','010-2222-1111','대구 수성구 사월동','2015-10-30','C','90');

select * from member_tbl;

create table sale_tbl (
	custno number not null,
	saleno number primary key,
	amount number,
	price number,
	pcode varchar2(4),
	sdate date
);

insert into sale_tbl values('10001', '1001', '5', '15000', 'A001', '19/01/01');
insert into sale_tbl values('10002', '1002', '5', '20000', 'A002', '19/01/02');
insert into sale_tbl values('10003', '1003', '5', '30000', 'A003', '19/01/03');
insert into sale_tbl values('10004', '1004', '4', '20000', 'A004', '19/01/04');
insert into sale_tbl values('10005', '1005', '5', '15000', 'A001', '19/01/05');
insert into sale_tbl values('10006', '1006', '1', '4000', 'A002', '19/01/06');
insert into sale_tbl values('10001', '1007', '2', '12000', 'A003', '19/01/07');
insert into sale_tbl values('10002', '1008', '3', '15000', 'A004', '19/01/08');
insert into sale_tbl values('10003', '1009', '4', '12000', 'A001', '19/01/09');
insert into sale_tbl values('10004', '1010', '5', '20000', 'A002', '19/01/10');
insert into sale_tbl values('10005', '1011', '6', '36000', 'A003', '19/01/11');
insert into sale_tbl values('10006', '1012', '7', '35000', 'A004', '19/01/12');

select * from sale_tbl;

create table coffe_tbl(
	pcode varchar2(4) not null,
	pname varchar2(60) not null,
	pcost number
);

insert into coffe_tbl values('A001','아메리카노','3000');
insert into coffe_tbl values('A002','카푸치노','4000');
insert into coffe_tbl values('A003','카페모카','6000');
insert into coffe_tbl values('A004','카라멜마끼야또','5000');

select * from coffe_tbl;


--10p
select custno, custname, decode(gender,'F','여자','M','남자'), phone, address, 
to_char(joindate,'yyyy-MM-dd'), decode(grade,'A','VIP','B','일반','C','직원'), city
from member_tbl;

select custno, custname, gender, phone, address, 
to_char(joindate,'yyyy-MM-dd'), decode(grade,'A','VIP','B','일반','C','직원'), city
from member_tbl;

update member_tbl set custname = ?, gender = ?, phone = ?, address = ?,
joindate = to_date(?,'yyyy-MM-dd'), grade = ?, city = ?
where custno = ?;

create table coffe_tbl_update(
	pcode varchar2(4) not null,
	pname varchar2(60) not null,
	pcost number
);

select * from coffe_tbl;
select * from sale_tbl;


select a.*,null,null,null from coffe_tbl a union all
select null,null,null, b.* from coffe_tbl_update b

select * from coffe_tbl_update;

insert into coffe_tbl_update values('T999','TestCoffe','99999999');

select pname, pcost, sum(amount), sum(price)
from sale_tbl join coffe_tbl
using (pcode)
group by pcode


select pname, pcost, pcode, nvl(amount,0), nvl(price,0), to_char(nvl(price,0),'L999,999,999') as total
from coffe_tbl left outer join (select pcode, sum(amount) as amount , sum(price) as price
from sale_tbl group by pcode) using (pcode) order by total desc

select pname, pcost, pcode
from coffe_tbl

select pcode, sum(amount), sum(price)
from sale_tbl
group by pcode







