create database demo;
use demo;

create table class(
id_c int primary key ,
name_c varchar(20) 
);

create table teacher(
id_t int primary key,
name_t varchar(20) ,
age int ,
country varchar(20) 
);

insert into class (id_c, name_c) value(1,'lop 12');
insert into class value(2,'lop 11');
insert into teacher value(1,'AA',24,'VN');
insert into teacher(id_t,name_t,age,country) value(2,'BB',45,'ThaiLand');
insert into teacher value(3,'cc',24,'UK');
select * from class;
select * from teacher;