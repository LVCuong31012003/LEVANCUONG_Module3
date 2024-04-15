create database quanLy;
use quanLy;
create table Customer(
cid int primary key,
cName varchar(20),
cAge int
);
create table Orderr(
oid int primary key,
cid int,
foreign key(cid) references Customer(cid),
oDate date,
oTotalPrice int
);
create table product(
pid int primary key,
pName varchar(20),
pPrice int
);
create table Product_order(
oid int ,
pid int,
primary key(pid,oid),
foreign key(oid) references Orderr(oid),
foreign key(pid) references product(pid),
odQTY varchar(20)
);