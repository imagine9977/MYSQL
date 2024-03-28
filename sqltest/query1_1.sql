create database kh;
show databases;
use kh;
create table member(id varchar(12),
password varchar(12),
name varchar(20),
address varchar(100),
tel varchar(20),
reg_date datetime default current_timestamp);

desc member;
