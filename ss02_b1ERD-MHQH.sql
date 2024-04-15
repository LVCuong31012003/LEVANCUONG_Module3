create database sql_02;
use sql_02;
create table Phieu_Xuat(
SoPX int primary key,
ngayXuat date
);
create table Phieu_Nhap(
so_pn int primary key,
ngay_nhap date
);
create table Vat_Tu(
Ma_Vattu int primary key,
Ten_Vattu varchar(20)
);
create table DonDH(
SoHd int primary key,
foreign key(MaNCC) references NhaCC(MaNCC),
ngayHD date
);
create table So_dien_thoai(
MSDT int primary key auto_increment,
SDT varchar(10)
);
create table NhaCC(
MaNCC int primary key,
TenNCC varchar(20),
DiaChi varchar(30),
MSDT int,
foreign key(MSDT) references So_dien_thoai(MSDT)
);
create table DONDH_VATTU(
Ma_Vattu int,
SoHd int ,
primary key(Ma_Vattu,SoHd),
foreign key(Ma_Vattu) references Vat_Tu(Ma_Vattu),
foreign key(SoHd) references DonDH(SoHd)
);
create table PhieuNhap_VatTu(
so_pn int,
Ma_Vattu int,
primary key(Ma_Vattu,so_pn),
foreign key(Ma_Vattu) references Vat_Tu(Ma_Vattu),
foreign key(so_pn) references Phieu_Nhap(so_pn),
DGNhap int,
SLNhap int
);
create table PhieuXuat_Vattu(
Ma_Vattu int,
SoPX int,
primary key(Ma_Vattu,SoPX),
foreign key(Ma_Vattu) references Vat_Tu(Ma_Vattu),
foreign key(SoPX) references Phieu_Xuat(SoPX)

);

