USE [master]
GO
/****** Object:  Database [SystemControl]    Script Date: 23.01.2020 14:46:01 ******/
CREATE DATABASE [SystemControl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SystemContol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLADMIN\MSSQL\DATA\SystemContol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SystemContol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLADMIN\MSSQL\DATA\SystemContol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SystemControl] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SystemControl].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SystemControl] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SystemControl] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SystemControl] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SystemControl] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SystemControl] SET ARITHABORT OFF 
GO
ALTER DATABASE [SystemControl] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SystemControl] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SystemControl] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SystemControl] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SystemControl] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SystemControl] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SystemControl] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SystemControl] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SystemControl] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SystemControl] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SystemControl] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SystemControl] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SystemControl] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SystemControl] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SystemControl] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SystemControl] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SystemControl] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SystemControl] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SystemControl] SET  MULTI_USER 
GO
ALTER DATABASE [SystemControl] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SystemControl] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SystemControl] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SystemControl] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SystemControl] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SystemControl] SET QUERY_STORE = OFF
GO
USE [SystemControl]
GO
/****** Object:  Table [dbo].[Alarm]    Script Date: 23.01.2020 14:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alarm](
	[AlarmID] [int] IDENTITY(1,1) NOT NULL,
	[AlarmName] [nvarchar](50) NOT NULL,
	[AlarmDescription] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Alarms] PRIMARY KEY CLUSTERED 
(
	[AlarmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmDetail]    Script Date: 23.01.2020 14:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlarmDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AlarmID] [int] NOT NULL,
	[AlarmCause] [nvarchar](100) NOT NULL,
	[AlarmSolution] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AlarmDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bench]    Script Date: 23.01.2020 14:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bench](
	[BenchID] [int] IDENTITY(1,1) NOT NULL,
	[BenchName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bench] PRIMARY KEY CLUSTERED 
(
	[BenchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Device]    Script Date: 23.01.2020 14:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [nvarchar](50) NOT NULL,
	[PersonID] [int] NOT NULL,
	[BenchID] [int] NOT NULL,
 CONSTRAINT [PK_Device] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceInfo]    Script Date: 23.01.2020 14:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [int] NOT NULL,
	[DeviceState] [bit] NOT NULL,
	[DeviceTemperature] [float] NOT NULL,
	[AlarmID] [int] NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_DeviceInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceInfoHistory]    Script Date: 23.01.2020 14:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceInfoHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [int] NOT NULL,
	[DeviceState] [bit] NOT NULL,
	[DeviceTemperature] [float] NOT NULL,
	[AlarmID] [int] NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_DeviceInfoHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 23.01.2020 14:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alarm] ON 

INSERT [dbo].[Alarm] ([AlarmID], [AlarmName], [AlarmDescription]) VALUES (1, N'Aşırı Akım', N'Ana devre akımı, motorun anlık maksimum akım değerinin 1.1 katından daha yüksek.')
INSERT [dbo].[Alarm] ([AlarmID], [AlarmName], [AlarmDescription]) VALUES (2, N'Aşırı Gerilim', N'Ana devre voltajı izin verilen maksimum değeri aştı.')
INSERT [dbo].[Alarm] ([AlarmID], [AlarmName], [AlarmDescription]) VALUES (3, N'Ortam Sıcaklığı ', N'Kutunun ortam sıcaklığı beklenen değerden yüksek.')
INSERT [dbo].[Alarm] ([AlarmID], [AlarmName], [AlarmDescription]) VALUES (4, N'Düşük Gerilim', N'Ana devre voltajı belirtilen minimum değerin altında.')
INSERT [dbo].[Alarm] ([AlarmID], [AlarmName], [AlarmDescription]) VALUES (5, N'Aşırı Yük ', N'Servo motor ve sürücü aşırı yüklendi.')
SET IDENTITY_INSERT [dbo].[Alarm] OFF
SET IDENTITY_INSERT [dbo].[AlarmDetail] ON 

INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (1, 1, N'Sürücü çıkışı için kısa devre mevcut.', N'Kısa devreyi ortadan kaldırın ve metal iletkenlerin maruz kalmasını önleyin.')
INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (2, 1, N'Motor kablolama hatası', N'Kullanım kılavuzundaki kablolama tanımlamasını izleyerek yeniden kablolama yapın.')
INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (3, 1, N'IGBT hatası', N'Sürücüyü dağıtıcılara geri gönderin veya SMB ile bağlantı kurun.')
INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (4, 2, N'Ana devrenin giriş voltajı izin verilen nominal gerilimden yüksek.', N'Doğru güç kaynağı veya seri voltaj regülatörü uygulayın.')
INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (5, 2, N'Servo sürücünün donanımı hasar gördü', N'Sürücüyü distribütörlere geri gönderin ')
INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (6, 3, N'Yanlış güç girişi (Yanlış güç sistemi) .)', N'Doğru güç kaynağına veya seri bağdaştırıcıya uygulayın')
INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (7, 4, N'Yanlış güç girişi', N'Doğru güç kaynağına veya seri adaptöre uygulayın.')
INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (8, 4, N'Ana devrenin giriş voltajı izin verilen nominal gerilimin altındadır.', N'Voltaj kablolamayı tekrar gözden geçirin.')
INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (9, 5, N'Ünite nominal yüklemenin üzerinde', N'Motorun yük kapasitesini artırın veya azaltın.')
INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (10, 5, N'Kontrol sistemi parametresinin ayarı uygun değildir.', N'Aygıtın kazanç değerini ayarlayın.')
INSERT [dbo].[AlarmDetail] ([id], [AlarmID], [AlarmCause], [AlarmSolution]) VALUES (11, 5, N'Kontrol sistemi parametresinin ayarı uygun değildir.', N'Hızlanma ve Yavaşlama sürelerini optimize edin.')
SET IDENTITY_INSERT [dbo].[AlarmDetail] OFF
SET IDENTITY_INSERT [dbo].[Bench] ON 

INSERT [dbo].[Bench] ([BenchID], [BenchName]) VALUES (1, N'Tezgah1')
INSERT [dbo].[Bench] ([BenchID], [BenchName]) VALUES (2, N'Tezgah2')
INSERT [dbo].[Bench] ([BenchID], [BenchName]) VALUES (3, N'Tezgah3')
INSERT [dbo].[Bench] ([BenchID], [BenchName]) VALUES (4, N'Tezgah4')
INSERT [dbo].[Bench] ([BenchID], [BenchName]) VALUES (5, N'Tezgah5')
SET IDENTITY_INSERT [dbo].[Bench] OFF
SET IDENTITY_INSERT [dbo].[Device] ON 

INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (1, N'CihazSY1', 1, 1)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (2, N'CihazSY2', 1, 2)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (3, N'CihazSY3', 1, 3)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (4, N'CihazSY4', 1, 3)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (5, N'CihazSY5', 1, 5)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (6, N'CihazMC1', 2, 1)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (7, N'CihazMC2', 2, 1)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (9, N'CihazMC3', 2, 2)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (10, N'CihazMC4', 2, 3)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (11, N'CihazMC5', 2, 3)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (12, N'CihazMC6', 2, 3)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (13, N'CihazMC7', 2, 4)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (14, N'CihazMC8', 2, 5)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (15, N'CihazSC1', 3, 1)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (16, N'CihazSC2', 3, 2)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (17, N'CihazSC3', 3, 3)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (18, N'CihazSC4', 3, 5)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (19, N'CihazFE1', 4, 1)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (20, N'CihazFE2', 4, 1)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (21, N'CihazFE3', 4, 2)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (22, N'CihazFE4', 4, 2)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (23, N'CihazFE5', 4, 3)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (24, N'CihazFE6', 4, 4)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (25, N'CihazFE7', 4, 5)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (26, N'CihazEM1', 5, 1)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (27, N'CihazEM2', 5, 2)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (28, N'CihazEM3', 5, 3)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (29, N'CihazEM4', 5, 5)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (30, N'CihazMY1', 6, 2)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (31, N'CihazMY2', 6, 2)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (33, N'CihazMY3', 6, 3)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [PersonID], [BenchID]) VALUES (34, N'CihazMY4', 6, 5)
SET IDENTITY_INSERT [dbo].[Device] OFF
SET IDENTITY_INSERT [dbo].[DeviceInfo] ON 

INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (2, 1, 1, 36.5, 5, CAST(N'2020-07-13T21:02:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (3, 2, 0, 36, 1, CAST(N'2020-09-27T01:50:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (4, 3, 1, 43, NULL, CAST(N'2020-01-15T11:58:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (5, 4, 1, 45.3, NULL, CAST(N'2020-06-12T17:02:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (6, 5, 0, 34.34, 1, CAST(N'2020-06-04T00:44:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (7, 6, 1, 35, NULL, CAST(N'2020-04-05T22:08:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (8, 7, 1, 34, 3, CAST(N'2020-05-11T07:15:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (9, 9, 0, 41, 3, CAST(N'2020-09-19T15:11:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (10, 10, 1, 23.4, NULL, CAST(N'2020-12-24T13:40:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (11, 11, 1, 43, NULL, CAST(N'2020-06-29T22:06:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (12, 12, 0, 44, 4, CAST(N'2020-07-06T00:01:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (13, 13, 0, 45, 5, CAST(N'2020-02-01T03:21:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (14, 14, 0, 53, 1, CAST(N'2020-10-24T04:39:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (15, 15, 0, 52, 2, CAST(N'2020-02-25T00:43:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (16, 16, 1, 51, NULL, CAST(N'2020-12-21T15:33:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (17, 17, 1, 36.5, NULL, CAST(N'2020-12-30T11:55:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (18, 18, 1, 50, NULL, CAST(N'2020-02-15T07:24:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (19, 19, 1, 28, NULL, CAST(N'2020-09-24T14:39:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (20, 20, 1, 23.45, NULL, CAST(N'2020-07-10T15:09:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (21, 21, 0, 37.6, 2, CAST(N'2020-08-07T05:07:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (22, 22, 0, 35, 3, CAST(N'2020-04-22T08:03:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (23, 23, 1, 43, NULL, CAST(N'2020-09-18T12:55:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (24, 24, 1, 42, NULL, CAST(N'2020-06-06T18:15:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (25, 25, 1, 36.5, NULL, CAST(N'2020-02-01T12:57:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (26, 26, 1, 34, NULL, CAST(N'2020-04-16T21:10:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (27, 27, 0, 32, 3, CAST(N'2020-10-03T09:10:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (28, 28, 0, 31, 2, CAST(N'2020-01-20T21:25:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (29, 29, 1, 29.6, NULL, CAST(N'2020-11-23T18:17:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (30, 30, 0, 14.6, 1, CAST(N'2020-07-10T06:03:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (31, 31, 1, 36.5, NULL, CAST(N'2020-08-08T14:29:30.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (32, 33, 1, 36.5, NULL, CAST(N'2020-11-26T01:39:00.000' AS DateTime))
INSERT [dbo].[DeviceInfo] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (33, 34, 1, 43, NULL, CAST(N'2020-05-15T13:04:30.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[DeviceInfo] OFF
SET IDENTITY_INSERT [dbo].[DeviceInfoHistory] ON 

INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (1, 1, 1, 36.5, NULL, CAST(N'2020-07-13T21:02:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (2, 2, 0, 23.8, 1, CAST(N'2020-09-27T01:50:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (3, 3, 1, 43, NULL, CAST(N'2020-01-15T11:58:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (4, 4, 1, 45.3, NULL, CAST(N'2020-06-12T17:02:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (5, 5, 0, 34.34, 1, CAST(N'2020-06-04T00:44:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (6, 6, 1, 34.5, NULL, CAST(N'2020-04-05T22:08:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (7, 7, 1, 23.5, NULL, CAST(N'2020-05-11T07:15:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (8, 9, 0, 40, 3, CAST(N'2020-09-19T15:11:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (9, 10, 1, 42, NULL, CAST(N'2020-12-24T13:40:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (10, 11, 1, 43, NULL, CAST(N'2020-06-29T22:06:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (11, 12, 0, 44, 4, CAST(N'2020-07-06T00:01:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (12, 13, 0, 45, 5, CAST(N'2020-02-01T03:21:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (13, 14, 0, 53, 1, CAST(N'2020-10-24T04:39:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (14, 15, 0, 52, 2, CAST(N'2020-02-25T00:43:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (15, 16, 1, 51, NULL, CAST(N'2020-12-21T15:33:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (16, 17, 1, 36.5, NULL, CAST(N'2020-12-30T11:55:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (17, 18, 1, 50, NULL, CAST(N'2020-02-15T07:24:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (18, 19, 1, 28, NULL, CAST(N'2020-09-24T14:39:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (19, 20, 1, 23.45, NULL, CAST(N'2020-07-10T15:09:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (20, 21, 0, 37.6, 2, CAST(N'2020-08-07T05:07:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (21, 22, 0, 35, 3, CAST(N'2020-04-22T08:03:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (22, 23, 1, 43, NULL, CAST(N'2020-09-18T12:55:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (23, 24, 1, 42, NULL, CAST(N'2020-06-06T18:15:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (24, 25, 1, 36.5, NULL, CAST(N'2020-02-01T12:57:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (25, 26, 1, 34, NULL, CAST(N'2020-04-16T21:10:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (26, 27, 0, 32, 3, CAST(N'2020-10-03T09:10:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (27, 28, 0, 31, 2, CAST(N'2020-01-20T21:25:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (28, 29, 1, 29.6, NULL, CAST(N'2020-11-23T18:17:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (29, 30, 0, 14.6, 1, CAST(N'2020-07-10T06:03:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (30, 31, 1, 36.5, NULL, CAST(N'2020-08-08T14:29:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (31, 33, 1, 36.5, NULL, CAST(N'2020-11-26T01:39:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (32, 34, 1, 43, NULL, CAST(N'2020-05-15T13:04:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (33, 31, 0, 44, 1, CAST(N'2020-09-12T20:13:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (34, 33, 0, 44, 1, CAST(N'2020-06-18T19:13:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (35, 34, 1, 56, NULL, CAST(N'2020-03-14T07:43:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (36, 1, 0, 52, 4, CAST(N'2020-10-10T20:11:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (37, 3, 1, 19, NULL, CAST(N'2020-03-30T14:12:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (38, 2, 0, 39, 5, CAST(N'2020-06-21T02:35:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (39, 4, 1, 36, NULL, CAST(N'2020-11-25T23:06:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (40, 5, 0, 36.5, 3, CAST(N'2020-02-23T17:28:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (41, 16, 0, 36.5, 4, CAST(N'2020-07-22T20:15:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (42, 18, 1, 34.45, NULL, CAST(N'2020-07-20T05:19:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (43, 20, 1, 23.5, NULL, CAST(N'2020-11-08T16:28:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (44, 12, 1, 36.5, NULL, CAST(N'2020-01-22T03:39:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (45, 12, 0, 45.5, 5, CAST(N'2020-11-25T16:17:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (46, 14, 1, 34.89, NULL, CAST(N'2020-03-05T13:03:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (47, 25, 1, 34, NULL, CAST(N'2020-09-26T15:15:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (48, 33, 1, 23, NULL, CAST(N'2020-04-19T13:07:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (49, 34, 1, 45, NULL, CAST(N'2020-01-16T04:41:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (50, 2, 0, 48.5, 3, CAST(N'2020-01-16T03:39:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (51, 3, 1, 12.34, NULL, CAST(N'2020-12-18T18:13:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (52, 4, 1, 34.6, NULL, CAST(N'2020-12-24T20:58:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (53, 5, 1, 14.45, NULL, CAST(N'2020-01-02T01:34:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (54, 6, 1, 23.4, NULL, CAST(N'2020-05-10T14:41:00.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (55, 12, 1, 32, NULL, CAST(N'2020-01-02T13:50:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (56, 13, 0, 36.5, 5, CAST(N'2020-11-02T14:05:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (57, 14, 1, 45.5, NULL, CAST(N'2020-07-08T06:34:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (58, 15, 1, 23.45, NULL, CAST(N'2020-09-16T07:03:30.000' AS DateTime))
INSERT [dbo].[DeviceInfoHistory] ([id], [DeviceID], [DeviceState], [DeviceTemperature], [AlarmID], [Date]) VALUES (59, 16, 1, 40, NULL, CAST(N'2020-02-26T00:28:30.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[DeviceInfoHistory] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonID], [Name], [Surname], [Username], [Password]) VALUES (1, N'Serhan', N'Yılmaz', N'srhnylmz', N'123')
INSERT [dbo].[Person] ([PersonID], [Name], [Surname], [Username], [Password]) VALUES (2, N'Meltem', N'Coşgun', N'mcosgun', N'm123')
INSERT [dbo].[Person] ([PersonID], [Name], [Surname], [Username], [Password]) VALUES (3, N'Sıraç', N'Cevizci', N'scevizci', N'111')
INSERT [dbo].[Person] ([PersonID], [Name], [Surname], [Username], [Password]) VALUES (4, N'Fatih', N'Ersoy', N'fersoy', N'fersoy')
INSERT [dbo].[Person] ([PersonID], [Name], [Surname], [Username], [Password]) VALUES (5, N'Erkan', N'Mercan', N'emercan', N'12345')
INSERT [dbo].[Person] ([PersonID], [Name], [Surname], [Username], [Password]) VALUES (6, N'Murat', N'Yazıcı', N'myazici', N'myazici')
INSERT [dbo].[Person] ([PersonID], [Name], [Surname], [Username], [Password]) VALUES (7, N'Yunus', N'Yavuz', N'yyavuz', N'yyavuz')
SET IDENTITY_INSERT [dbo].[Person] OFF
ALTER TABLE [dbo].[AlarmDetail]  WITH CHECK ADD  CONSTRAINT [FK_AlarmDetail_Alarm] FOREIGN KEY([AlarmID])
REFERENCES [dbo].[Alarm] ([AlarmID])
GO
ALTER TABLE [dbo].[AlarmDetail] CHECK CONSTRAINT [FK_AlarmDetail_Alarm]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_Bench] FOREIGN KEY([BenchID])
REFERENCES [dbo].[Bench] ([BenchID])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_Bench]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_Person]
GO
ALTER TABLE [dbo].[DeviceInfo]  WITH CHECK ADD  CONSTRAINT [FK_DeviceInfo_Alarm] FOREIGN KEY([AlarmID])
REFERENCES [dbo].[Alarm] ([AlarmID])
GO
ALTER TABLE [dbo].[DeviceInfo] CHECK CONSTRAINT [FK_DeviceInfo_Alarm]
GO
ALTER TABLE [dbo].[DeviceInfo]  WITH CHECK ADD  CONSTRAINT [FK_DeviceInfo_Device] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Device] ([DeviceID])
GO
ALTER TABLE [dbo].[DeviceInfo] CHECK CONSTRAINT [FK_DeviceInfo_Device]
GO
ALTER TABLE [dbo].[DeviceInfoHistory]  WITH CHECK ADD  CONSTRAINT [FK_DeviceInfoHistory_Alarm] FOREIGN KEY([AlarmID])
REFERENCES [dbo].[Alarm] ([AlarmID])
GO
ALTER TABLE [dbo].[DeviceInfoHistory] CHECK CONSTRAINT [FK_DeviceInfoHistory_Alarm]
GO
ALTER TABLE [dbo].[DeviceInfoHistory]  WITH CHECK ADD  CONSTRAINT [FK_DeviceInfoHistory_Device] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Device] ([DeviceID])
GO
ALTER TABLE [dbo].[DeviceInfoHistory] CHECK CONSTRAINT [FK_DeviceInfoHistory_Device]
GO
/****** Object:  StoredProcedure [dbo].[AllPerson]    Script Date: 23.01.2020 14:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllPerson]
AS
SELECT * FROM Person
GO;
GO
/****** Object:  StoredProcedure [dbo].[DevicesAlarmDetails]    Script Date: 23.01.2020 14:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DevicesAlarmDetails]
(

@did int
)
AS

select dh.DeviceID,a.AlarmName,a.AlarmDescription,dh.Date from DeviceInfoHistory as dh 
inner join Alarm as a on dh.AlarmID=a.AlarmID
where dh.DeviceID=@did


GO
/****** Object:  StoredProcedure [dbo].[DevicesStateDetails]    Script Date: 23.01.2020 14:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DevicesStateDetails]
(

@did int
)
AS

select dh.id,dh.DeviceID,dh.DeviceState,dh.Date from DeviceInfoHistory as dh 
where dh.DeviceID=@did
GO
/****** Object:  StoredProcedure [dbo].[DevicesTemperatureDetails]    Script Date: 23.01.2020 14:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DevicesTemperatureDetails]
(

@did int
)
AS

select dh.id,dh.DeviceID,dh.DeviceTemperature,dh.Date from DeviceInfoHistory as dh 
where dh.DeviceID=@did
GO
/****** Object:  StoredProcedure [dbo].[PersonAllDevices]    Script Date: 23.01.2020 14:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PersonAllDevices]
(

@pid int
)
AS

select p.Name,d.DeviceID,p.Surname,d.DeviceName,di.DeviceState,di.DeviceTemperature,a.AlarmName,b.BenchName from DeviceInfo as di 
full outer join Alarm as a on di.AlarmID=a.AlarmID
inner join Device as d on di.DeviceID=d.DeviceID
inner join Bench as b on d.BenchID=b.BenchID
inner join Person as p on d.PersonID=p.PersonID
where p.PersonID=@pid


GO
/****** Object:  StoredProcedure [dbo].[PersonSelectedDeviceDetail]    Script Date: 23.01.2020 14:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PersonSelectedDeviceDetail]
(

@pid int,
@did int
)
AS

select p.Name,p.Surname,d.DeviceName,di.DeviceState,di.DeviceTemperature,a.AlarmName,b.BenchName from DeviceInfo as di 
full outer join Alarm as a on di.AlarmID=a.AlarmID
inner join Device as d on di.DeviceID=d.DeviceID
inner join Bench as b on d.BenchID=b.BenchID
inner join Person as p on d.PersonID=p.PersonID
where p.PersonID=@pid and di.DeviceID=@did


GO
USE [master]
GO
ALTER DATABASE [SystemControl] SET  READ_WRITE 
GO
