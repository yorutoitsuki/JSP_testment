

drop table member_tbl

create table member_tbl(
	memno char(4) primary key,
	mname varchar2(20) not null,
	maddress varchar2(50) not null,
	joindate date not null,
	gender char(1),
	tel varchar2(15)
);

insert into member_tbl values('1001','김회원','경북 경산시 중방동',to_date());





























