CREATE DATABASE [SHOPHOA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SHOPHOA', FILENAME = N'F:\SQL Server\MSSQL16.KENZO\MSSQL\DATA\SHOPHOA.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SHOPHOA_log', FILENAME = N'F:\SQL Server\MSSQL16.KENZO\MSSQL\DATA\SHOPHOA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SHOPHOA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SHOPHOA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SHOPHOA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SHOPHOA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SHOPHOA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SHOPHOA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SHOPHOA] SET ARITHABORT OFF 
GO
ALTER DATABASE [SHOPHOA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SHOPHOA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SHOPHOA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SHOPHOA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SHOPHOA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SHOPHOA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SHOPHOA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SHOPHOA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SHOPHOA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SHOPHOA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SHOPHOA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SHOPHOA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SHOPHOA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SHOPHOA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SHOPHOA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SHOPHOA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SHOPHOA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SHOPHOA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SHOPHOA] SET  MULTI_USER 
GO
ALTER DATABASE [SHOPHOA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SHOPHOA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SHOPHOA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SHOPHOA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SHOPHOA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SHOPHOA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SHOPHOA', N'ON'
GO
ALTER DATABASE [SHOPHOA] SET QUERY_STORE = ON
GO
ALTER DATABASE [SHOPHOA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SHOPHOA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDatHang](
	[MaDon] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrang] [int] NULL,
	[ThanhToan] [int] NULL,
	[DiaChiNhanHang] [nvarchar](100) NULL,
	[MaNguoiDung] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
	[TenSP] [nvarchar](100) NULL,
	[AnhSP] [nvarchar](100) NULL,
	[TenThanhPho] [nvarchar](100) NULL,
	[Email] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[Dienthoai] [varchar](50) NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[idDatHang] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
	[TenSP] [nvarchar](100) NULL,
	[AnhSP] [nvarchar](100) NULL,
	[HoTen] [nvarchar](50) NULL,
	[Dienthoai] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Diachi] [nvarchar](100) NULL,
	[TenThanhPho] [nvarchar](100) NULL,
	[PhuongThucThanhToan] [int] NULL,
	[NgayDat] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHang](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaGiamGia](
	[MaGiamGiaID] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhan] [datetime] NULL,
	[MaGiamGia] [nvarchar](100) NULL,
	[HanSuDung] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGiamGiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[IDQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[Email] [varchar](50) NULL,
	[NgayDanhGia] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/19/2025 3:03:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[SoLuong] [int] NULL,
	[MoTa] [ntext] NULL,
	[MaLoai] [int] NULL,
	[MaNCC] [int] NULL,
	[AnhSP] [nvarchar](100) NULL,
	[GiamGia] [decimal](18, 2) NULL,
	[Giakhuyenmai] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 6/19/2025 3:03:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[MaSlider] [int] IDENTITY(1,1) NOT NULL,
	[AnhSlider] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSlider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/19/2025 3:03:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Dienthoai] [varchar](50) NULL,
	[Matkhau] [varchar](50) NULL,
	[IDQuyen] [int] NULL,
	[Diachi] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanDangKy]    Script Date: 6/19/2025 3:03:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanDangKy](
	[MaDangKy] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Dienthoai] [varchar](50) NULL,
	[Matkhau] [varchar](50) NULL,
	[IDQuyen] [int] NULL,
	[Diachi] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDangKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinDangNhap]    Script Date: 6/19/2025 3:03:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinDangNhap](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Matkhau] [varchar](50) NULL,
	[LoginTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 6/19/2025 3:03:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](100) NULL,
	[NoiDung] [ntext] NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[TieuDeNho] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDatHang] ON 

INSERT [dbo].[ChiTietDatHang] ([MaDon], [NgayDat], [TinhTrang], [ThanhToan], [DiaChiNhanHang], [MaNguoiDung], [ThanhTien], [TenSP], [AnhSP], [TenThanhPho], [Email], [HoTen], [Dienthoai], [SoLuong]) VALUES (101, CAST(N'2024-05-06T02:05:34.940' AS DateTime), 1, 1, N'1298 bùi hữu nghĩa', 3, CAST(2272000 AS Decimal(18, 0)), N'Dưa Hấu', N'img/bo5.jpg', N'Cần thơ', N'Meo@gmail.com', N'TomTom', N'0123456789', 4)
INSERT [dbo].[ChiTietDatHang] ([MaDon], [NgayDat], [TinhTrang], [ThanhToan], [DiaChiNhanHang], [MaNguoiDung], [ThanhTien], [TenSP], [AnhSP], [TenThanhPho], [Email], [HoTen], [Dienthoai], [SoLuong]) VALUES (102, CAST(N'2024-05-06T15:38:44.437' AS DateTime), 1, 1, N'1298 bùi hữu nghĩa', 3, CAST(108000 AS Decimal(18, 0)), N'Xoài', N'~/img/bohoa3.png', N'Cần thơ', N'Nguyenvana@gmail.com', N'Nguyễn văn a', N'01234567890', 1)
INSERT [dbo].[ChiTietDatHang] ([MaDon], [NgayDat], [TinhTrang], [ThanhToan], [DiaChiNhanHang], [MaNguoiDung], [ThanhTien], [TenSP], [AnhSP], [TenThanhPho], [Email], [HoTen], [Dienthoai], [SoLuong]) VALUES (148, CAST(N'2024-05-20T01:31:52.400' AS DateTime), 1, 1, N'', NULL, CAST(0 AS Decimal(18, 0)), NULL, NULL, N'', N'', N'', N'', NULL)
SET IDENTITY_INSERT [dbo].[ChiTietDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DatHang] ON 

