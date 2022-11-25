

create table player_tbl(
	player_no number primary key,
	player_name varchar2(20) not null,
	team_no number,
	player_phone varchar2(14),
	player_birth date,
	player_email varchar2(50),
	back_no number
);

select player_no, player_name, team_no, player_phone,
to_char(player_birth,'YYYY-MM-DD') as player_birth,
nvl(player_email,' ') as player_email, back_no from player_tbl;

create sequence seq_player_no
start with 10005
increment by 1
minvalue 10001

insert into player_tbl values('10001','김유신','10','10111112222','80/08/10','ab@naver.com','15');
insert into player_tbl values('10002','강감찬','10','10122223333','80/08/10','ab@naver.com','20');
insert into player_tbl values('10003','홍길동','10','10133334444','80/08/10','ab@naver.com','21');
insert into player_tbl values('10004','이순신','10','10144445555','80/08/10',null,'5');

select * from player_tbl

select player_no, player_name, team_no, player_phone,back_no,
to_char(player_birth,'MM/DD') as player_birth,
nvl(player_email,' ') as player_email
from player_tbl order by back_no asc


create table record_tbl(
	record_no number primary key,
	player_no number,
	match_no number,
	p_time number(3) default 0,
	player_score number(2) default 0,
	yellow_card number(2) default 0,
	red_card number(2) default 0
);

insert into record_tbl values('1','10001','111','5','0','0','0');
insert into record_tbl values('2','10002','111','90','1','0','1');
insert into record_tbl values('3','10003','111','90','0','2','0');
insert into record_tbl values('4','10004','111','45','2','0','0');
insert into record_tbl values('5','10005','111','45','0','0','0');
insert into record_tbl values('6','10001','112','90','1','0','0');
insert into record_tbl values('7','10002','112','90','1','0','0');
insert into record_tbl values('8','10003','112','90','0','1','0');
insert into record_tbl values('9','10004','112','90','1','1','0');
insert into record_tbl values('10','10005','112','90','0','0','1');
insert into record_tbl values('11','10001','113','45','3','2','1');
insert into record_tbl values('12','10002','113','90','1','1','0');
insert into record_tbl values('13','10003','113','45','2','1','0');
insert into record_tbl values('14','10004','113','45','0','0','0');
insert into record_tbl values('15','10005','113','45','0','0','0');

select * from record_tbl

select match_no, sum(player_score) as player_score, 
sum(yellow_card) as yellow_card, sum(red_card) as red_card
from record_tbl group by match_no order by match_no asc

select player_no, sum(player_score) as player_score,
sum(yellow_card) as yellow_card, sum(red_card) as red_card
from record_tbl group by player_no
order by player_score desc, yellow_card asc, red_card asc

select player_no, dense_rank() over(order by player_score desc, yellow_card asc, red_card asc) as rank,
player_score
from (select player_no, sum(player_score) as player_score,
sum(yellow_card) as yellow_card, sum(red_card) as red_card
from record_tbl
group by player_no)

select player_no, player_name, player_score 
from(select player_no, dense_rank() 
	 over(order by player_score desc, red_card asc, yellow_card asc) as rank,
	 player_score 
	 from (	select player_no, sum(player_score) as player_score,
			sum(yellow_card) as yellow_card, sum(red_card) as red_card
			from record_tbl group by player_no)
	 ) 
	 join player_tbl
using(player_no) where rank = 1 order by player_no;

insert into record_tbl values(16,10004,113,90,1,1,1);




















