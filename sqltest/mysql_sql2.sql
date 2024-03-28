
Use kh; 
show tables;
-- 아래내용을 수정하고 MySQL서버 재시작하게 되면
-- c:\programData\MySQL\MySQL Server 8.0\my.ini
-- [mysqld]
-- sql_safe_updates=0
-- autocommit=0

-- Workbench에서 내용을 바꾸고 싶으면
-- SET SQL_SQFE_UPDATES=0
-- SET AUTOCOMMIT =FALSE : 트랜잭션 처리가 필요한 경우 반드시 OFF(FALSE)여야 한다. 
 SET SQL_SAFE_UPDATES=0;
 
insert into book values(default, 'IT', '스프링프레임워크', 38000, 8,'김기태','정복사','2022-09-10');

select * from member;
select * from book;

-- 판매 테이블에 류플추가
insert into sales values(default, 1, 'kkt', 2, null, now());
update sales set money=(select bookprice from book
where bookid=sales.bno) where sno=19;

alter table member add pt int default 0;

alter table member add visited int default 0;

alter table member add email varchar(200);


alter table member add areacode varchar(8);
alter table member drop visited;
alter table member rename column areacode to areadata;
create table sales2 as select * from sales;
create table book2 as select *from book;
create table member2 as select * from member;

select * from member2;
select * from member2 limit 5,3; -- 5번째 부터 3개

-- 13
drop table sales2;
-- 14
delete from member2 where id like '%j';
-- 15
update member set pt=pt+100;
-- 16
update member set address='도화동 27' where id = 'lsh';
-- 17
update member2 set reg_date=curdate();
-- 18
update book2 set bookcount=5 where bookkind='khc';
-- 19
delete from book2 where bookkind='TC';
-- 20
alter table book2 add ckdata varchar(40);
-- 21

-- 22
alter table member2  add constraint mpkey1 primary key (id);
-- 23
alter table book2 add constraint bpkey1 primary key (bookid);
-- 24 
create table bookkind(kindcode varchar(6) primary key, kindname varchar(50));
insert into bookkind values('IT', '컴퓨터관련서적');
insert into bookkind values('NV', '대중소설');
insert into bookkind values('DV', '자기계발서적');
insert into bookkind values('HC', '역사서적');
insert into bookkind values('TC', '일반상식서적');

-- 외래키 설정 
alter table book2 add constraint bfkey1 
foreign key (bookid) references bookkind(kindcode);






-- 25
select * from member;
-- 26
select id, name, tel from member where id in (select id from sales);
-- 27
select * from book where bookkind ='IT';
-- 28
select name, tel from member where id like '%k%';
-- 29
 select * from sales where amount >= 2;
 -- 30 
 select booktitle, bookprice, author from book 
 where  bookprice >= 19000 and bookprice <= 30000;
 
 -- 31
 select booktitle, author, bookcount from book
 where pubcom in ('한빛미디어', 'skarkfkaqnrtm');
 -- 32
 
 -- 33
 select id, name, tel from member where length(password)>=5;
 -- 34
select * from  book order by pubdate asc, bookid desc;
-- 35
select bookkind, booktitle, pubcom from book where bookcount <10 order by author;
-- 36
 select bookid, booktitle, author from book
 where bookkind not in ('IT', 'NV', 'TC') order by pubdate desc;
 -- 36
 select count(*) as "sales Count" from sales; -- 뛰어쓰기 있으면 ''가 아닌 ""
 -- 37  grouping을 쓸 때 where대신  having을 쓴다
 select id, count(*) as "구매 건수" from sales group by id having cnt>=2 order by id ;
 
-- 38
 select bno, sum(money) as '판매금액합계' from sales
 group by bno;
  select b.bno, a.booktitle, sum(b.money) as '판매금액합계' 
  from book a inner join sales b on a.bookid=b.bno
 group by b.bno, a.booktitle;

  select b.bno, a.booktitle, sum(b.money) as '판매금액합계' 
  from book a, sales b where a.bookid=b.bno
   group by b.bno, a.booktitle;
  -- 39
  select id, bno, max(money) as "최대 판매금" from sales
  group by id, bno;
  -- 40
select reg_date , count(*) as "인원수" from member
group by reg_date order by reg_date asc;

-- 41
select * from book  order by bookcount asc limit 5;

-- 42
select  sno, bno, id from sales order by money desc limit 3;
-- 43
create view mem_view as select * from member2
where reg_date>= '2022-09-01';
-- 44
 create view sales_view as select sno, bno, id, money from sales2;
 -- 45
 create view book_view as select bookkind, booktitle, bookprice, pubcom 
 from book2 where bookkind in ('IT' , 'TC', 'HC');
 
 -- 46
 update book_view set bookprice = bookprice*1.1;
 -- 47
 CREATE or replace view sales_view as select * from sales2 where amount>=2;
 -- 48
 delete from mem_view where id like '%y$';
 -- 49
  drop view sales_view;
   -- 50
  drop view sales_view; 
  
-- 51 
-- create sequence sd_seq start with 1 increment;
-- 52~54까지 못함 불가능

-- 55
select distinct name from member where id in (select id from sales);
-- 56
select * from book where bookid not in (select bno from sales); 
 
 
 -- 62
 desc sales;
 
 
 -- ------------------
 create table TB_MEMBER (MEMBER_ID varchar(20), MEMBER_PW varchar(20), MEMBER_NAME varchar(20), GRADE INT, AREA_CODE INT);
 insert into TB_MEMBER values('hong01', 'pass01', '홍길동', 10,02);
 insert into TB_MEMBER values('leess99', 'pass02', '이순신', 10,032);
 insert into TB_MEMBER values('ss50000', 'pass03', '신사임당', 30,031);
 insert into TB_MEMBER values('iu93', 'pass04', '아이유', 30,02);
 insert into TB_MEMBER values('pcs1234', 'pass05', '박철수', 20,031);
 insert into TB_MEMBER values('you_js', 'pass06', '유재석', 10,02);
 insert into TB_MEMBER values('kyh9876', 'pass07', '김영희', 20,031);
 