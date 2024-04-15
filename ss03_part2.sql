create database QLBH;
use QLBH;
create table Customer(
cID int primary key,
CName nvarchar(260) not null,
cAge int 
);
create table Orderr(
oID int primary key,
oDate date not null,
oTotalPrice int,
cID int,
foreign key (cID) references Customer(cID)
);
create table Product(
pID int primary key,
pName nvarchar(20) not null,
pPrice int not null
);
create table OrderDetail(
oID int,
pID int,
odQTY nvarchar(40) not null,
foreign key (oID) references OrderBH(oID),
foreign key (pID) references Product(pID)
);
insert into customer (cID,cName,cAge) values
(1,"Minh Quan",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50);
insert into orderbh(oID,oDate,oTotalPrice,cID) values 
(1,"2006/03/21",null,1),
(2,"2006/03/23",null,2),
(3,"2006/03/16",null,1);
insert into  Product (pID,pName,pPrice) values 
(1,"May Giat",3),
(2,"Tu Lanh",5),
(3,"Dieu Hoa",7),
(4,"Quat",1),
(5,"Bep Dien",2);
insert into  OrderDetail(oID,pID,odQTY) values 
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select oID,oDate,oTotalPrice
from orderbh;

SELECT CName, product.pName, OrderDetail.odQTY
FROM Customer 
INNER JOIN OrderBH  ON customer.cID = orderbh.cID
INNER JOIN OrderDetail  ON orderbh.oID = orderdetail.oID
INNER JOIN Product  ON orderdetail.pID = product.pID
ORDER BY CName;

SELECT CName
FROM Customer
LEFT JOIN OrderBH ON Customer.cID = OrderBH.cID
WHERE OrderBH.cID IS NULL;

SELECT orderbh.oID AS 'Mã hóa đơn', orderbh.oDate AS 'Ngày bán',
       SUM(orderdetail.odQTY * product.pPrice) AS 'Giá tiền'
FROM OrderBH 
INNER JOIN OrderDetail  ON orderbh.oID = orderdetail.oID
INNER JOIN Product ON orderdetail.pID = product.pID
GROUP BY orderbh.oID, orderbh.oDate;
