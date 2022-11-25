

create table equipment_list_14 (
	equipment_no char(6) primary key,
	equipment_name varchar2(50),
	equipment_group char(1),
	equipment_price number,
	reg_date date,
	equipment_status char(1),
	equipment_unit varchar2(20)
);

create sequence equipNo
start with 17001
increment by 1
minvalue 17001

insert into equipment_list_14 values(equipNo.nextval,'의자','2','50000','17/04/06','Y','개');
insert into equipment_list_14 values(equipNo.nextval,'책상','2','60000','17/04/09','Y','개');
insert into equipment_list_14 values(equipNo.nextval,'사무pc','1','250000','17/04/09','Y','개');
insert into equipment_list_14 values(equipNo.nextval,'복합기','1','200000','17/04/09','Y','개');
insert into equipment_list_14 values(equipNo.nextval,'서랍장','2','35000','17/05/06','Y','개');
insert into equipment_list_14 values(equipNo.nextval,'A4용지','1','25000','18/01/03','Y','개');
insert into equipment_list_14 values(equipNo.nextval,'B5용지','1','20000','18/01/06','Y','개');

select * from equipment_list_14

create table equipment_postulat_14(
	req_no number primary key,
	equipment_no char(6) not null,
	req_date date,
	req_qty number,
	req_dept char(2)
);

create sequence reqNo
start with 10001
increment by 1
minvalue 10001

insert into equipment_postulat_14 values(reqNo.nextval,'170001','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170002','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170001','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170002','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170006','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170007','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170007','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170006','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170006','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170006','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170007','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170005','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170007','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170007','17/12/01','10','A1');
insert into equipment_postulat_14 values(reqNo.nextval,'170004','17/12/01','10','A1');



























