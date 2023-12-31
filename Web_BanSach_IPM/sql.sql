USE [master]
GO
/****** Object:  Database [BanSach]    Script Date: 24/11/2023 11:00:14 PM ******/
CREATE DATABASE [BanSach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanSach', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BanSach.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanSach_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BanSach_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BanSach] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanSach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanSach] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BanSach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanSach] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BanSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanSach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BanSach] SET  MULTI_USER 
GO
ALTER DATABASE [BanSach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanSach] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanSach] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BanSach] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BanSach] SET QUERY_STORE = ON
GO
ALTER DATABASE [BanSach] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BanSach]
GO
/****** Object:  Table [dbo].[ChiTietAnh]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietAnh](
	[MaAnhChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[sanp_id] [int] NULL,
	[Anh] [nvarchar](2000) NULL,
 CONSTRAINT [PK_ChiTietAnh] PRIMARY KEY CLUSTERED 
(
	[MaAnhChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaChiTietDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaDonHang] [int] NULL,
	[sanp_id] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaMua] [int] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaChiTietDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonBan]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonBan](
	[MaChiTietHoaDonBan] [int] IDENTITY(1,1) NOT NULL,
	[SoHoaDon] [int] NULL,
	[sanp_id] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDonBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[MaChiTietHoaDonNhap] [int] IDENTITY(1,1) NOT NULL,
	[SoHoaDon] [int] NULL,
	[sanp_id] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDonNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietKho]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKho](
	[MaChiTietKho] [int] IDENTITY(1,1) NOT NULL,
	[MaKho] [int] NULL,
	[sanp_id] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_ChiTietKho] PRIMARY KEY CLUSTERED 
(
	[MaChiTietKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danhmucs]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhmucs](
	[maDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[tenDanhMuc] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [date] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[ToTal] [int] NULL,
	[MaKhachHang] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaCa]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaCa](
	[MaSo] [int] IDENTITY(1,1) NOT NULL,
	[sanp_id] [int] NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[Gia] [int] NULL,
 CONSTRAINT [PK_GiaCa] PRIMARY KEY CLUSTERED 
(
	[MaSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[SoHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[NgayBan] [date] NULL,
	[MaNguoiDung] [int] NULL,
	[ToTal] [int] NULL,
 CONSTRAINT [PK_HoaDonBan] PRIMARY KEY CLUSTERED 
(
	[SoHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[SoHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [date] NULL,
	[MaNguoiDung] [int] NULL,
	[nsx_id] [int] NULL,
	[ToTal] [int] NULL,
 CONSTRAINT [PK_HoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[SoHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MaKho] [int] IDENTITY(1,1) NOT NULL,
	[TenKho] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MaKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loaisp]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loaisp](
	[loai_id] [int] IDENTITY(1,1) NOT NULL,
	[loai_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[loai_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhasx]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhasx](
	[nsx_id] [int] IDENTITY(1,1) NOT NULL,
	[nsx_name] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NULL,
	[sdt] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nsx_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productComment]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sanp_id] [int] NULL,
	[MaNguoiDung] [int] NULL,
	[noiDung] [nvarchar](500) NULL,
 CONSTRAINT [PK_productComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sanpham](
	[sanp_id] [int] IDENTITY(1,1) NOT NULL,
	[sanp_name] [nvarchar](250) NOT NULL,
	[size] [nvarchar](50) NOT NULL,
	[TG_id] [int] NOT NULL,
	[loai_id] [int] NOT NULL,
	[nsx_id] [int] NOT NULL,
	[sotrang] [int] NOT NULL,
	[tomtat] [nvarchar](2000) NOT NULL,
	[namsx] [datetime] NULL,
	[image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sanp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[MaSlide] [int] IDENTITY(1,1) NOT NULL,
	[Slide] [nvarchar](2000) NULL,
	[Link] [nvarchar](200) NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[MaSlide] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[LoaiQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TG]    Script Date: 24/11/2023 11:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TG](
	[TG_id] [int] IDENTITY(1,1) NOT NULL,
	[TG_name] [nvarchar](50) NOT NULL,
	[TG_diachi] [nvarchar](50) NULL,
	[sdt] [int] NULL,
	[email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TG_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (5, 1, 2, 1, 123000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (6, 2, 2, 1, 124590)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (7, 7, 2, 1, 124590)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (8, 7, 3, 2, 224590)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (9, 8, 2, 1, 1)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (10, 9, 2, 1, 1)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (11, 10, 4, NULL, NULL)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (12, 11, 4, NULL, NULL)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (13, 12, 4, NULL, NULL)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (14, 13, 4, NULL, NULL)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (15, 13, 3, NULL, NULL)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (16, 19, 4, 1, 125000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (17, 20, 4, 1, 231000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (18, 20, 3, 1, 120000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (19, 21, 4, 1, 231000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (20, 22, 4, 1, 231000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (21, 22, 3, 1, 120000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (22, 21, 3, 1, 120000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (23, 23, 4, 1, 231000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [sanp_id], [SoLuong], [GiaMua]) VALUES (24, 23, 3, 1, 120000)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonBan] ON 

INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHoaDonBan], [SoHoaDon], [sanp_id], [SoLuong], [GiaBan]) VALUES (2, 1, 2, 1, 125000)
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHoaDonBan], [SoHoaDon], [sanp_id], [SoLuong], [GiaBan]) VALUES (3, 1, 2, 1, 125000)
INSERT [dbo].[ChiTietHoaDonBan] ([MaChiTietHoaDonBan], [SoHoaDon], [sanp_id], [SoLuong], [GiaBan]) VALUES (4, 1, 3, 1, 87000)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonBan] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonNhap] ON 

INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHoaDonNhap], [SoHoaDon], [sanp_id], [SoLuong], [DonGia]) VALUES (2, 1, 2, 10, 1350000)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHoaDonNhap], [SoHoaDon], [sanp_id], [SoLuong], [DonGia]) VALUES (3, 1, 3, 10, 2350000)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaChiTietHoaDonNhap], [SoHoaDon], [sanp_id], [SoLuong], [DonGia]) VALUES (4, 2, 4, 10, 2540000)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[danhmucs] ON 

INSERT [dbo].[danhmucs] ([maDanhMuc], [tenDanhMuc]) VALUES (2, N'Văn học nước ngoài')
INSERT [dbo].[danhmucs] ([maDanhMuc], [tenDanhMuc]) VALUES (4, N'Văn học Việt Nam')
INSERT [dbo].[danhmucs] ([maDanhMuc], [tenDanhMuc]) VALUES (5, N'Tham khảo')
INSERT [dbo].[danhmucs] ([maDanhMuc], [tenDanhMuc]) VALUES (6, N'Thiếu nhi')
SET IDENTITY_INSERT [dbo].[danhmucs] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (1, CAST(N'2023-11-04' AS Date), N'Chưa xác nhận', 1234342, 1)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (2, CAST(N'2023-11-05' AS Date), N'string', 0, 1)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (3, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 5)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (4, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 6)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (5, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 7)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (6, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 8)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (7, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 9)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (8, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 10)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (9, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 11)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (10, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 13)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (11, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 12)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (12, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 14)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (13, CAST(N'2023-11-06' AS Date), N'Chưa xác nhận', 1, 15)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (14, CAST(N'2023-11-07' AS Date), N'Chưa xác nhận', 1, 16)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (15, CAST(N'2023-11-07' AS Date), N'Chưa xác nhận', 1, 17)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (16, CAST(N'2023-11-07' AS Date), N'Chưa xác nhận', 1, 18)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (17, CAST(N'2023-11-07' AS Date), N'Chưa xác nhận', 1, 20)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (18, CAST(N'2023-11-07' AS Date), N'Chưa xác nhận', 1, 19)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (19, CAST(N'2023-11-07' AS Date), N'Chưa xác nhận', 1, 21)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (20, CAST(N'2023-11-07' AS Date), N'Chưa xác nhận', 1, 22)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (21, CAST(N'2023-11-07' AS Date), N'Chưa xác nhận', 351000, 23)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (22, CAST(N'2023-11-07' AS Date), N'Chưa xác nhận', 351000, 24)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TrangThai], [ToTal], [MaKhachHang]) VALUES (23, CAST(N'2023-11-19' AS Date), N'Chưa xác nhận', 351000, 25)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[GiaCa] ON 

INSERT [dbo].[GiaCa] ([MaSo], [sanp_id], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (1, 2, CAST(N'2023-08-14' AS Date), NULL, 230000)
INSERT [dbo].[GiaCa] ([MaSo], [sanp_id], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (2, 3, CAST(N'2023-08-14' AS Date), NULL, 120000)
INSERT [dbo].[GiaCa] ([MaSo], [sanp_id], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (3, 4, CAST(N'2023-08-14' AS Date), NULL, 231000)
INSERT [dbo].[GiaCa] ([MaSo], [sanp_id], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (4, 7, CAST(N'2023-08-14' AS Date), CAST(N'2023-08-14' AS Date), 124000)
INSERT [dbo].[GiaCa] ([MaSo], [sanp_id], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (5, 8, CAST(N'2023-11-13' AS Date), NULL, 250000)
SET IDENTITY_INSERT [dbo].[GiaCa] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonBan] ON 

INSERT [dbo].[HoaDonBan] ([SoHoaDon], [NgayBan], [MaNguoiDung], [ToTal]) VALUES (1, CAST(N'2023-10-29' AS Date), 1, 125000)
SET IDENTITY_INSERT [dbo].[HoaDonBan] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonNhap] ON 

INSERT [dbo].[HoaDonNhap] ([SoHoaDon], [NgayNhap], [MaNguoiDung], [nsx_id], [ToTal]) VALUES (1, CAST(N'2023-10-29' AS Date), 1, 1, 1450000)
INSERT [dbo].[HoaDonNhap] ([SoHoaDon], [NgayNhap], [MaNguoiDung], [nsx_id], [ToTal]) VALUES (2, CAST(N'2023-10-28' AS Date), 1, 1, 2450000)
SET IDENTITY_INSERT [dbo].[HoaDonNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (1, N'Đinh Thành Luân', N'Hưng Yên', N'luan2k2hy@gmail.com', N'0987676753')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (2, N'kj', N'string', N'string', N'string')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (3, N'kj', N'string', N'string', N'string')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (4, N'ds', N'string', N'string', N'string')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (5, N'Phí Văn An', N'Ân Thi-Hưng Yên', N'An@gmail.com', N'0978654567')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (6, N'Phí Văn An', N'Ân Thi-Hưng Yên', N'An@gmail.com', N'0978654567')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (7, N'Phí Văn An', N'Ân Thi-Hưng Yên', N'An@gmail.com', N'0978654567')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (8, N'Phí Văn An', N'Ân Thi-Hưng Yên', N'An@gmail.com', N'0978654567')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (9, N'Phí Văn An', N'Ân Thi-Hưng Yên', N'An@gmail.com', N'0978654567')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (10, N'a', N'a', N'a', N'a')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (11, N'Đinh Thành Luân', N'Đặng Lễ-Ân Thi-Hưng Yên', N'luan2k2hy@gmail.com', N'0987878786')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (12, N'Đinh Thành Luân', N'Đặng Lễ-Ân Thi-Hưng Yên', N'luan2k2hy@gmail.com', N'0987878786')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (13, N'Đinh Thành Luân', N'Đặng Lễ-Ân Thi-Hưng Yên', N'luan2k2hy@gmail.com', N'0987878786')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (14, N'Đinh Thành Luân', N'Đặng Lễ-Ân Thi-Hưng Yên', N'luan2k2hy@gmail.com', N'0987878786')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (15, N'Nguyễn Văn An', N'Đặng Lễ-Ân Thi-Hưng Yên', N'fuji@gmail.com', N'0987878786')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (16, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (17, N'b', N'b', N'b', N'b')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (18, N'b', N'b', N'b', N'b')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (19, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (20, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (21, N'Luaa', N'Hung Yen', N'luan@gmail.com', N'0987656787')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (22, N'Đinh Thành Luân', N'Đặng Lễ-Ân Thi-Hưng Yên', N'luan2k2hy@gmail.com', N'0987878786')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (23, N'Đinh Thành Luân', N'Đặng Lễ-Ân Thi-Hưng Yên', N'luan2k2hy@gmail.com', N'0987878786')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (24, N'Đinh Thành Luân', N'Đặng Lễ-Ân Thi-Hưng Yên', N'luan2k2hy@gmail.com', N'0987878786')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SDT]) VALUES (25, N'Đinh Thành Luân', N'Đặng Lễ-Ân Thi-Hưng Yên', N'luan2k2hy@gmail.com', N'0987878786')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[Loaisp] ON 

INSERT [dbo].[Loaisp] ([loai_id], [loai_name]) VALUES (2, N'Tình cảm/Lãng mạn')
INSERT [dbo].[Loaisp] ([loai_id], [loai_name]) VALUES (3, N'Kiếm hiệp')
INSERT [dbo].[Loaisp] ([loai_id], [loai_name]) VALUES (4, N'Huyền ảo - Giả tưởng')
INSERT [dbo].[Loaisp] ([loai_id], [loai_name]) VALUES (5, N'Sử/kí')
INSERT [dbo].[Loaisp] ([loai_id], [loai_name]) VALUES (12, N'Tham khảo')
INSERT [dbo].[Loaisp] ([loai_id], [loai_name]) VALUES (23, N'Thiếu nhi')
INSERT [dbo].[Loaisp] ([loai_id], [loai_name]) VALUES (29, N'Văn học Việt Nam')
INSERT [dbo].[Loaisp] ([loai_id], [loai_name]) VALUES (32, N'Văn học nước ngoài')
SET IDENTITY_INSERT [dbo].[Loaisp] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT]) VALUES (1, N'Đinh Thành Luân', CAST(N'2002-09-15' AS Date), N'Nam', N'Đặng Lễ-Ân Thi-Hưng Yên', N'luan2k2hy@gmail.com', N'0971877014')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT]) VALUES (2, N'Nguyễn Quang Anh', CAST(N'2002-09-01' AS Date), N'Nam', N'Đặng Lễ-Ân Thi-Hưng Yên', N'anh2k2@gmail.com', N'0978765654')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT]) VALUES (3, N'Hoàng Hào Vũ', CAST(N'2002-03-09' AS Date), N'Nam', N'Yên Mỹ-Mỹ Hào-Hưng Yên', N'vu@gmail.com', N'0978656765')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[Nhasx] ON 

INSERT [dbo].[Nhasx] ([nsx_id], [nsx_name], [diachi], [sdt]) VALUES (1, N'Nhã Nam', N'120 Cầu Giấy, Hà Nội', 978787666)
INSERT [dbo].[Nhasx] ([nsx_id], [nsx_name], [diachi], [sdt]) VALUES (2, N'IPM', N'Số 103,Cầu Giấy, Hà Nội ', 971877014)
SET IDENTITY_INSERT [dbo].[Nhasx] OFF
GO
SET IDENTITY_INSERT [dbo].[productComment] ON 

INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (1, 2, 1, N'hay')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (2, 3, 2, N'Chất lượng')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (3, 4, 3, N'hay')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (4, 2, 2, N'5 sao')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (5, 2, 2, N'5 sao')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (8, 2, 2, N'Đỉnh')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (9, 3, 2, N'Hay')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (10, 3, 2, N'5 sao')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (11, 2, 2, N'Chất lượng')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (12, 3, 2, N'Đỉnh')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (13, 3, 2, N'Chất')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (14, 3, 2, N'sdf')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (15, 3, 2, N'dfg')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (16, 3, 2, N'dfg')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (17, 4, 2, N'không hay')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (18, 2, 2, N'hay')
INSERT [dbo].[productComment] ([id], [sanp_id], [MaNguoiDung], [noiDung]) VALUES (19, 2, 2, N'hay')
SET IDENTITY_INSERT [dbo].[productComment] OFF
GO
SET IDENTITY_INSERT [dbo].[Sanpham] ON 

INSERT [dbo].[Sanpham] ([sanp_id], [sanp_name], [size], [TG_id], [loai_id], [nsx_id], [sotrang], [tomtat], [namsx], [image]) VALUES (2, N'Dịch bệnh Atlantis', N'23x32', 1, 2, 1, 230, N'...', CAST(N'2023-08-14T01:09:18.547' AS DateTime), N'1YF9HFCE.jpg')
INSERT [dbo].[Sanpham] ([sanp_id], [sanp_name], [size], [TG_id], [loai_id], [nsx_id], [sotrang], [tomtat], [namsx], [image]) VALUES (3, N'Trồng cây gây rừng', N'23x32', 1, 2, 1, 230, N'...', CAST(N'2023-08-14T01:12:38.433' AS DateTime), N'3UBHZDJM.jpg')
INSERT [dbo].[Sanpham] ([sanp_id], [sanp_name], [size], [TG_id], [loai_id], [nsx_id], [sotrang], [tomtat], [namsx], [image]) VALUES (4, N'Dù được ban đôi cánh', N'24x15', 2, 3, 1, 125, N'...', CAST(N'2023-08-14T01:15:48.813' AS DateTime), N'4WBD9Q8Y.jpg')
INSERT [dbo].[Sanpham] ([sanp_id], [sanp_name], [size], [TG_id], [loai_id], [nsx_id], [sotrang], [tomtat], [namsx], [image]) VALUES (7, N'Đại Nam', N'21x12', 3, 3, 1, 231, N'...', NULL, N'7YYWZJ3H.jpg')
INSERT [dbo].[Sanpham] ([sanp_id], [sanp_name], [size], [TG_id], [loai_id], [nsx_id], [sotrang], [tomtat], [namsx], [image]) VALUES (8, N'Đại Nam', N'25x15', 2, 3, 2, 240, N'...', CAST(N'2001-09-09T00:00:00.000' AS DateTime), N'7YYWZJ3H.jpg')
SET IDENTITY_INSERT [dbo].[Sanpham] OFF
GO
SET IDENTITY_INSERT [dbo].[TG] ON 

INSERT [dbo].[TG] ([TG_id], [TG_name], [TG_diachi], [sdt], [email]) VALUES (1, N'Nguyễn Văn Vinh', N'Cầu Giấy, Hà Nội', 978766554, N'Vinh@gmail.com')
INSERT [dbo].[TG] ([TG_id], [TG_name], [TG_diachi], [sdt], [email]) VALUES (2, N'Đinh Thành Anh', N'Cầu Giấy, Hà Nội', 978766554, N'Anh@gmail.com')
INSERT [dbo].[TG] ([TG_id], [TG_name], [TG_diachi], [sdt], [email]) VALUES (3, N'Đinh Hoàng Anh', N'Cầu Giấy, Hà Nội', 978766554, N'Anh@gmail.com')
SET IDENTITY_INSERT [dbo].[TG] OFF
GO
ALTER TABLE [dbo].[Nhasx] ADD  DEFAULT ((0)) FOR [diachi]
GO
ALTER TABLE [dbo].[Nhasx] ADD  DEFAULT ((0)) FOR [sdt]
GO
ALTER TABLE [dbo].[Sanpham] ADD  DEFAULT ((0)) FOR [tomtat]
GO
ALTER TABLE [dbo].[TG] ADD  DEFAULT ((0)) FOR [TG_diachi]
GO
ALTER TABLE [dbo].[TG] ADD  DEFAULT ((0)) FOR [sdt]
GO
ALTER TABLE [dbo].[ChiTietAnh]  WITH CHECK ADD FOREIGN KEY([sanp_id])
REFERENCES [dbo].[Sanpham] ([sanp_id])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([sanp_id])
REFERENCES [dbo].[Sanpham] ([sanp_id])
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD FOREIGN KEY([sanp_id])
REFERENCES [dbo].[Sanpham] ([sanp_id])
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD FOREIGN KEY([SoHoaDon])
REFERENCES [dbo].[HoaDonBan] ([SoHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([sanp_id])
REFERENCES [dbo].[Sanpham] ([sanp_id])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([SoHoaDon])
REFERENCES [dbo].[HoaDonNhap] ([SoHoaDon])
GO
ALTER TABLE [dbo].[ChiTietKho]  WITH CHECK ADD FOREIGN KEY([MaKho])
REFERENCES [dbo].[Kho] ([MaKho])
GO
ALTER TABLE [dbo].[ChiTietKho]  WITH CHECK ADD FOREIGN KEY([sanp_id])
REFERENCES [dbo].[Sanpham] ([sanp_id])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[GiaCa]  WITH CHECK ADD FOREIGN KEY([sanp_id])
REFERENCES [dbo].[Sanpham] ([sanp_id])
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([nsx_id])
REFERENCES [dbo].[Nhasx] ([nsx_id])
GO
ALTER TABLE [dbo].[productComment]  WITH CHECK ADD FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[productComment]  WITH CHECK ADD FOREIGN KEY([sanp_id])
REFERENCES [dbo].[Sanpham] ([sanp_id])
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD FOREIGN KEY([loai_id])
REFERENCES [dbo].[Loaisp] ([loai_id])
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD FOREIGN KEY([nsx_id])
REFERENCES [dbo].[Nhasx] ([nsx_id])
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD FOREIGN KEY([TG_id])
REFERENCES [dbo].[TG] ([TG_id])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
/****** Object:  StoredProcedure [dbo].[sp_banchay_get_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_banchay_get_by_id](@SoLuong int)
AS
    BEGIN
 --       SELECT TOP (1) ChiTietHoaDonBan.sanp_id ,SUM(ChiTietHoaDonBan.SoLuong) as SL
	--FROM SanPham inner  JOIN ChiTietHoaDonBan on ChiTietHoaDonBan.sanp_id = SanPham.sanp_id
	--GROUP BY ChiTietHoaDonBan.sanp_id
	SELECT TOP (@SoLuong) ChiTietDonHang.sanp_id, Sanpham.sanp_name, Sanpham.Size, Sanpham.TG_id, Sanpham.loai_id, Sanpham.nsx_id, Sanpham.sotrang, Sanpham.tomtat,
	Sanpham.namsx, Sanpham.Image, GiaCa.Gia,SUM(ChiTietDonHang.SoLuong) as SL
	FROM SanPham inner  JOIN  ChiTietDonHang on ChiTietDonHang.sanp_id = SanPham.sanp_id inner join GiaCa on GiaCa.sanp_id = Sanpham.sanp_id
	GROUP BY ChiTietDonHang.sanp_id, Sanpham.sanp_name, Sanpham.Size, Sanpham.TG_id, Sanpham.loai_id, Sanpham.nsx_id, Sanpham.sotrang, Sanpham.tomtat,
	Sanpham.namsx, Sanpham.Image, GiaCa.Gia
	order by SL desc
	
	
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhmuc_create]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_danhmuc_create]
(
 @TenDanhMuc       NVARCHAR(250)
)
AS
    BEGIN
      INSERT INTO danhmucs
                (  
				
				tenDanhMuc
                )
                VALUES
                ( @TenDanhMuc
                );
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhmuc_delete_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[sp_danhmuc_delete_by_id](@MaDanhMuc int)
AS
    BEGIN
        Delete From danhmucs
      where  maDanhMuc = @MaDanhMuc;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhmuc_get_all_data]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create PROCEDURE [dbo].[sp_danhmuc_get_all_data](@SoLuong int)
AS
    BEGIN
        SELECT TOP(@SoLuong) * FROM danhmucs;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhmuc_get_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[sp_danhmuc_get_by_id](@MaDanhMuc int)
AS
    BEGIN
        SELECT *                       
        FROM danhmucs
      where  maDanhMuc = @MaDanhMuc;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhmuc_update]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_danhmuc_update]
(
@MaDanhMuc             int, 

 @TenDanhMuc       NVARCHAR(250)

)
AS
    BEGIN
     
	 Update   danhmucs
	  set  
	  
	  tenDanhMuc = @TenDanhMuc
	  
	  Where maDanhMuc = @MaDanhMuc
      
	  SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_donhang_create]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[sp_donhang_create]
(@khach      NVARCHAR(MAX),  
 @listchitiet NVARCHAR(MAX)
)
AS
    BEGIN
	 IF(@khach IS NOT NULL)
	 Begin
	   INSERT INTO KhachHang
                (TenKhachHang, 
                 DiaChi,
				 Email,
				 SDT
                )
		 SELECT JSON_VALUE(@khach, '$.tenKhachHang'), 
				JSON_VALUE(@khach, '$.diaChi'), 
				
				JSON_VALUE(@khach, '$.email'), 
				JSON_VALUE(@khach, '$.soDienThoai')
	 end;
	 IF(@listchitiet IS NOT NULL)
	 Begin
	    -- Thêm bảng đơn hàng
		INSERT INTO DonHang
        (MaKhachHang, 
            NgayDat, 
            TrangThai              
        )
        VALUES
        (IDENT_CURRENT('KhachHang'), 
            GETDATE(), 
            1
        );
		-- Thêm bảng chi tiết đơn hàng
        INSERT INTO ChiTietDonHang
                (   MaDonHang, 
                    sanp_id, 
                    SoLuong, 
                    GiaMua                       
                )
        SELECT 
			IDENT_CURRENT('DonHang'),		
			JSON_VALUE(p.value, '$.sanp_id'), 
			JSON_VALUE(p.value, '$.soLuong'), 
			JSON_VALUE(p.value, '$.giaMua')    
        FROM OPENJSON(@listchitiet) AS p;
	end;
    SELECT '';
   END;
GO
/****** Object:  StoredProcedure [dbo].[sp_donhang_get_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_donhang_get_by_id](@MaDonHang int)
AS
    BEGIN
        SELECT 
		d.MaDonHang,
		d.NgayDat,
		k.TenKhachHang,
		k.DiaChi,
		k.Email,
			   	(
					SELECT 
						c.sanp_id,
						c.SoLuong,
						c.GiaMua,
						s.sanp_name
						
					FROM ChiTietDonHang AS c
					Inner Join SanPham s on c.sanp_id = s.sanp_id
					WHERE c.MaDonHang = d.MaDonHang FOR JSON PATH
				) AS listjson_chitiet
        FROM DonHang d
		Inner Join KhachHang k on d.MaKhachHang = k.MaKhachHang
      where  d.MaDonHang = @MaDonHang;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_donhang_search]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_donhang_search] (@page_index  INT, 
                                       @page_size   INT,
									   @TenKhachHang Nvarchar(250),
									   @SoDienThoai varchar(20),
									   @Email varchar(50),
									   @fr_NgayDat Datetime,
									   @to_NgayDat Datetime
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(
                              ORDER BY d.NgayDat ASC)) AS RowNumber, 
                               d.MaDonHang,
							   d.NgayDat,
							  k.TenKhachHang,
							  k.DiaChi
                        INTO #Results1
                        FROM [DonHang] AS d
						Inner Join KhachHang k On d.MaKhachHang = k.MaKhachHang
					    WHERE    (@TenKhachHang = ''  OR (k.TenKhachHang LIKE '%' + @TenKhachHang + '%')) AND
								 (@SoDienThoai = ''  OR (k.SDT LIKE '%' + @SoDienThoai + '%')) AND
								 (@Email = ''  OR (k.Email LIKE '%' + @Email + '%')) AND 
							     ((@fr_NgayDat IS NULL AND @to_NgayDat IS NULL)
                                    OR (@fr_NgayDat IS NOT NULL
                                       AND @to_NgayDat IS NULL
                                       AND d.NgayDat >= @fr_NgayDat)
                                    OR (@fr_NgayDat IS NULL
                                       AND @to_NgayDat IS NOT NULL
                                       AND d.NgayDat <= @to_NgayDat)
                                   OR (d.NgayDat BETWEEN @fr_NgayDat AND @to_NgayDat));                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(
                              ORDER BY d.NgayDat ASC)) AS RowNumber, 
                               d.MaDonHang,
							   d.NgayDat,
							  k.TenKhachHang,
							  k.DiaChi
                        INTO #Results2
                        FROM [DonHang] AS d
						Inner Join KhachHang k On d.MaKhachHang = k.MaKhachHang
					    WHERE    (@TenKhachHang = ''  OR (k.TenKhachHang LIKE '%' + @TenKhachHang + '%')) AND
								 (@SoDienThoai = ''  OR (k.SDT LIKE '%' + @SoDienThoai + '%')) AND
								 (@Email = ''  OR (k.Email LIKE '%' + @Email + '%')) AND
								 ((@fr_NgayDat IS NULL AND @to_NgayDat IS NULL)
                                    OR (@fr_NgayDat IS NOT NULL
                                       AND @to_NgayDat IS NULL
                                       AND d.NgayDat >= @fr_NgayDat)
                                    OR (@fr_NgayDat IS NULL
                                       AND @to_NgayDat IS NOT NULL
                                       AND d.NgayDat <= @to_NgayDat)
                                   OR (d.NgayDat BETWEEN @fr_NgayDat AND @to_NgayDat));                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_hoadonnhap_create]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_hoadonnhap_create]
(
 
 @MaNguoiDung int,
 @nsx_id int,
 @listchitiet nvarchar(max)
 --@maSanPham nvarchar(10),
 --@soLuong nvarchar(10),
 --@donGiaNhap nvarchar(10)



)
AS
    BEGIN
	--IF(@listchitiet is not null)

      INSERT INTO HoaDonNhap
                (  
				
				NgayNhap,
				MaNguoiDung,
				nsx_id
                )
                VALUES
                (
				GETDATE(),
				@MaNguoiDung,
				@nsx_id
                );
		

		INSERT INTO ChiTietHoaDonNhap
                (
				
				SoHoaDon,
				sanp_id,
				SoLuong,
				DonGia
                )
		--values
		--(@@IDENTITY, @maSanPham, @soLuong, @donGiaNhap)
		--Update ChiTietKho
		--set SoLuong = SoLuong + @soLuong
		--where sanp_id = @maSanPham
		--values(@@IDENTITY, @SoLuong,@DonGia)
        SELECT 
			IDENT_CURRENT('HoaDonNhap'),
			
			JSON_VALUE(p.value, '$.maSanPham'),
			JSON_VALUE(p.value, '$.soLuong'),
			JSON_VALUE(p.value, '$.donGiaNhap')
        FROM OPENJSON(@listchitiet) as p;
		--Update ChiTietKho
		--set SoLuong +='$.soLuong'
		--where sanp_id = '$.maSanPham'
		end

        SELECT '';
GO
/****** Object:  StoredProcedure [dbo].[sp_home_get_loaisp_by_danhmuc]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[sp_home_get_loaisp_by_danhmuc](@MaDanhMuc int)
AS
    BEGIN
        SELECT *                       
        FROM Loaisp
      where  danhmuc_id = @MaDanhMuc;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_home_get_sanpham_by_loáip]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_home_get_sanpham_by_loáip](@MaLoaisp int)
AS
    BEGIN
        SELECT *                       
        FROM Sanpham
      where  loai_id = @MaLoaisp;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_home_get_sanpham_by_nhasx]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_home_get_sanpham_by_nhasx](@matacgia int)
AS
    BEGIN
        SELECT *                       
        FROM Sanpham
      where nsx_id = @matacgia;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_home_get_sanpham_by_tacgia]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_home_get_sanpham_by_tacgia](@matacgia int)
AS
    BEGIN
        SELECT *                       
        FROM Sanpham
      where TG_id = @matacgia;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_home_getsp_by_loai]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[sp_home_getsp_by_loai](@SoLuong int,@Ten int)
AS
    BEGIN
        SELECT TOP(@SoLuong) *                       
        FROM Sanpham
      where  loai_id = @Ten;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_home_sach_cungtacgia]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_home_sach_cungtacgia](@MaTacGia int, @SoLuong int)
AS
    BEGIN
        SELECT top(@soluong) *                     
        FROM Sanpham
      where TG_id = @MaTacGia;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_home_timkiem_sanpham]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_home_timkiem_sanpham](@string nvarchar(50))
AS
    BEGIN
        SELECT *                       
        FROM Sanpham c inner join TG d on c.TG_id = d.TG_id
      where  c.sanp_name like @string or d.TG_name = @string
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_kho_create]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_kho_create]
(
 @TenKho nvarchar(50),
 @DiaChi nvarchar(50),
 @sanp_id int,
 @SoLuong int
)
AS
    BEGIN
      INSERT INTO Kho
                (  
				
				TenKho,
				DiaChi
                )
                VALUES
                (
				@TenKho,
				@DiaChi
                );
	   Insert into ChiTietKho(
	   MaKho, sanp_id, SoLuong) values(@@IDENTITY, @sanp_id, @SoLuong);
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_kho_delete_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_kho_delete_by_id](@MaKho int)
AS
    BEGIN
        Delete From Kho
      where  MaKho = @MaKho;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_kho_get_all_data]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_kho_get_all_data](@SoLuong int)
AS
    BEGIN
        SELECT TOP(@SoLuong) * FROM Kho;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_kho_get_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_kho_get_by_id](@MaKho int)
AS
    BEGIN
        SELECT *                       
        FROM Kho
      where  MaKho = @MaKho;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_kho_update]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_kho_update]
(
@MaKho int,
@TenKho nvarchar(50),
@DiaChi nvarchar(50),
@sanp_id int,
@SoLuong int
)
AS
    BEGIN
     
	 Update   Kho
	  set  
	  TenKho = @TenKho,
	  DiaChi = @DiaChi
	  
	  
	  Where MaKho = @MaKho
     UpDate ChiTietKho
	 set
	  sanp_id = @sanp_id,
	  SoLuong = @SoLuong
	Where MaKho = @MaKho
	  SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_loaisp_create]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_loaisp_create]
(
 @loai_name       NVARCHAR(250),
 @danhmuc_id int
)
AS
    BEGIN
      INSERT INTO Loaisp
                (  
				
				loai_name,
				danhmuc_id
                )
                VALUES
                (
				@loai_name,
				@danhmuc_id
                );
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_loaisp_delete_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create PROCEDURE [dbo].[sp_loaisp_delete_by_id](@MaLoaisp int)
AS
    BEGIN
        Delete From Loaisp
      where  loai_id = @MaLoaisp;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_loaisp_get_all_data]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_loaisp_get_all_data](@SoLuong int)
AS
    BEGIN
        SELECT TOP(@SoLuong) * FROM Loaisp;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_loaisp_get_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create PROCEDURE [dbo].[sp_loaisp_get_by_id](@MaLoaisp int)
AS
    BEGIN
        SELECT *                       
        FROM Loaisp
      where  loai_id = @MaLoaisp;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_loaisp_update]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_loaisp_update]
(
@loai_id int,
@loai_name nvarchar(50),
@danhmuc_id int

)
AS
    BEGIN
     
	 Update   Loaisp
	  set  
	  
	  loai_name = @loai_name,
	  danhmuc_id = @danhmuc_id
	  
	  Where loai_id = @loai_id
      
	  SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_nguoidung_create]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_nguoidung_create]
(
 @HoTen nvarchar(50),
 @NgaySinh Date,
 @GioiTinh nvarchar(50),
 @DiaChi nvarchar(50),
 @Email nvarchar(50),
 @SDT nvarchar(50)
)
AS
    BEGIN
      INSERT INTO NguoiDung
                (  
				
				HoTen, NgaySinh, GioiTinh, DiaChi, Email, SDT
                )
                VALUES
                (
				@HoTen, @NgaySinh, @GioiTinh, @DiaChi, @Email, @SDT
                );
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_nguoidung_delete_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_nguoidung_delete_by_id](@MaNguoiDung int)
AS
    BEGIN
        Delete From NguoiDung
      where  MaNguoiDung = @MaNguoiDung;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_nguoidung_get_all_data]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_nguoidung_get_all_data](@SoLuong int)
AS
    BEGIN
        SELECT TOP(@SoLuong) * FROM NguoiDung;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_nguoidung_get_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_nguoidung_get_by_id](@MaNguoiDung int)
AS
    BEGIN
        SELECT *                       
        FROM NguoiDung
      where  MaNguoiDung = @MaNguoiDung;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_nguoidung_update]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_nguoidung_update]
(
@MaNguoiDung int,
 @HoTen nvarchar(50),
 @NgaySinh Date,
 @GioiTinh nvarchar(50),
 @DiaChi nvarchar(50),
 @Email nvarchar(50),
 @SDT nvarchar(50)
)
AS
    BEGIN
     
	 Update   NguoiDung
	  set  
	  HoTen = @HoTen,
	  NgaySinh = @NgaySinh,
	  GioiTinh = @GioiTinh,
	  DiaChi = @DiaChi,
	  Email = @Email,
	  SDT = @SDT
	  
	  
	  
	  Where MaNguoiDung = @MaNguoiDung
      
	  SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_nhasanxuat_delete_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_nhasanxuat_delete_by_id](@MaNhaSanXuat int)
AS
    BEGIN
        Delete From Nhasx
      where  nsx_id = @MaNhaSanXuat;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_nhasanxuat_get_all_data]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_nhasanxuat_get_all_data](@SoLuong int)
AS
    BEGIN
        SELECT TOP(@SoLuong) * FROM Nhasx;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_nhasanxuat_get_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create PROCEDURE [dbo].[sp_nhasanxuat_get_by_id](@MaNhaSanXuat int)
AS
    BEGIN
        SELECT *                       
        FROM Nhasx
      where  nsx_id = @MaNhaSanXuat;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_sach_create]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_sach_create]
(
 @sanp_name nvarchar(50),
 @size nvarchar(50),
 @TG_id int,
 @loai_id int,
 @nsx_id int,
 @sotrang int,
 @tomtat nvarchar(2000),
 @namsx datetime,
 @Image nvarchar(1000)


)
AS
    BEGIN
      INSERT INTO Sanpham
                (  
				
				sanp_name,
				Size,
				TG_id,
				loai_id,
				nsx_id,
				sotrang,
				tomtat,
				namsx,
				Image
                )
                VALUES
                (
				@sanp_name,
				@size,
				@TG_id,
				@loai_id,
				@nsx_id,
				@sotrang,
				@tomtat,
				@namsx,
				@Image
                );
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_sach_update]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_sach_update]
(
@sanp_id int,
 @sanp_name nvarchar(50),
 @size nvarchar(50),
 @TG_id int,
 @loai_id int,
 @nsx_id int,
 @sotrang int,
 @tomtat nvarchar(2000),
 @namsx datetime,
 @Image nvarchar(1000)
)
AS
    BEGIN
     
	 Update   Sanpham
	  set  
	  sanp_name = @sanp_name,
	  Size = @size,
	  TG_id = @TG_id,
	  loai_id = @loai_id,
	  nsx_id = @nsx_id,
	  sotrang = @sotrang,
	  tomtat = @tomtat,
	  namsx = @namsx,
	  Image = @Image
	  
	  
	  Where sanp_id = @sanp_id
      
	  SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_create]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sanpham_create]
(
 @sanp_name nvarchar(50),
 @size nvarchar(50),
 @TG_id int,
 @loai_id int,
 @nsx_id int,
 @sotrang int,
 @tomtat nvarchar(2000),
 @namsx datetime,
 @Image nvarchar(1000),
 @GiaCa int,
 @NgayBatDau date,
 @NgayKetThuc date,
 @ListAnh nvarchar(max)

)
AS
    BEGIN
      INSERT INTO Sanpham
                (  
				
				sanp_name,
				Size,
				TG_id,
				loai_id,
				nsx_id,
				sotrang,
				tomtat,
				namsx,
				Image
                )
                VALUES
                (
				@sanp_name,
				@size,
				@TG_id,
				@loai_id,
				@nsx_id,
				@sotrang,
				@tomtat,
				@namsx,
				@Image
                );
		Insert into GiaCa(sanp_id, NgayBatDau, NgayKetThuc, Gia)
		values(@@IDENTITY, @NgayBatDau, @NgayKetThuc, @GiaCa)

		INSERT INTO ChiTietAnh
                (
				sanp_id,
				Anh
                )
        SELECT 
			IDENT_CURRENT('Sanpham'),		
			JSON_VALUE(p.value, '$.Anh')  
        FROM OPENJSON(@ListAnh) AS p;


        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_delete_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_sanpham_delete_by_id](@MaLoaisp int)
AS
    BEGIN
        Delete From Sanpham
      where  sanp_id = @MaLoaisp;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_get_all_data]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sanpham_get_all_data]
AS
    BEGIN
        SELECt * FROM Sanpham;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_sanpham_get_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create PROCEDURE [dbo].[sp_sanpham_get_by_id](@MaSanPham int)
AS
    BEGIN
        SELECT *                       
        FROM Sanpham
      where  sanp_id = @MaSanPham;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_sanphammoitaiban_get_all_data]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_sanphammoitaiban_get_all_data](@SoLuong int)
AS
    BEGIN
        SELECT TOP(@SoLuong) * FROM Sanpham order by namsx Desc;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_tacgia_create]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_tacgia_create]
(
 @TenTacGia nvarchar(50),
 @DiaChi nvarchar(50),
 @sdt  int
)
AS
    BEGIN
      INSERT INTO TG
                (  
				
				TG_name,
				TG_diachi,
				sdt
                )
                VALUES
                (
				@TenTacGia,
				@DiaChi,
				@sdt
                );
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_tacgia_delete_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_tacgia_delete_by_id](@MaTacGia int)
AS
    BEGIN
        Delete From TG
      where  TG_id = @MaTacGia;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_tacgia_get_all_data]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_tacgia_get_all_data](@SoLuong int)
AS
    BEGIN
        SELECT TOP(@SoLuong) * FROM TG;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_tacgia_get_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_tacgia_get_by_id](@MaTacGia int)
AS
    BEGIN
        SELECT *                       
        FROM TG
      where  TG_id = @MaTacGia;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_tacgia_update]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_tacgia_update]
(
@MaTacGia int,
@TenTacGia nvarchar(50),
@DiaChi nvarchar(50),
@sdt int
)
AS
    BEGIN
     
	 Update   TG
	  set  
	  TG_name = @TenTacGia,
	  TG_diachi = @DiaChi,
	  sdt = @sdt
	  
	  
	  Where TG_id = @MaTacGia
      
	  SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_taikhoan_create]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_taikhoan_create]
(
 @MaNguoiDung int,
 @TaiKhoan nvarchar(50),
 @MatKhau nvarchar(50),
 @NgayBatDau Date,
 @NgayKetThuc Date,
 @TrangThai nvarchar(50),
 @LoaiQuyen nvarchar(50)
)
AS
    BEGIN
      INSERT INTO TaiKhoan
                (  
				
				MaNguoiDung, TaiKhoan, MatKhau, NgayBatDau, NgayKetThuc, TrangThai, LoaiQuyen
                )
                VALUES
                (
				@MaNguoiDung, @TaiKhoan, @MatKhau, @NgayBatDau, @NgayKetThuc ,@TrangThai, @LoaiQuyen
                );
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_taikhoan_delete_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_taikhoan_delete_by_id](@MaTaiKhoan int)
AS
    BEGIN
        Delete From TaiKhoan
      where  MaTaiKhoan = @MaTaiKhoan;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_taikhoan_get_all_data]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_taikhoan_get_all_data](@SoLuong int)
AS
    BEGIN
        SELECT TOP(@SoLuong) * FROM TaiKhoan;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_taikhoan_get_by_id]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_taikhoan_get_by_id](@MaTaiKhoan int)
AS
    BEGIN
        SELECT *                       
        FROM TaiKhoan
      where  MaTaiKhoan = @MaTaiKhoan;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_taikhoan_update]    Script Date: 24/11/2023 11:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_taikhoan_update]
(
@MaTaiKhoan int,
 @MaNguoiDung int,
 @TaiKhoan nvarchar(50),
 @MatKhau nvarchar(50),
 @NgayBatDau Date,
 @NgayKetThuc Date,
 @TrangThai nvarchar(50),
 @LoaiQuyen nvarchar(50)
)
AS
    BEGIN
     
	 Update   TaiKhoan
	  set  
	  MaNguoiDung = @MaNguoiDung,
	  TaiKhoan = @TaiKhoan,
	  MatKhau = @MatKhau,
	  NgayBatDau = @NgayBatDau,
	  NgayKetThuc = @NgayKetThuc,
	  TrangThai = @TrangThai,
	  LoaiQuyen = @LoaiQuyen
	  
	  
	  
	  Where MaTaiKhoan = @MaTaiKhoan
      
	  SELECT '';
    END;
GO
USE [master]
GO
ALTER DATABASE [BanSach] SET  READ_WRITE 
GO
