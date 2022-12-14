USE [master]
GO
/****** Object:  Database [EvidencijaPutnika]    Script Date: 10/20/2022 11:35:19 AM ******/
CREATE DATABASE [EvidencijaPutnika]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EvidencijaPutnika', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EvidencijaPutnika.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EvidencijaPutnika_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EvidencijaPutnika_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EvidencijaPutnika] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EvidencijaPutnika].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EvidencijaPutnika] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET ARITHABORT OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EvidencijaPutnika] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EvidencijaPutnika] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EvidencijaPutnika] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EvidencijaPutnika] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EvidencijaPutnika] SET  MULTI_USER 
GO
ALTER DATABASE [EvidencijaPutnika] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EvidencijaPutnika] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EvidencijaPutnika] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EvidencijaPutnika] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EvidencijaPutnika] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EvidencijaPutnika] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EvidencijaPutnika] SET QUERY_STORE = OFF
GO
USE [EvidencijaPutnika]
GO
/****** Object:  Table [dbo].[DOKTOR]    Script Date: 10/20/2022 11:35:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOKTOR](
	[IdDok] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](30) NOT NULL,
	[Prezime] [varchar](30) NOT NULL,
	[Struka] [varchar](30) NULL,
 CONSTRAINT [PK_DOKTOR] PRIMARY KEY CLUSTERED 
(
	[IdDok] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacijent]    Script Date: 10/20/2022 11:35:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacijent](
	[BrKnjizice] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](30) NOT NULL,
	[Prezime] [varchar](30) NOT NULL,
	[Prebivaliste] [varchar](30) NULL,
 CONSTRAINT [PK_Pacijent] PRIMARY KEY CLUSTERED 
(
	[BrKnjizice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Termin]    Script Date: 10/20/2022 11:35:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Termin](
	[IdDok] [int] NOT NULL,
	[BrKnjizice] [int] NOT NULL,
	[Datum] [date] NULL,
	[Vreme] [time](7) NULL,
 CONSTRAINT [PK_Termin] PRIMARY KEY CLUSTERED 
(
	[IdDok] ASC,
	[BrKnjizice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DOKTOR] ON 

INSERT [dbo].[DOKTOR] ([IdDok], [Ime], [Prezime], [Struka]) VALUES (1, N'Uros', N'Vitasovic', N'Kardiolog')
INSERT [dbo].[DOKTOR] ([IdDok], [Ime], [Prezime], [Struka]) VALUES (2, N'Aleksa', N'Lazarevic', N'Oftamolog')
INSERT [dbo].[DOKTOR] ([IdDok], [Ime], [Prezime], [Struka]) VALUES (3, N'Miodrag', N'Bukvic', N'ProgramerskiHirurg')
SET IDENTITY_INSERT [dbo].[DOKTOR] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacijent] ON 

INSERT [dbo].[Pacijent] ([BrKnjizice], [Ime], [Prezime], [Prebivaliste]) VALUES (1, N'Mira', N'Krstic', N'NoviSad')
INSERT [dbo].[Pacijent] ([BrKnjizice], [Ime], [Prezime], [Prebivaliste]) VALUES (2, N'Ante', N'Kostic', N'Beograd')
INSERT [dbo].[Pacijent] ([BrKnjizice], [Ime], [Prezime], [Prebivaliste]) VALUES (3, N'Milica', N'Spasic', N'Subotica')
SET IDENTITY_INSERT [dbo].[Pacijent] OFF
GO
ALTER TABLE [dbo].[Termin]  WITH CHECK ADD  CONSTRAINT [FK_Termin_DOKTOR] FOREIGN KEY([IdDok])
REFERENCES [dbo].[DOKTOR] ([IdDok])
GO
ALTER TABLE [dbo].[Termin] CHECK CONSTRAINT [FK_Termin_DOKTOR]
GO
ALTER TABLE [dbo].[Termin]  WITH CHECK ADD  CONSTRAINT [FK_Termin_Pacijent] FOREIGN KEY([BrKnjizice])
REFERENCES [dbo].[Pacijent] ([BrKnjizice])
GO
ALTER TABLE [dbo].[Termin] CHECK CONSTRAINT [FK_Termin_Pacijent]
GO
USE [master]
GO
ALTER DATABASE [EvidencijaPutnika] SET  READ_WRITE 
GO
