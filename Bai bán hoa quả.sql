 Create Database fruitshop;
 go
 use fruitshop;
 go

CREATE TABLE NhanVien(
AccountID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
TaiKhoan VARCHAR(100) NOT NULL,
MatKhau VARCHAR(30) NOT NULL,
Phone INT NOT NULL,
Email VARCHAR(24) NOT NULL,
FullName NVARCHAR(100) NOT NULL,
CreateDate DATE NOT NULL
)
GO

CREATE TABLE KhachHang (
MaKH INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
TenKH NVARCHAR(200) NOT NULL,
Diachi NVARCHAR(500) NOT NULL,
Ngaysinh DATE NOT NULL,
Phone INT NOT NULL,
Email NVARCHAR(200) NOT NULL,
CreateDate DATE NOT NULL
)
GO

CREATE TABLE hinhthucthanhtoan (
    htt_ma INT PRIMARY KEY,
    htt_ten VARCHAR(100) NOT NULL
)
go

CREATE TABLE khuyenmai (
    km_ma INT PRIMARY KEY,
    km_ten VARCHAR(255) NOT NULL,
    km_nodung TEXT,
    km_tungay DATE NOT NULL,
    km_denngay DATE NOT NULL
)
go

CREATE TABLE LoaiSanPham (
    MaLoai INT PRIMARY KEY,
    TenLoai NVARCHAR(100) NOT NULL,
    MoTa NVARCHAR(255)
)
go

CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY,
    TenSP NVARCHAR(100) NOT NULL,
    MaLoai INT,
    DonGia DECIMAL(12,2) NOT NULL,
    SoLuongTon INT DEFAULT 0,
    MoTa NVARCHAR(255),
    HinhAnh VARCHAR(255),
	Ngaycapnhat DATETIME,
    Soluong INT DEFAULT 0,
    km_ma INT,
    FOREIGN KEY (MaLoai) REFERENCES LoaiSanPham(MaLoai),
	FOREIGN KEY (km_ma) REFERENCES khuyenmai(km_ma)
)
go



CREATE TABLE donhang (
    dh_ma INT PRIMARY KEY,
    MaKH INT NOT NULL,  -- Added this missing column
    kh_tendangnhap VARCHAR(50),
    dh_ngaydat DATETIME DEFAULT CURRENT_TIMESTAMP,
    dh_diachi VARCHAR(255) NOT NULL,
    dh_dienthoai VARCHAR(20) NOT NULL,
    dh_tongtien DECIMAL(12,2) NOT NULL,
    htt_ma INT,
    dh_trangthai VARCHAR(50) DEFAULT 'Chờ xử lý',
    FOREIGN KEY (MaKH) REFERENCES khachhang(MaKH),
    FOREIGN KEY (htt_ma) REFERENCES hinhthucthanhtoan(htt_ma)
)
GO

	CREATE TABLE chitietdonhang (
    ctdh_ma INT PRIMARY KEY,
    dh_ma INT,
    sp_ma INT,
    ctdh_soluong INT NOT NULL,
    ctdh_dongia DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (dh_ma) REFERENCES donhang(dh_ma),
    FOREIGN KEY (sp_ma) REFERENCES sanpham(Masp)
	)
	go

