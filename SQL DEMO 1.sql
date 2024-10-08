USE [master]
GO
/****** Object:  Database [INDEXING]    Script Date: 02-10-2024 18:03:41 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'INDEXING')
BEGIN
CREATE DATABASE [INDEXING]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'INDEXING', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\INDEXING.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'INDEXING_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\INDEXING_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
END
GO
ALTER DATABASE [INDEXING] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [INDEXING].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [INDEXING] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [INDEXING] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [INDEXING] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [INDEXING] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [INDEXING] SET ARITHABORT OFF 
GO
ALTER DATABASE [INDEXING] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [INDEXING] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [INDEXING] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [INDEXING] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [INDEXING] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [INDEXING] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [INDEXING] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [INDEXING] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [INDEXING] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [INDEXING] SET  ENABLE_BROKER 
GO
ALTER DATABASE [INDEXING] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [INDEXING] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [INDEXING] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [INDEXING] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [INDEXING] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [INDEXING] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [INDEXING] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [INDEXING] SET RECOVERY FULL 
GO
ALTER DATABASE [INDEXING] SET  MULTI_USER 
GO
ALTER DATABASE [INDEXING] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [INDEXING] SET DB_CHAINING OFF 
GO
ALTER DATABASE [INDEXING] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [INDEXING] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [INDEXING] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [INDEXING] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'INDEXING', N'ON'
GO
ALTER DATABASE [INDEXING] SET QUERY_STORE = ON
GO
ALTER DATABASE [INDEXING] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [INDEXING]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 02-10-2024 18:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department](
	[EmployeeID] [int] NOT NULL,
	[Department] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 02-10-2024 18:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmployeeID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 02-10-2024 18:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Workers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Workers](
	[WorkerID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Department] ([EmployeeID], [Department]) VALUES (1, N'HR')
INSERT [dbo].[Department] ([EmployeeID], [Department]) VALUES (2, N'Finance')
INSERT [dbo].[Department] ([EmployeeID], [Department]) VALUES (3, N'IT')
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName]) VALUES (1, N'John', N'Doe')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName]) VALUES (2, N'Jane', N'Smith')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName]) VALUES (3, N'Mike', N'Brown')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Workers_LastName]    Script Date: 02-10-2024 18:03:42 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Workers]') AND name = N'IX_Workers_LastName')
CREATE NONCLUSTERED INDEX [IX_Workers_LastName] ON [dbo].[Workers]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Department]'))
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Department]'))
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Employee]
GO
USE [master]
GO
ALTER DATABASE [INDEXING] SET  READ_WRITE 
GO
