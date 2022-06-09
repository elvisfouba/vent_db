USE [master]
GO
/****** Object:  Database [vente_db]    Script Date: 09/06/2022 12:59:03 PM ******/
CREATE DATABASE [vente_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vente_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS02\MSSQL\DATA\vente_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vente_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS02\MSSQL\DATA\vente_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [vente_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vente_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vente_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vente_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vente_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vente_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vente_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [vente_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [vente_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vente_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vente_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vente_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vente_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vente_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vente_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vente_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vente_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [vente_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vente_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vente_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vente_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vente_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vente_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vente_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vente_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vente_db] SET  MULTI_USER 
GO
ALTER DATABASE [vente_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vente_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vente_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vente_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vente_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vente_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [vente_db] SET QUERY_STORE = OFF
GO
USE [vente_db]
GO
/****** Object:  Table [dbo].[client]    Script Date: 09/06/2022 12:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[code_client] [int] NOT NULL,
	[nom] [varchar](100) NOT NULL,
	[prenom] [varchar](100) NOT NULL,
	[adresse] [varchar](100) NOT NULL,
	[telephone] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commande]    Script Date: 09/06/2022 12:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commande](
	[code_commande] [int] NOT NULL,
	[date_commande] [date] NULL,
	[montant] [int] NULL,
	[code_client] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[code_commande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contenir]    Script Date: 09/06/2022 12:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contenir](
	[id_contenir] [int] NOT NULL,
	[code_commande] [int] NULL,
	[id_produit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_contenir] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produit]    Script Date: 09/06/2022 12:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produit](
	[id_produit] [int] NOT NULL,
	[ref_produit] [varchar](100) NOT NULL,
	[libelle] [varchar](100) NOT NULL,
	[categorie] [varchar](100) NOT NULL,
	[prix] [int] NULL,
	[quantite] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_produit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[commande]  WITH CHECK ADD FOREIGN KEY([code_client])
REFERENCES [dbo].[client] ([code_client])
GO
ALTER TABLE [dbo].[contenir]  WITH CHECK ADD FOREIGN KEY([code_commande])
REFERENCES [dbo].[commande] ([code_commande])
GO
ALTER TABLE [dbo].[contenir]  WITH CHECK ADD FOREIGN KEY([id_produit])
REFERENCES [dbo].[produit] ([id_produit])
GO
USE [master]
GO
ALTER DATABASE [vente_db] SET  READ_WRITE 
GO
