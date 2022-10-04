create table tbl_product(
	p_code char(4) primary key,
	p_name varchar2(20),
	p_size varchar2(40),
	p_type varchar2(20),
	p_price number(7)
);

insert into tbl_product values('A001','A-1형 소형박스','100 x 110 x 50','A골판지',5000);
insert into tbl_product values('A002','A-2형 소형박스','100 x 110 x 70','A골판지',6000);
insert into tbl_product values('A003','A-3형 소형박스','100 x 110 x 100','A골판지',7000);
insert into tbl_product values('B001','B-1형 소형박스','150 x 130 x 50','B골판지',10000);
insert into tbl_product values('B002','B-2형 소형박스','150 x 130 x 70','B골판지',11000);
insert into tbl_product values('B003','B-3형 소형박스','150 x 130 x 100','B골판지',13000);
insert into tbl_product values('C001','C-1형 소형박스','180 x 150 x 50','C골판지',15000);
insert into tbl_product values('C002','C-2형 소형박스','180 x 150 x 70','C골판지',17000);
insert into tbl_product values('C003','C-3형 소형박스','180 x 150 x 100','C골판지',20000);

select * from tbl_product

select p_code, p_name, p_size, p_type, to_char(p_price,'L9,999,999') from tbl_product

create table tbl_worklist(
	w_workno char(8) primary key,
	p_code char(4),
	w_quantity number(5),
	w_workdate date
);

insert into tbl_worklist values('20190001','A001','100','19/11/01');
insert into tbl_worklist values('20190002','A002','150','19/11/01');
insert into tbl_worklist values('20190003','A003','200','19/11/01');
insert into tbl_worklist values('20190004','B001','250','19/11/02');
insert into tbl_worklist values('20190005','B002','100','19/11/02');
insert into tbl_worklist values('20190006','B003','150','19/11/02');
insert into tbl_worklist values('20190007','A001','100','19/11/03');
insert into tbl_worklist values('20190008','A002','150','19/11/03');
insert into tbl_worklist values('20190009','A003','200','19/11/03');

delete from tbl_worklist where p_code like 'C%';

insert into tbl_worklist values('20190007','C001','100','19/11/03');
insert into tbl_worklist values('20190008','C002','150','19/11/03');
insert into tbl_worklist values('20190009','C003','200','19/11/03');

select * from tbl_worklist;

create table tbl_process(
	w_workno char(8) primary key,
	p_p1 char(1),
	p_p2 char(1),
	p_p3 char(1),
	p_p4 char(1),
	p_p5 char(1),
	p_p6 char(1),
	w_lastdate char(8),
	w_lasttime char(4)
);


insert into tbl_process values('20190001','Y','Y','Y','Y','Y','Y','20191001','0930');
insert into tbl_process values('20190002','Y','Y','Y','Y','Y','Y','20191001','1030');
insert into tbl_process values('20190003','Y','Y','Y','Y','Y','Y','20191001','1130');
insert into tbl_process values('20190004','Y','Y','Y','Y','Y','N','20191002','1330');
insert into tbl_process values('20190005','Y','Y','Y','Y','Y','N','20191002','1430');
insert into tbl_process values('20190006','Y','Y','Y','Y','Y','N','20191002','1530');
insert into tbl_process values('20190007','Y','Y','Y','Y','N','N','20191003','1630');
insert into tbl_process values('20190008','Y','Y','Y','Y','N','N','20191003','1730');

select * from tbl_process



select * from tbl_product;
select * from tbl_worklist;
select * from tbl_process;

--13P SQL 작업지시서 조회
select w_workno, P_code, p_name, p_size, p_type, w_quantity, to_char(w_workdate, 'yyyy-mm-dd')
from tbl_product join tbl_worklist using(P_code) order by w_workno;

--14P SQL 작업공정조회 - 작업 지시가 없는 공정은 조회 안함
select w_workno, P_code, p_name, p_p1, p_p2, p_p3, p_p4, p_p5, p_p6,
to_char(to_date(w_lastdate,'yyyy-mm-dd'),'yyyy-mm-dd'), w_lasttime 
from tbl_worklist join tbl_process using(w_workno) 
join tbl_product using(p_code) order by w_workno


--14P SQL 작업공정조회 - 작업 지시가 없는 공정도 함께 조회, Waiting Order를 출력함
select w_workno, nvl(P_code,'Waiting'), nvl(p_name,'Order'), p_p1, p_p2, p_p3, p_p4, p_p5, p_p6,
to_char(to_date(w_lastdate,'yyyy-mm-dd'),'yyyy-mm-dd'), w_lasttime from tbl_worklist right outer join tbl_process using(w_workno) 
left outer join tbl_product using(p_code) order by w_workno






































