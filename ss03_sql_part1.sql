create database ql_sinh_vien ;
use ql_sinh_vien ;
create table class(
 ClassID  int primary key not null  auto_increment,
 ClassName varchar (60) not null ,
 StartDate datetime not null ,
 Status bit 
);
create table subject( 
SubID int not null primary key auto_increment,
SubName varchar (50) not null ,
Credit tinyint not null default  1  check (Credit >=1),
Status Bit default  1
);
create table student (
StudentID int not null primary key auto_increment,
StudentName varchar (30) not null ,
Address varchar (50) ,
Phone varchar (20),
Status bit ,
ClassId int not null,
foreign key (ClassId) references class (ClassID)
);
create table Mark (
MarkID int not null primary key auto_increment,
SubId int not null,
StudentId int not null ,
Mark float,
foreign key(SubId) references subject( SubID ),
foreign key(StudentId) references student( StudentID ),
ExamTime tinyint
);

select *  
from Student where StudentName like 'H%';  

select * 
from class where month (StartDate) = 12 ;

select *
from subject where Credit between  3  and 5 ;

UPDATE student  SET ClassId = 2 WHERE StudentName = 'Hung';

SELECT StudentName, SubName, Mark FROM Marks ORDER BY Mark DESC, StudentName ASC;