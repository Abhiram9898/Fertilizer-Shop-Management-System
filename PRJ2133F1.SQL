create user PRJ2133F1 identified by abhiram;
grant resource,connect to PRJ2133F1;
grant dba to PRJ2133F1;
conn PRJ2133F1/abhiram;


create table login(USER_ID varchar(20), PASS varchar(20), PHONENUMBER varchar(10));
 insert into login values('ADMIN','ADMIN','1234567890');

create table product(
  p_id varchar(10) constraint pkprd primary key,
  p_nm varchar(30) not null,
  p_type char(10) not null,
  p_comp char(20) not null,
  p_wt decimal(5,2) not null,
  p_gst decimal(4,2) not null,
  p_rate decimal(6,2) not null,
  p_unit varchar (5) not null,
  p_hsn varchar(8) not null);

create table supplier(
  sup_id varchar(10) constraint pksupp primary key,
  sup_nm varchar(20) not null,
  sup_mob number(13) not null,
  sup_location varchar(50) not null,
  sup_state varchar(10) not null,
  sup_city varchar(10) not null,
  sup_pincode number(6) not null,
  com varchar(30) not null,
  sup_email varchar(30) not null,
  sup_gstno varchar(15) not null,
  status varchar(15));


create table supplierprd(
  Sup_id varchar(10) references supplier (sup_id),
  p_id varchar(10)  references product(p_id),
  rate number(6,2) );

create table purordetail(
  pur_orderno varchar(10) constraint pkprodet primary key,
  pur_orderdate date not null,
  sup_id varchar(10) references supplier(sup_id),
  noofproduct number (2) not null,
  modeofpayment varchar (8) not null,
  chqno varchar(16),
  totalamount number (8,2) not null,
  totalwithtax number (9,2) not null,
  advamount number (9,2) not null,
  duesamount number (8,2) not null,
  postatus varchar(25));

create table p_det(
  pur_orderno varchar(10)not null,
  sno number (2) not null,
  p_id varchar(10)not null,
  p_nm varchar(50)not null,
  p_typ varchar(30) not null,
  p_rate number (6,2) not null,
  p_unit varchar(10) not null,
  qty number (4) not null,
  price number(9,2) not null,
  cgstper number (4,2) not null,
  cgstamt number (6,2) not null,
  sgstper number (4,2) not null,
  sgstamt number (6,2) not null,
  total number (9,2) not null);

create table ordetails(
  invoiceno varchar(10)not null,
  invdate date  not null,
  orderno varchar(10)not null,
  challanno varchar(10)not null,
  noofprd number(2) not null,
  pymtby varchar(10) not null,
  chqno varchar(20) not null,
  withtaxamt number (8,2) not null,
  amtpaidinadv number(8,2) not null,
  netamt number (8,2) not null);

create table recvd_p_det(
  pur_orderno varchar(10)not null,
  sno number (2) not null,
  p_id varchar(10)not null,
  p_nm varchar(40)not null,
  p_typ varchar(30) not null,
  p_rate number (6,2) not null,
  qty number (4) not null,
  price number(9,2) not null,
  cgstper number (4,2) not null,
  cgstamt number (6,2) not null,
  sgstper number (4,2) not null,
  sgstamt number (6,2) not null,
  total number (9,2) not null);

create table customer(
   c_id varchar(10) constraint pkcust primary key,
   c_nm varchar(30)not null,
   c_mob varchar(10)not null,
   c_add varchar(50)null,
   c_gender varchar(15)not null,
   c_email varchar(30)null,
   dues number(8,2));

create table stock(
    rno varchar(5) constraint pkstk primary key,
    p_id varchar(10) references product(p_id),
    avl_qty number(5) not null,
    min_qty number(5) not null,
    max_qty number(5) not null);

create table sell_details(
  s_ono varchar(10) constraint pkselldet primary key,
  s_date date not null,
  c_id varchar2(10) references customer (C_ID),
  nop number(3) not null,
  s_pm varchar(10) not null,
  chqno varchar(15) not null,
  s_total number(8,2) not null,
  s_twt number (8,2) not null,
  c_prevdues number (8,2) ,
  s_amtpd number(8,2) not null);

create table sold_pdet(
  s_ono varchar(10) references sell_details(s_ono),
  p_id varchar(10) references product (p_id),
  quant number(6,2) not null,
  amount number(8,2) not null);

create table sell_inv(
  s_ono varchar(10) references sell_details(s_ono),
  inv_no varchar(20) not null,
  inv_date date not null,
  amount number(8,2) not null);
