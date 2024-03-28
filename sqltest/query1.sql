Create database kh; 


Use kh; 

Create table member(id varchar(12), 
Password varchar(12) not null, 
Name varchar(20) not null, 
Address varchar(100), 
Tel varchar(20) not null, 
Reg_date datetime default current_timestamp); 

Alter table member modify id varchar(12) primary key; 
Insert into member values('bgh', 'a1234', '배곤희', '신사동 912', '010-1111-2222', '2023-09-13'); 
insert into member values('yjh', 'a3421', '유정환', '강일동 128', '02-2222-3333', '2023-09-13'); 
insert into member values('lmk', 'b1111', '이민규', '수유동 1004', '010-3333-4444', '2023-09-14'); 
insert into member values('lsh', 'c456', '이성하', '화곡1동 37', '010-4444-5555', '2023-09-15'); 
insert into member values('lyj', 'z675', '이연정', '난곡동 67', '02-4444-2222', '2023-09-11'); 
insert into member values('lyl', 'q789', '이예린', '능동 13', '010-5555-6666', '2023-09-15'); 
insert into member values('lws', 'g478', '이원석', '고척1동 178', '010-6666-7777','2023-09-13'); 
insert into member values('ljh', 'd666', '이정희', '독산1동 75', '010-7777-8888', '2023-09-14'); 
insert into member values('ljw', 'e964', '이종우', '상계동 777', '02-5555-2222', '2023-09-05'); 
insert into member values('jib', 'h369', '장인범', '쌍문3동 888', '010-8888-9999', '2023-09-16'); 
Desc member; 

select * from member;

-- book table 생성
create table book(
bookId int auto_increment primary key,
bookkind varchar(3) not null,
booktitle varchar(50) not null,
bookprice int not null,
bookcount int not null,
author varchar(40),
pubcom varchar(40),
pubdate datetime
);

insert into book values(default, 'IT',	'이것이 자바다',	30000,	10,	'신용권',	'한빛미디어',	'2021-08-20');
insert into book values (default, 'IT',	'자바웹개발워크북',	31500,	19,	'구멍가게코딩단',	'남가람북스',	'2022-08-04');
insert into book values (default, 'NV',	'하얼빈',	14400,	15,	'김훈',	'문학동네',	'2022-08-03');
insert into book values (default, 'NV',	'불편한편의점',	12600,	10,	'김호연',	'나무옆의자',	'2022-08-10');
insert into book values (default, 'DV',	'역행자',	15750,	8,	'자청',	'웅진출판',	'2022-05-30');
insert into book values (default, 'DV',	'자소서바이블',	18000,	15,	'이형',	'엔알디',	'2022-08-25');
insert into book values (default, 'HC',	'벌거벗은한국사',	17500,	10,	'tvn',	'프런트페이지',	'2022-08-22');
insert into book values (default, 'HC',	'난중일기	',14000,	30,	'이순신',	'스타북스',	'2022-07-27');
insert into book values (default, 'TC',	'진짜쓰는실무엑셀',	20000,	10,	'전진권',	'제이펍',	'2022-02-15');
insert into book values (default, 'TC',	'빅데이터인공지능',	25000,	15,	'박해선',	'한빛미디어',	'2020-12-21');

select * from book;
create table sales( 
        sno INT auto_increment primary key, 
        bno INT not null, 
        id varchar(12) not null, 

        amount INT DEFAULT 1 not null, 
        money INT,
        salesday timestamp DEFAULT current_timestamp);
        
alter table sales  modify sno INT auto_increment ;       
Insert into sales (sno, bno, id, amount) values(default, 1, 'bgh',1 );
Insert into sales (sno, bno, id, amount) values(default, 2, 'lmk',1 );
Insert into sales (sno, bno, id, amount) values(default, 1, 'lsh',2 );
Insert into sales (sno, bno, id, amount) values(default, 9, 'lyj',1 );
Insert into sales (sno, bno, id, amount) values(default, 2, 'lyl',5 );
Insert into sales (sno, bno, id, amount) values(default, 2, 'ljh',3 );
Insert into sales (sno, bno, id, amount) values(default, 3, 'ljw',2 );
Insert into sales (sno, bno, id, amount) values(default, 4, 'jib',4 );
Insert into sales (sno, bno, id, amount) values(default, 5, 'lmk',8 );
Insert into sales (sno, bno, id, amount) values(default, 1, 'bgh',3 );
Insert into sales (sno, bno, id, amount) values(default, 2, 'lmk',4 );
Insert into sales (sno, bno, id, amount) values(default, 7, 'lyl',1 );
Insert into sales (sno, bno, id, amount) values(default, 8, 'ljw',2 );
Insert into sales (sno, bno, id, amount) values(default, 10, 'jib',5 );
Insert into sales (sno, bno, id, amount) values(default, 1, 'lmk',3 );
Insert into sales (sno, bno, id, amount) values(default, 2, 'jib',2 );
Insert into sales (sno, bno, id, amount) values(default, 2, 'lyj',1 );
Insert into sales (sno, bno, id, amount) values(default, 1, 'jib',3 );
select * from sales;

SET SQL_SAFE_UPDATES =1;

update sales inner join book on sales.bno = book.bookid
set sales.money = book.bookprice *sales.amount 
where sales.bno=book.bookid;

commit;