INSERT [dbo].[DatHang] ([idDatHang], [MaSP], [SoLuong], [ThanhTien], [TenSP], [AnhSP], [HoTen], [Dienthoai], [Email], [Diachi], [TenThanhPho], [PhuongThucThanhToan], [NgayDat]) VALUES (122, 0, 3, CAST(642000 AS Decimal(18, 0)), N'Dưa Hấu', N'~/img/bo2.jpg, ~/img/anh2.jpg', N'tom', N'01234589', N'Admin@gmail.com', N'1298,Hữu nghĩa ', N'cần thơ', 1, CAST(N'2024-06-03T10:21:39.347' AS DateTime))
INSERT [dbo].[DatHang] ([idDatHang], [MaSP], [SoLuong], [ThanhTien], [TenSP], [AnhSP], [HoTen], [Dienthoai], [Email], [Diachi], [TenThanhPho], [PhuongThucThanhToan], [NgayDat]) VALUES (123, 0, 1, CAST(140000 AS Decimal(18, 0)), N'Sầu Riêng', N'~/img/hoado5.jpg', N'tom', N'01234589', N'tom@gmail.com', N'1298,Hữu nghĩa ', N'cần thơ', 1, CAST(N'2024-06-03T15:12:58.627' AS DateTime))
INSERT [dbo].[DatHang] ([idDatHang], [MaSP], [SoLuong], [ThanhTien], [TenSP], [AnhSP], [HoTen], [Dienthoai], [Email], [Diachi], [TenThanhPho], [PhuongThucThanhToan], [NgayDat]) VALUES (124, 0, 3, CAST(723000 AS Decimal(18, 0)), N'Nho Mỹ', N'~/img/anh2.jpg, ~/img/bo6.jpg', N'tom', N'01234589', N'tom@gmail.com', N'1298,Hữu nghĩa ', N'cần thơ', 2, CAST(N'2024-06-03T16:09:50.230' AS DateTime))
INSERT [dbo].[DatHang] ([idDatHang], [MaSP], [SoLuong], [ThanhTien], [TenSP], [AnhSP], [HoTen], [Dienthoai], [Email], [Diachi], [TenThanhPho], [PhuongThucThanhToan], [NgayDat]) VALUES (125, 0, 2, CAST(174240 AS Decimal(18, 0)), N'Kiwi Xanh New Zealand, Lê Nam Phi', N'~/img/kiwi-xanh-nz.jpg, ~/img/le-nam-phi.png', N'fnsnasnvia', N'0913221173', N'hacyzer@gmail.com', N'test', N'test', 1, CAST(N'2025-06-18T00:15:40.193' AS DateTime))
SET IDENTITY_INSERT [dbo].[DatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiHang] ON 

INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (1, N'Hoa quả bán chạy')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (2, N'Hoa quả nhập khẩu')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (3, N'Hoa quả mùa đông')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (4, N'Hoa quả mùa hè')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (12, N'Hoa quả khuyến mãi')
SET IDENTITY_INSERT [dbo].[LoaiHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (2, N'Nhà cung cấp hoa hồng')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (3, N'Nhà cung cấp tổng hợp')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (4, N'Nhà cung cấp hoa ly')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (5, N'Nhà cung cấp giỏ hoa')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (6, N'Nhà cung cấp hoa đơn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (7, N'Nhà cung cấp bó hoa lớn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (8, N'Nhà cung cấp hoa cúc')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (9, N'Nhà cung cấp hoa hướng dương')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (1, N'Adminstrator')
INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (2, N'Member')
INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ReviewId], [UserName], [Comment], [Email], [NgayDanhGia]) VALUES (64, N'tom', N'Ngon', N'Tom@gmail.com', CAST(N'2024-05-12T15:52:56.897' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewId], [UserName], [Comment], [Email], [NgayDanhGia]) VALUES (65, N'tom', N'Hoa quả bị mốc', N'tom@gmail.com', CAST(N'2024-05-13T16:09:15.767' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewId], [UserName], [Comment], [Email], [NgayDanhGia]) VALUES (72, N'tom', N'd', N'tom@gmail.com', CAST(N'2024-05-27T12:31:48.620' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewId], [UserName], [Comment], [Email], [NgayDanhGia]) VALUES (82, N'd', N'mới', N'tom@gmail.com', CAST(N'2024-05-30T19:46:23.833' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewId], [UserName], [Comment], [Email], [NgayDanhGia]) VALUES (85, N'tom', N'alo', N'tom@gmail.com', CAST(N'2024-05-31T20:13:07.337' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewId], [UserName], [Comment], [Email], [NgayDanhGia]) VALUES (86, N'tom', N'đã mua', N'tom@gmail.com', CAST(N'2024-06-01T22:54:10.057' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (114, N'Dưa hấu', CAST(320000 AS Decimal(18, 0)), 146, N'Vỏ xanh sọc, ruột đỏ au, mọng nước, ngọt mát. Khi để lạnh, từng miếng dưa như phát nổ mát lạnh trong miệng. Được trồng ở Việt Nam (Long An, Tiền Giang), bổ sung Lycopene, vitamin A, C – giải nhiệt, làm đẹp da.', 12, NULL, N'~/img/6.png', CAST(20.00 AS Decimal(18, 2)), CAST(256000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (116, N'Cherry Mỹ', CAST(540000 AS Decimal(18, 0)), 130, N'Vỏ đỏ sậm, thịt chắc, ngọt đậm, giòn nhẹ. Ăn lạnh như ăn kẹo trái cây tươi. Được trồng ở Mỹ (California, Washington), Canada (British Columbia)
', 1, NULL, N'~/img/cherry-my.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(540000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (117, N'Cherry Mỹ', CAST(540000 AS Decimal(18, 0)), 130, N'Vỏ đỏ sậm, thịt chắc, ngọt đậm, giòn nhẹ. Ăn lạnh như ăn kẹo trái cây tươi. Được trồng ở Mỹ (California, Washington), Canada (British Columbia)
', 2, NULL, N'~/img/cherry-my.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(540000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (141, N'Xoài', CAST(50000 AS Decimal(18, 0)), 100, N'Xoài hầu hết có mặt trên thị trường từ tháng 5 đến tháng 7, giá trị dinh dưỡng của nó rất cao, đặc biệt là hàm lượng vitamin, cao nhất trong số các loại trái cây nhiệt đới, xoài có vỏ mỏng, thịt dày, vị mềm và mọng nước, ngọt và có mùi thơm tương tự mật ong.', 4, NULL, N'~/img/Xoai.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (142, N'Đào', CAST(70000 AS Decimal(18, 0)), 100, N'Thời gian vào mùa đào vào khoảng tháng 5 đến tháng 9, đào rất giàu giá trị dinh dưỡng và được mệnh danh là “Nữ hoàng của các loại trái cây”, ngoài việc ăn trực tiếp, bạn còn có thể tự làm nước đào, mứt, siro,…', 4, NULL, N'~/img/Dao.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(70000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (143, N'Nho xanh', CAST(120000 AS Decimal(18, 0)), 40, N'Từ tháng 8 đến tháng 10 là mùa nho đến, trong quả nho rất giàu glucose, fructose, vitamin, canxi, sắt, protein và các chất dinh dưỡng khác, ngoài việc ăn trực tiếp, nó còn có thể ép thành nước nho và làm thành rượu vang đỏ.', 4, NULL, N'~/img/Nho xanh.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (144, N'Mận', CAST(30000 AS Decimal(18, 0)), 1200, N'Mận hầu hết có mặt trên thị trường từ tháng 5 đến tháng 8, ăn một vài quả mận vào mùa hè nóng nực có thể cải thiện cảm giác thèm ăn và thúc đẩy quá trình tiêu hóa, đồng thời chúng cũng rất giàu chất dinh dưỡng, nhưng không nên ăn quá nhiều mận chưa chín mận xanh bởi chúng có tính axit cao, dễ gây các bệnh về tiêu hóa và dạ dày.', 4, NULL, N'~/img/maan.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (145, N'Sầu Riêng', CAST(320000 AS Decimal(18, 0)), 120, N'Thời điểm để chọn ăn sầu riêng là từ tháng 6 đến tháng 8, ngoài việc được ăn trực tiếp, sầu riêng còn được chế biến thành nhiều món ngon như chè sầu riêng, bánh sầu riêng, sầu riêng sấy khô, thậm chí, sầu riêng còn có thể dùng trong nấu nướng.', 4, NULL, N'~/img/sau rieng.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(320000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (146, N'Vải thiều', CAST(50000 AS Decimal(18, 0)), 20000, N'Tháng 5 đến tháng 7 là mùa của vải thiều, thời tiết ngày càng nóng bức, dễ đổ mồ hôi, ăn một vài trái vải thiều ướp lạnh giúp làm giảm cảm giác oi bức, giải nhiệt cho cơ thể.', 4, NULL, N'~/img/vai thieu.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (147, N'Quýt Úc', CAST(600000 AS Decimal(18, 0)), 140, N'Các loại trái cây thuộc họ cam, quýt còn chứa canxi, photpho, caroten và axit citric có tác dụng giúp giảm hàm lượng cholesterol trong máu.', 3, NULL, N'~/img/Quyt Uc.png', CAST(0.00 AS Decimal(18, 2)), CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (149, N'Lựu Ai Cập', CAST(623579 AS Decimal(18, 0)), 140, N'Quả lựu chứa nhiều chất dinh dưỡng, chất chống oxy hóa cao được xem là một trong những loại quả tốt nhất vào mùa đông. Lựu có tác dụng chống ung thư, có lợi cho tim và người bị kiệt sức. Lựu cũng là nguồn cung cấp Vitamin A và Vitamin C hữu ích cho một làn da sáng bóng. Bạn có thể sử dụng hạt lựu cho các món salad hoặc ép lấy nước uống hoặc dùng cho món tráng miệng. Nước ép quả lựu rất giàu polyphenol và chất  chống oxy hóa cùng với chất xơ và các hợp chất có giá trị khác có khả năng làm giảm nồng độ cholesterol, ngăn ngừa bệnh tim. Thúc đẩy lưu lượng máu lưu thông tốt hơn: Giảm nguy cơ bệnh mạch vành, thiếu máu cục bộ, ngăn ngừa thiếu máu cơ tim.', 3, NULL, N'~/img/Thiet-ke-chua-co-ten-8.png', CAST(0.00 AS Decimal(18, 2)), CAST(623579 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (150, N'Lê Hàn Quốc', CAST(249696 AS Decimal(18, 0)), 1444, N'Quả lê là một trong những loại trái cây mùa đông chứa một nguồn tuyệt vời chất xơ và một nguồn Vitamin C dồi dào. Tuy nhiên, hầu hết các  vitamin C, cũng như các chất xơ, chứa bên trong vỏ của quả lê. Vì vậy, không gọt vỏ quả lê để tránh bỏ lỡ hầu hết các chất dinh dưỡng từ quả  lê. Quả lê thường chứa nhiều chất sắt, các chất dinh dưỡng chống oxy hóa,  giàu vitamin C nên có tác dụng quan trọng trong quá trình xây dựng hệ thống miễn dịch của cơ thể con người, tốt cho người bị tiểu đường, ngăn ngừa tình trạng viêm thận, chống thiếu hụt kiềm trong máu, ngăn ngừa dị ứng và các bệnh về da khác, ngăn ngừa viêm đại tràng…', 3, NULL, N'~/img/Lê.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(249696 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (151, N'Táo Vàng Shinano Nhật', CAST(599999 AS Decimal(18, 0)), 4444, N'Táo có màu vàng bắt mắt. Hương vị ngọt ngào, vị giòn ngọt 90% chua nhẹ 10%. Cung cấp nhiều Vitamin, khoáng chất, nâng cao sức đề kháng. Là dòng táo sạch, hữu cơ được trồng trong nhà. Nhập khẩu trực tiếp từ Nhật Bản', 3, NULL, N'~/img/Táo vàng.png', CAST(0.00 AS Decimal(18, 2)), CAST(599999 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (152, N'Táo Đỏ Sekai Ichi Nhật', CAST(999999 AS Decimal(18, 0)), 1, N'Nhập khẩu trực tiếp từ Nhật Bản. Được đánh giá là loại táo khủng nhất và có giá thành cao trên thế giới. Vỏ màu đỏ, thơm mùi đặc trưng, giòn và ngọt nước. Được trồng 100% bằng thủ công, đảm bảo an toàn tuyệt đối cho sức khỏe', 3, NULL, N'~/img/Táo Sekai Ichi.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(999999 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (153, N'Lê Nam Phi', CAST(99000 AS Decimal(18, 0)), 140, N'Lê Nam Phi có nguồn gốc từ Châu Âu, được xem là một trong những loại trái cây nhập khẩu có từ thời xa xưa. Hiện nay tại Nam Phi lê được trồng nhiều ở vùng Western Cape, tỉnh nằm phía Tây Nam. Nơi đây có khí hậu đa dạng, tuy nhiên đa phần là mát mẻ, khô và ấm áp mùa hè nên thích hợp trồng loại trái cây này. Mùa vụ lê Nam Phi bắt đầu từ tháng 2 đến tháng 8 hàng năm.', 2, NULL, N'~/img/le-nam-phi.png', CAST(0.00 AS Decimal(18, 2)), CAST(99000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (154, N'Kiwi Xanh New Zealand', CAST(99000 AS Decimal(18, 0)), 140, N'Chứa nhiều vitamin C, kali và chất xơ, giúp bồi dưỡng sức khỏe cho trẻ em và phụ nữ sau khi sinh, cải thiện chức năng của hệ miễn dịch. Tăng hiệu quả giảm cân, giúp giảm thiểu nguy cơ bệnh lý ung thư và tim  mạch, có lợi cho tiêu hóa, các bệnh hô hấp, kiểm soát huyết áp. Trẻ hóa làn da, giúp da sáng trắng, hồng hào và mịn màng.', 2, NULL, N'~/img/kiwi-xanh-nz.jpg', CAST(0.00 AS Decimal(18, 2)), CAST(99000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (155, N'Kiwi Xanh New Zealand', CAST(99000 AS Decimal(18, 0)), 140, N'Chứa nhiều vitamin C, kali và chất xơ, giúp bồi dưỡng sức khỏe cho trẻ em và phụ nữ sau khi sinh, cải thiện chức năng của hệ miễn dịch. Tăng hiệu quả giảm cân, giúp giảm thiểu nguy cơ bệnh lý ung thư và tim  mạch, có lợi cho tiêu hóa, các bệnh hô hấp, kiểm soát huyết áp. Trẻ hóa làn da, giúp da sáng trắng, hồng hào và mịn màng.', 12, NULL, N'~/img/kiwi-xanh-nz.jpg', CAST(12.00 AS Decimal(18, 2)), CAST(87120 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [MaLoai], [MaNCC], [AnhSP], [GiamGia], [Giakhuyenmai]) VALUES (156, N'Lê Nam Phi', CAST(99000 AS Decimal(18, 0)), 344, N'Lê Nam Phi có nguồn gốc từ Châu Âu, được xem là một trong những loại trái cây nhập khẩu có từ thời xa xưa. Hiện nay tại Nam Phi lê được trồng nhiều ở vùng Western Cape, tỉnh nằm phía Tây Nam. Nơi đây có khí hậu đa dạng, tuy nhiên đa phần là mát mẻ, khô và ấm áp mùa hè nên thích hợp trồng loại trái cây này. Mùa vụ lê Nam Phi bắt đầu từ tháng 2 đến tháng 8 hàng năm.', 1, NULL, N'~/img/le-nam-phi.png', CAST(12.00 AS Decimal(18, 2)), CAST(87120 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([MaSlider], [AnhSlider]) VALUES (7, N'~/img/Messenger_creation_20A71B6F-4349-423A-A70E-13A8A43A5D44.jpeg')
INSERT [dbo].[Slider] ([MaSlider], [AnhSlider]) VALUES (8, N'~/img/Messenger_creation_14D37C22-396D-41F8-8103-B8C3466D57C0.jpeg')
INSERT [dbo].[Slider] ([MaSlider], [AnhSlider]) VALUES (9, N'~/img/Messenger_creation_60EBF6A5-B0B7-45CE-BF20-591B3259D763.jpeg')
INSERT [dbo].[Slider] ([MaSlider], [AnhSlider]) VALUES (10, N'~/img/Messenger_creation_864EF643-C52E-4453-B675-7333D5E121B9.jpeg')
INSERT [dbo].[Slider] ([MaSlider], [AnhSlider]) VALUES (11, N'~/img/Messenger_creation_C749271A-B53A-4FA1-93BC-AB7B0E4F73BC.jpeg')
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (1, N'Nguyễn Phúc Lân', N'Admin@gmail.com', N'0961371124', N'123456', 1, N'Vĩnh Long')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (3, N'dũng', N'dung@gmail.com', N'123456789', N'123', 2, N'123456')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoanDangKy] ON 

INSERT [dbo].[TaiKhoanDangKy] ([MaDangKy], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (1, N'thuận', N'Thuan@gmail.com', N'0122222222', N'123', NULL, N'1298 bùi hữu nghĩa')
INSERT [dbo].[TaiKhoanDangKy] ([MaDangKy], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (2, N'Cheery', N'Chery@gmail.com', N'0123456789', N'1234', NULL, N'cần thơ')
INSERT [dbo].[TaiKhoanDangKy] ([MaDangKy], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (3, N'bobo', N'bobo@gmail.com', N'1234567890', N'123', NULL, N'cần thơ')
INSERT [dbo].[TaiKhoanDangKy] ([MaDangKy], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (4, N'bobo1', N'tom1@gmail.com', N'0123456789', N'123', NULL, N'cần thơ')
SET IDENTITY_INSERT [dbo].[TaiKhoanDangKy] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongTinDangNhap] ON 

INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (1, 3, N'tom@gmail.com', N'123456', CAST(N'2024-05-08T15:32:08.970' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (2, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-08T15:33:29.973' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (3, 3, N'tom@gmail.com', N'123456', CAST(N'2024-05-09T18:48:40.387' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (4, 6, N'bobo2@gmail.com', N'123', CAST(N'2024-05-09T19:38:20.557' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (5, 3, N'tom@gmail.com', N'123456', CAST(N'2024-05-10T16:01:31.020' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (6, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T20:16:36.350' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (7, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T20:16:49.100' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (8, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T20:29:45.613' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (9, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T20:37:45.367' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (10, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T20:40:47.057' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (11, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T20:47:01.910' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (12, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T20:50:00.237' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (13, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T20:55:37.540' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (14, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T20:57:22.810' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (15, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T20:57:59.887' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (16, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:01:45.910' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (17, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:04:23.703' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (18, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:06:00.833' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (19, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:09:19.503' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (20, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:10:15.210' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (21, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:12:32.173' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (22, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:12:55.803' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (23, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:22:18.147' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (24, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:28:41.297' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (25, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:28:54.747' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (26, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:30:26.513' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (27, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:32:32.983' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (28, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:33:10.410' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (29, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T21:47:24.930' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (30, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T22:03:28.420' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (31, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T23:07:35.497' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (32, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T23:11:01.733' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (33, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T23:11:38.147' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (34, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T23:27:56.170' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (35, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T23:40:26.120' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (36, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T23:44:16.273' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (37, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-10T23:45:48.860' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (38, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-10T23:46:13.773' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (39, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T00:15:29.090' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (40, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T00:23:31.810' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (41, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T00:37:05.383' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (42, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T00:39:49.147' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (43, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T00:40:18.243' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (44, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T00:43:44.483' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (45, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T00:49:46.170' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (46, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T01:03:46.393' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (47, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T01:05:41.430' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (48, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T01:09:27.180' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (49, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T01:11:29.663' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (50, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T01:16:14.697' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (51, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T01:27:24.137' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (52, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T01:33:46.170' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (53, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T18:08:52.387' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (54, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T21:58:10.093' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (55, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-11T22:31:12.080' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (56, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-12T00:24:12.753' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (57, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-12T00:31:03.310' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (58, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-12T15:50:20.570' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (59, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-12T15:52:13.053' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (60, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-12T18:16:08.597' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (61, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-12T18:17:41.923' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (62, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-12T18:18:33.483' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (63, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-12T18:20:50.037' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (64, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-12T21:33:46.243' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (65, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-12T22:30:48.807' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (66, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-13T16:09:40.783' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (67, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-13T20:23:00.843' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (68, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-13T22:57:37.787' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (69, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-13T23:06:45.110' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (70, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-13T23:38:13.900' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (71, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-14T00:08:31.957' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (72, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-14T16:34:53.773' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (73, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-14T17:23:49.073' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (74, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-14T20:05:42.157' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (75, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-14T20:25:49.597' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (76, 15, N'chuot@gmail.com', N'123', CAST(N'2024-05-17T18:08:25.260' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (77, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-17T18:10:17.323' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (78, 15, N'chuot@gmail.com', N'123', CAST(N'2024-05-17T18:10:32.490' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (79, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-17T19:56:37.750' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (80, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-21T21:07:43.240' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (81, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T01:34:39.060' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (82, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T13:31:36.713' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (83, 20, N'thuan@gmail.com', N'123', CAST(N'2024-05-23T13:33:47.657' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (84, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T19:04:27.247' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (85, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T19:06:39.817' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (86, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T19:10:11.460' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (87, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T19:10:19.933' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (88, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T19:10:36.233' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (89, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T19:16:18.503' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (90, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T19:16:37.177' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (91, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T19:18:17.387' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (92, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T19:22:28.987' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (93, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T19:26:08.560' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (94, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T19:27:04.870' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (95, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T19:27:14.620' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (96, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T19:30:51.257' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (97, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T19:32:46.130' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (98, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T19:42:05.217' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (99, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T19:48:27.383' AS DateTime))
GO
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (100, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T19:54:41.310' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (101, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T19:56:54.203' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (102, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T20:01:20.017' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (103, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T20:06:32.577' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (104, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T20:07:54.967' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (105, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T20:08:47.640' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (106, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T20:11:40.867' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (107, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T20:13:29.120' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (108, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T20:16:32.417' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (109, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T20:17:39.623' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (110, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-23T20:19:30.940' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (111, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-23T20:19:39.147' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (112, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-24T00:21:31.587' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (113, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-24T16:00:10.910' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (114, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-24T16:01:48.610' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (115, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-24T16:05:31.030' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (116, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-24T16:06:48.810' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (117, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-24T16:52:00.267' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (118, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-24T20:30:11.367' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (119, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-24T20:31:32.477' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (120, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-24T20:31:39.907' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (121, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-24T20:57:40.860' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (122, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-24T23:13:35.977' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (123, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-25T10:44:50.670' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (124, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-25T18:47:35.960' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (125, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-25T19:08:41.617' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (126, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-25T23:19:31.817' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (127, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-25T23:20:36.010' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (128, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-25T23:21:27.937' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (129, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-25T23:21:37.500' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (130, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-26T15:43:12.263' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (131, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-26T19:31:38.270' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (132, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-26T19:38:07.820' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (133, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-26T21:56:59.413' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (134, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-26T23:14:17.610' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (135, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-27T00:15:08.127' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (136, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-27T12:21:23.283' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (137, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-27T12:32:18.467' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (138, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-27T15:53:38.877' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (139, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-27T21:08:28.020' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (140, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-27T21:12:15.143' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (141, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-27T22:10:00.390' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (142, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-27T22:17:10.513' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (143, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T13:11:00.307' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (144, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T13:18:46.530' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (145, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T13:19:05.027' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (146, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T13:22:31.147' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (147, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T13:24:00.170' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (148, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T13:28:16.580' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (149, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T13:28:31.653' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (150, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T13:37:25.763' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (151, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T13:37:37.617' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (152, 2, N'nguyenvana@gmail.com', N'123456', CAST(N'2024-05-28T13:40:49.653' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (153, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T14:07:18.793' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (154, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T14:18:37.657' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (155, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T14:27:31.903' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (156, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T14:33:29.053' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (157, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T14:40:10.563' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (158, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T14:42:36.780' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (159, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T14:46:35.610' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (160, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T14:51:35.997' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (161, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T14:53:42.260' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (162, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T14:59:39.617' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (163, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T15:00:22.627' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (164, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T15:09:38.790' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (165, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T15:11:34.937' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (166, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T15:20:46.763' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (167, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T15:49:08.340' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (168, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T15:57:41.403' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (169, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T15:57:51.473' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (170, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T16:02:41.170' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (171, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T16:07:12.983' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (172, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T16:13:19.883' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (173, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T16:13:29.333' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (174, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T16:14:49.637' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (175, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T16:16:07.650' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (176, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T16:16:38.007' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (177, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T16:18:44.757' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (178, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T16:19:18.383' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (179, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T19:01:16.350' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (180, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T19:05:14.957' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (181, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T19:11:07.490' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (182, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T19:22:14.877' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (183, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T19:26:00.130' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (184, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T19:27:58.763' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (185, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T19:38:00.200' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (186, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T19:46:41.603' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (187, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T20:09:16.370' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (188, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T20:15:47.687' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (189, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T20:20:33.827' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (190, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T20:26:45.613' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (191, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T20:30:14.803' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (192, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T20:35:23.427' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (193, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T20:37:24.250' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (194, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T20:39:05.303' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (195, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T20:42:56.557' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (196, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T20:57:19.820' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (197, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T21:00:59.493' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (198, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-28T21:08:55.380' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (199, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T21:12:09.753' AS DateTime))
GO
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (200, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-28T21:13:32.307' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (201, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-28T21:14:21.340' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (202, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-29T00:36:36.603' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (203, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-29T01:05:39.187' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (204, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-29T01:06:02.960' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (205, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-29T01:06:14.197' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (206, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-29T01:13:06.807' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (207, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-29T01:13:50.187' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (208, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-29T01:22:00.107' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (209, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-29T01:37:44.980' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (210, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-29T01:38:48.767' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (211, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-29T01:41:29.297' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (212, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-29T01:41:29.437' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (213, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-29T01:41:38.867' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (214, 24, N'Pon@gmail.com', N'123', CAST(N'2024-05-29T23:22:16.840' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (215, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-29T23:27:23.353' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (216, 24, N'Pon@gmail.com', N'123', CAST(N'2024-05-29T23:36:26.480' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (217, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-29T23:40:45.597' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (218, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-30T13:02:58.173' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (219, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T13:03:41.033' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (220, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T13:22:56.100' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (221, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T13:43:11.823' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (222, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-30T14:47:13.347' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (223, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-30T19:36:24.910' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (224, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T20:22:55.853' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (225, 24, N'Pon@gmail.com', N'123', CAST(N'2024-05-30T20:23:39.893' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (226, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T20:32:38.020' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (227, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T20:43:28.987' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (228, 25, N'thuan@gmail.com', N'123', CAST(N'2024-05-30T20:56:09.757' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (229, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-30T20:56:27.400' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (230, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T21:04:44.687' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (231, 26, N'baba@gmail.com', N'123', CAST(N'2024-05-30T21:15:40.680' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (232, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-30T22:48:38.827' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (233, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-30T23:08:32.817' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (234, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-30T23:13:16.753' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (235, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T23:17:23.370' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (236, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-30T23:25:21.330' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (237, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T23:25:40.940' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (238, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T23:31:54.773' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (239, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T23:33:50.540' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (240, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T23:39:56.627' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (241, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-30T23:47:12.820' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (242, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T23:48:10.070' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (243, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-30T23:52:57.063' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (244, 28, N'pipi@gmail.com', N'123', CAST(N'2024-05-30T23:56:09.490' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (245, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-30T23:57:12.260' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (246, 28, N'pipi@gmail.com', N'123', CAST(N'2024-05-30T23:57:30.577' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (247, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T11:36:21.403' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (248, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T12:29:02.810' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (249, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T13:52:02.100' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (250, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T14:10:31.517' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (251, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T14:47:09.973' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (252, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T14:55:29.207' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (253, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T14:56:49.730' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (254, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T14:57:17.167' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (255, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T14:57:50.280' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (256, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T14:59:34.743' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (257, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T15:01:54.283' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (258, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T15:02:31.977' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (259, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T15:04:16.467' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (260, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T15:10:00.133' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (261, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T15:10:23.300' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (262, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T15:17:09.787' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (263, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T15:18:08.153' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (264, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T15:24:11.123' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (265, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T15:28:28.783' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (266, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-31T15:35:24.217' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (267, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T15:36:01.070' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (268, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T15:37:10.630' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (269, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T15:40:21.897' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (270, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T15:40:57.710' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (271, 29, N'gu@gmail.com', N'123', CAST(N'2024-05-31T16:15:46.350' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (272, 30, N'bebe@gmail.com', N'123', CAST(N'2024-05-31T16:21:35.523' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (273, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T17:28:27.987' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (274, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T17:29:05.743' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (275, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T17:32:51.580' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (276, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T17:34:29.953' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (277, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T17:34:41.900' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (278, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T17:35:01.313' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (279, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T17:36:19.957' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (280, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T17:36:43.950' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (281, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T17:37:16.713' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (282, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T17:40:56.350' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (283, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-31T17:44:46.403' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (284, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T19:24:29.297' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (285, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T19:31:32.397' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (286, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T19:36:54.640' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (287, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T19:41:30.103' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (288, 24, N'Pon@gmail.com', N'123', CAST(N'2024-05-31T19:41:59.850' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (289, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-31T19:42:25.813' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (290, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-31T19:43:12.710' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (291, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T19:46:17.480' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (292, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T19:46:35.963' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (293, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T19:51:16.977' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (294, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T19:54:29.787' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (295, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-31T19:57:44.677' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (296, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T19:58:55.433' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (297, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T20:01:30.213' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (298, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T20:01:58.727' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (299, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T20:02:51.603' AS DateTime))
GO
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (300, 23, N'cherry@gmail.com', N'123', CAST(N'2024-05-31T20:09:54.750' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (301, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-05-31T20:11:43.083' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (302, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T20:12:49.017' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (303, 3, N'tom@gmail.com', N'123', CAST(N'2024-05-31T20:12:49.573' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (304, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-06-01T07:44:11.870' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (305, 3, N'tom@gmail.com', N'123', CAST(N'2024-06-01T10:11:43.870' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (306, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-06-01T21:52:01.413' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (307, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-06-01T22:37:10.040' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (308, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-06-01T22:38:31.243' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (309, 3, N'tom@gmail.com', N'123', CAST(N'2024-06-01T22:41:19.440' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (310, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-06-01T22:44:31.453' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (311, 3, N'tom@gmail.com', N'123', CAST(N'2024-06-01T22:52:28.837' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (312, 3, N'tom@gmail.com', N'123', CAST(N'2024-06-01T22:52:56.043' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (313, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-06-01T23:09:37.217' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (314, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-06-01T23:59:54.820' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (315, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-06-02T15:17:26.540' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (316, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-06-03T10:18:41.120' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (317, 1, N'Admin@gmail.com', N'123456', CAST(N'2024-06-03T16:08:43.337' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (318, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-05-31T22:22:42.690' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (319, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-05-31T22:31:54.650' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (320, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-05-31T22:38:02.507' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (321, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-05-31T22:40:25.880' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (322, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-05-31T22:43:46.127' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (323, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-05-31T22:44:43.237' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (324, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-05-31T23:13:55.947' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (325, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-05-31T23:18:12.543' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (326, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-05-31T23:18:14.293' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (327, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-01T11:14:30.640' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (328, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-01T12:17:00.890' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (329, 3, N'dung@gmail.com', N'123', CAST(N'2025-06-01T12:27:25.250' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (330, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-01T12:27:43.470' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (331, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-01T13:04:46.510' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (332, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-01T13:32:09.410' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (333, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-04T13:27:18.200' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (334, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-04T14:04:58.393' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (335, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-04T14:05:54.400' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (336, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-11T10:22:10.090' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (337, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-11T10:36:49.107' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (338, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-11T10:37:59.310' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (339, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-13T21:32:21.117' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (340, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-13T21:40:41.713' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (341, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-13T21:54:10.440' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (342, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-13T21:57:40.963' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (343, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-17T23:05:34.150' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (344, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-17T23:18:30.820' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (345, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-17T23:59:54.127' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (346, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-18T00:03:12.997' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (347, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-18T00:03:33.757' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (348, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-18T00:03:52.377' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (349, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-18T00:08:26.853' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (350, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-18T00:12:44.417' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (351, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-18T00:12:55.720' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (352, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-18T00:14:56.193' AS DateTime))
INSERT [dbo].[ThongTinDangNhap] ([LoginID], [MaNguoiDung], [Email], [Matkhau], [LoginTime]) VALUES (353, 1, N'Admin@gmail.com', N'123456', CAST(N'2025-06-18T00:31:04.117' AS DateTime))
SET IDENTITY_INSERT [dbo].[ThongTinDangNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTT], [TieuDe], [NoiDung], [HinhAnh], [TieuDeNho]) VALUES (11, N'MUA CHERRY ÚC NHẬN NGAY GIFT ĐẲNG CẤP', N'CHƯƠNG TRÌNH ĐẶC BIỆT:

👉 Chỉ cần mua từ 1.5kg Cherry Úc, bạn sẽ nhận ngay Gift Box đẳng cấp – món quà sang trọng, tinh tế, phù hợp để biếu tặng trong các dịp Lễ, Tết.

🎯 Tại sao nên chọn Cherry Úc tại Thủy Anh Fruits?

Chất lượng đảm bảo: Cherry Úc tươi ngon, được tuyển chọn kỹ lưỡng từ những nhà vườn nổi tiếng.

Nhập khẩu chính nghach: Đầy đủ giấy tờ chứng minh nguồn gốc xuất xứ.

Dịch vụ tận tâm: Tư vấn nhiệt tình, giao hàng tận nơi.

🎉 Đặc biệt, từ ngày 20/12/2024 đến 20/1/2025, tại Fruits De Haute Qualité đang diễn ra chương trình ĐẠI TIỆC CHERRY ÚC, với nhiều ưu đãi hấp dẫn. Đừng bỏ lỡ cơ hội này!', N'~/img/472290715_906563091656440_116240.jpg', NULL)
INSERT [dbo].[TinTuc] ([MaTT], [TieuDe], [NoiDung], [HinhAnh], [TieuDeNho]) VALUES (12, N'Sampling Trải nghiệm Trái cây Hàn Quốc Fruits De Haute Qualité', N'Nhằm mang đến cho khách hàng cơ hội thưởng thức trực tiếp những loại trái cây nhập khẩu cao cấp, Fruits De Haute Qualité phối hợp cùng aT Center Hàn Quốc và Kfood Hàn Quốc tổ chức chương trình Sampling Trải nghiệm Trái cây Hàn Quốc. Sự kiện lần này sẽ giới thiệu nho sữa Hàn Quốc và dâu tây Hàn Quốc – những loại trái cây tươi ngon, căng mọng được đông đảo khách hàng yêu thích!', N'~/img/484580836_959687083010707_147016.jpg', NULL)
INSERT [dbo].[TinTuc] ([MaTT], [TieuDe], [NoiDung], [HinhAnh], [TieuDeNho]) VALUES (13, N'Mâm Ngũ Quả Trung Thu Miền Bắc - Biểu Tượng Của Tết Đoàn Viên', N'Mâm ngũ quả Trung thu là một trong những nét đẹp văn hóa truyền thống của người Việt, đặc biệt là vào dịp Tết Trung thu. Mỗi vùng miền lại có những đặc trưng riêng trong cách lựa chọn và bày trí mâm ngũ quả. Ở miền Bắc, mâm ngũ quả thường mang ý nghĩa sâu sắc về sự sum vầy, đủ đầy và cầu mong những điều tốt đẹp.', N'~/img/huong-dan-cach-bay-mam-ngu-qua-ngay-tet-dam-chat-truyen-thong-34a.jpg', NULL)
INSERT [dbo].[TinTuc] ([MaTT], [TieuDe], [NoiDung], [HinhAnh], [TieuDeNho]) VALUES (14, N'[CẢNH GIÁC] LÊ HÀN GIẢ MẠO XUẤT XỨ HÀN QUỐC', N'Gần đây, trên thị trường xuất hiện khá nhiều loại hoa quả có xuất xứ từ Hàn Quốc như: dâu tây, nho, hồng giòn… Đặc biệt là loại lê Hàn Quốc được bày bán tràn lan tại các cửa hàng hoa quả từ bình dân đến cao cấp và trên “chợ mạng”, đều được gắn tem mác và nguồn gốc xuất xứ từ Hàn Quốc nhưng thực tế là không phải.
Trên thực tế, giống lê nâu Hàn Quốc cũng có được trồng nước khác, về quy trình nuôi trồng, bảo quản và xuất khẩu khác nhau nên chất lượng cũng sẽ hoàn toàn khác nhau, nhưng đến khi xuất khẩu sang thị trường Việt Nam, các quả lê giả mạo được gắn tem mác Hàn Quốc và thậm chí được ghi thông tin xuất xứ tại Hàn Quốc.
Vậy cách dễ nhất để phân biệt được lê Hàn Quốc và lê giả mạo là người tiêu dùng hoàn toàn có thể kiểm tra tem của nông sản tươi Hàn Quốc xuất khẩu được đính kèm cẩn thận trên mỗi trái lê Hàn Quốc, QR code dẫn tới website chính thống của Hàn Quốc để kiểm tra sản phẩm chính gốc.', N'~/img/Screenshot-2024-12-05-170224-153.jpg', NULL)
INSERT [dbo].[TinTuc] ([MaTT], [TieuDe], [NoiDung], [HinhAnh], [TieuDeNho]) VALUES (15, N'6 lợi ích tuyệt vời của nho đỏ không hạt Úc', N'Nho đỏ không hạt Úc là loại quả nhập khẩu quen thuộc tại thị trường Việt Nam. Dòng nho này đặc biệt được yêu thích bởi lớp vỏ mỏng, thịt giòn, mọng nước, vị ngọt đậm không gắt dễ ăn. Đặc biệt, hàm lượng dưỡng chất trong nho rất tốt cho sức khỏe. Cùng Fuji điểm qua một vài tác dụng của loại nho này nhé! Nho đỏ không hạt Úc chứa nhiều vitamin C và chất chống oxy hóa. Hai dưỡng chất này giúp ngăn ngừa quá trình lão hóa của cơ thể. Vitamin C còn cực kỳ hiệu quả trong việc ngăn ngừa các dấu hiệu tuổi già, thoái hóa thần kinh, Alzheimer hay Parkinson.', N'~/img/nho-uc.jpg', NULL)
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
GO
ALTER TABLE [dbo].[LoaiHang] ADD  DEFAULT (NULL) FOR [TenLoai]
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_hd_tk] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[TaiKhoan] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[ChiTietDatHang] CHECK CONSTRAINT [FK_hd_tk]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_sp_loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiHang] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_sp_loai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_sp_ncc] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_sp_ncc]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_tk_pq] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[PhanQuyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_tk_pq]
GO
USE [master]
GO
ALTER DATABASE [SHOPHOA] SET  READ_WRITE 
GO
