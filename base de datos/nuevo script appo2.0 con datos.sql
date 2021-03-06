USE [master]
GO
/****** Object:  Database [APPO 2.0]    Script Date: 04/10/2021 11:36:23 ******/
CREATE DATABASE [APPO 2.0]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'APPO 2.0', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\APPO 2.0.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'APPO 2.0_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\APPO 2.0_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [APPO 2.0] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [APPO 2.0].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [APPO 2.0] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [APPO 2.0] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [APPO 2.0] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [APPO 2.0] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [APPO 2.0] SET ARITHABORT OFF 
GO
ALTER DATABASE [APPO 2.0] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [APPO 2.0] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [APPO 2.0] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [APPO 2.0] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [APPO 2.0] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [APPO 2.0] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [APPO 2.0] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [APPO 2.0] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [APPO 2.0] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [APPO 2.0] SET  DISABLE_BROKER 
GO
ALTER DATABASE [APPO 2.0] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [APPO 2.0] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [APPO 2.0] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [APPO 2.0] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [APPO 2.0] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [APPO 2.0] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [APPO 2.0] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [APPO 2.0] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [APPO 2.0] SET  MULTI_USER 
GO
ALTER DATABASE [APPO 2.0] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [APPO 2.0] SET DB_CHAINING OFF 
GO
ALTER DATABASE [APPO 2.0] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [APPO 2.0] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [APPO 2.0] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [APPO 2.0] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'APPO 2.0', N'ON'
GO
ALTER DATABASE [APPO 2.0] SET QUERY_STORE = OFF
GO
USE [APPO 2.0]
GO
/****** Object:  Table [dbo].[ComprasMonedas]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprasMonedas](
	[nro_comp_compra] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cripto] [varchar](50) NOT NULL,
	[monto] [decimal](18, 0) NOT NULL,
	[fecha] [date] NOT NULL,
	[CVU_compra] [bigint] NOT NULL,
 CONSTRAINT [PK_ComprasCripto] PRIMARY KEY CLUSTERED 
(
	[nro_comp_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[CVU] [bigint] IDENTITY(236598752013654875,1) NOT NULL,
	[alias] [varchar](50) NOT NULL,
	[id_tipo_cuenta] [int] NOT NULL,
	[saldo_actual] [decimal](18, 0) NOT NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED 
(
	[CVU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngresosDinero]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngresosDinero](
	[id_deposito] [int] IDENTITY(1,1) NOT NULL,
	[nombre_deposito] [varchar](50) NOT NULL,
	[CVU_deposito] [bigint] NOT NULL,
	[nro_tarjeta] [varchar](50) NOT NULL,
	[fecha_venc] [date] NOT NULL,
	[cod_seguridad] [int] NOT NULL,
	[nombre_titular] [varchar](50) NOT NULL,
	[monto] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_IngresosDinero] PRIMARY KEY CLUSTERED 
(
	[id_deposito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inversiones]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inversiones](
	[id_inversion] [int] IDENTITY(1,1) NOT NULL,
	[monto_inversion] [decimal](18, 0) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
	[CVU_inversion] [bigint] NOT NULL,
 CONSTRAINT [PK_Inversiones] PRIMARY KEY CLUSTERED 
(
	[id_inversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagosServicio]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagosServicio](
	[nro_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[id_servicio] [int] NOT NULL,
	[CVU_pago] [bigint] NOT NULL,
	[nro_factura] [int] NOT NULL,
	[nombre_factura] [varchar](50) NOT NULL,
	[monto] [decimal](18, 0) NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_PagosServicio] PRIMARY KEY CLUSTERED 
(
	[nro_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RetirosDinero]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetirosDinero](
	[id_retiro] [int] IDENTITY(1,1) NOT NULL,
	[CVU_retiro] [bigint] NOT NULL,
	[monto] [decimal](18, 0) NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_RetirosDinero] PRIMARY KEY CLUSTERED 
(
	[id_retiro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre_servicio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposCuentas]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposCuentas](
	[id_tipo_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TiposCuentas] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transferencias]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transferencias](
	[nro_transferencia] [int] IDENTITY(1,1) NOT NULL,
	[CVU_origen] [bigint] NOT NULL,
	[CVU_destino] [bigint] NOT NULL,
	[fecha] [date] NOT NULL,
	[monto] [decimal](18, 0) NOT NULL,
	[referencia] [varchar](50) NULL,
 CONSTRAINT [PK_Transferencias] PRIMARY KEY CLUSTERED 
(
	[nro_transferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[dni] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[foto_dni_frente] [varbinary](max) NULL,
	[foto_dni_dorso] [varbinary](max) NULL,
	[mail] [varchar](50) NOT NULL,
	[password] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Usuarios_1] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentasMonedas]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentasMonedas](
	[nro_comp_ventas] [int] IDENTITY(1,1) NOT NULL,
	[monto] [decimal](18, 0) NOT NULL,
	[fecha] [date] NOT NULL,
	[CVU_venta] [bigint] NOT NULL,
 CONSTRAINT [PK_VentasCripto] PRIMARY KEY CLUSTERED 
(
	[nro_comp_ventas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cuentas] ON 

INSERT [dbo].[Cuentas] ([CVU], [alias], [id_tipo_cuenta], [saldo_actual], [id_usuario]) VALUES (236598752013654875, N'hola.es.un.alias', 1, CAST(33170 AS Decimal(18, 0)), 1)
INSERT [dbo].[Cuentas] ([CVU], [alias], [id_tipo_cuenta], [saldo_actual], [id_usuario]) VALUES (236598752013654876, N'hola.segundo.alias', 1, CAST(80000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Cuentas] ([CVU], [alias], [id_tipo_cuenta], [saldo_actual], [id_usuario]) VALUES (236598752013654877, N'mi.alias', 1, CAST(51300 AS Decimal(18, 0)), 3)
SET IDENTITY_INSERT [dbo].[Cuentas] OFF
GO
SET IDENTITY_INSERT [dbo].[IngresosDinero] ON 

INSERT [dbo].[IngresosDinero] ([id_deposito], [nombre_deposito], [CVU_deposito], [nro_tarjeta], [fecha_venc], [cod_seguridad], [nombre_titular], [monto]) VALUES (1, N'Sin nombre', 236598752013654876, N'3025658702569630', CAST(N'2021-12-25' AS Date), 560, N'Lautaro Carracedo', CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[IngresosDinero] ([id_deposito], [nombre_deposito], [CVU_deposito], [nro_tarjeta], [fecha_venc], [cod_seguridad], [nombre_titular], [monto]) VALUES (2, N'Sin nombre', 236598752013654875, N'5620125698542003', CAST(N'2022-12-12' AS Date), 500, N'Lautaro Carracedo', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[IngresosDinero] ([id_deposito], [nombre_deposito], [CVU_deposito], [nro_tarjeta], [fecha_venc], [cod_seguridad], [nombre_titular], [monto]) VALUES (3, N'Sin nombre', 236598752013654875, N'5620023654802650', CAST(N'2022-12-25' AS Date), 633, N'Lautaro Carracedo', CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[IngresosDinero] ([id_deposito], [nombre_deposito], [CVU_deposito], [nro_tarjeta], [fecha_venc], [cod_seguridad], [nombre_titular], [monto]) VALUES (4, N'Sin nombre', 236598752013654875, N'0236125896532003', CAST(N'2022-12-22' AS Date), 633, N'Lautaro Carracedo', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[IngresosDinero] ([id_deposito], [nombre_deposito], [CVU_deposito], [nro_tarjeta], [fecha_venc], [cod_seguridad], [nombre_titular], [monto]) VALUES (5, N'Sin nombre', 236598752013654875, N'6520123650235621', CAST(N'2021-12-20' AS Date), 555, N'Lautaro Carracedo', CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[IngresosDinero] ([id_deposito], [nombre_deposito], [CVU_deposito], [nro_tarjeta], [fecha_venc], [cod_seguridad], [nombre_titular], [monto]) VALUES (6, N'Sin nombre', 236598752013654875, N'2030502012326542', CAST(N'2022-12-20' AS Date), 600, N'Lautaro Carracedo', CAST(2000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[IngresosDinero] OFF
GO
SET IDENTITY_INSERT [dbo].[Inversiones] ON 

INSERT [dbo].[Inversiones] ([id_inversion], [monto_inversion], [fecha_inicio], [fecha_fin], [CVU_inversion]) VALUES (1, CAST(2000 AS Decimal(18, 0)), CAST(N'2021-05-20' AS Date), CAST(N'2021-07-20' AS Date), 236598752013654875)
INSERT [dbo].[Inversiones] ([id_inversion], [monto_inversion], [fecha_inicio], [fecha_fin], [CVU_inversion]) VALUES (3, CAST(5000 AS Decimal(18, 0)), CAST(N'2021-05-06' AS Date), CAST(N'2022-05-06' AS Date), 236598752013654875)
INSERT [dbo].[Inversiones] ([id_inversion], [monto_inversion], [fecha_inicio], [fecha_fin], [CVU_inversion]) VALUES (2002, CAST(1500 AS Decimal(18, 0)), CAST(N'2021-09-23' AS Date), CAST(N'2021-12-23' AS Date), 236598752013654875)
INSERT [dbo].[Inversiones] ([id_inversion], [monto_inversion], [fecha_inicio], [fecha_fin], [CVU_inversion]) VALUES (3014, CAST(2000 AS Decimal(18, 0)), CAST(N'2021-09-23' AS Date), CAST(N'2021-12-20' AS Date), 236598752013654875)
INSERT [dbo].[Inversiones] ([id_inversion], [monto_inversion], [fecha_inicio], [fecha_fin], [CVU_inversion]) VALUES (4002, CAST(2000 AS Decimal(18, 0)), CAST(N'2021-09-23' AS Date), CAST(N'2022-02-02' AS Date), 236598752013654875)
INSERT [dbo].[Inversiones] ([id_inversion], [monto_inversion], [fecha_inicio], [fecha_fin], [CVU_inversion]) VALUES (4003, CAST(6000 AS Decimal(18, 0)), CAST(N'2021-09-24' AS Date), CAST(N'2021-12-12' AS Date), 236598752013654875)
INSERT [dbo].[Inversiones] ([id_inversion], [monto_inversion], [fecha_inicio], [fecha_fin], [CVU_inversion]) VALUES (4004, CAST(5000 AS Decimal(18, 0)), CAST(N'2021-09-24' AS Date), CAST(N'2022-12-24' AS Date), 236598752013654877)
SET IDENTITY_INSERT [dbo].[Inversiones] OFF
GO
SET IDENTITY_INSERT [dbo].[PagosServicio] ON 

INSERT [dbo].[PagosServicio] ([nro_comprobante], [id_servicio], [CVU_pago], [nro_factura], [nombre_factura], [monto], [fecha]) VALUES (1002, 1, 236598752013654875, 2530, N'CABLEVISION', CAST(5000 AS Decimal(18, 0)), CAST(N'2021-09-23' AS Date))
INSERT [dbo].[PagosServicio] ([nro_comprobante], [id_servicio], [CVU_pago], [nro_factura], [nombre_factura], [monto], [fecha]) VALUES (1003, 1, 236598752013654875, 5680, N'CABLEVISION', CAST(2800 AS Decimal(18, 0)), CAST(N'2021-09-24' AS Date))
INSERT [dbo].[PagosServicio] ([nro_comprobante], [id_servicio], [CVU_pago], [nro_factura], [nombre_factura], [monto], [fecha]) VALUES (1004, 1, 236598752013654875, 98976, N'CABLEVISION', CAST(6000 AS Decimal(18, 0)), CAST(N'2021-09-26' AS Date))
INSERT [dbo].[PagosServicio] ([nro_comprobante], [id_servicio], [CVU_pago], [nro_factura], [nombre_factura], [monto], [fecha]) VALUES (1005, 2, 236598752013654875, 98630, N'EPEC', CAST(2500 AS Decimal(18, 0)), CAST(N'2021-09-27' AS Date))
INSERT [dbo].[PagosServicio] ([nro_comprobante], [id_servicio], [CVU_pago], [nro_factura], [nombre_factura], [monto], [fecha]) VALUES (1006, 3, 236598752013654875, 8888, N'AGUAS CORDOBESAS', CAST(230 AS Decimal(18, 0)), CAST(N'2021-09-27' AS Date))
INSERT [dbo].[PagosServicio] ([nro_comprobante], [id_servicio], [CVU_pago], [nro_factura], [nombre_factura], [monto], [fecha]) VALUES (1007, 6, 236598752013654875, 33326, N'FIBERTEL', CAST(5200 AS Decimal(18, 0)), CAST(N'2021-09-28' AS Date))
INSERT [dbo].[PagosServicio] ([nro_comprobante], [id_servicio], [CVU_pago], [nro_factura], [nombre_factura], [monto], [fecha]) VALUES (1008, 4, 236598752013654875, 5620, N'ECOGAS', CAST(1200 AS Decimal(18, 0)), CAST(N'2021-09-28' AS Date))
INSERT [dbo].[PagosServicio] ([nro_comprobante], [id_servicio], [CVU_pago], [nro_factura], [nombre_factura], [monto], [fecha]) VALUES (1009, 5, 236598752013654875, 65020, N'RENTAS', CAST(3000 AS Decimal(18, 0)), CAST(N'2021-09-28' AS Date))
SET IDENTITY_INSERT [dbo].[PagosServicio] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicios] ON 

INSERT [dbo].[Servicios] ([id_servicio], [nombre_servicio]) VALUES (1, N'CableVisión')
INSERT [dbo].[Servicios] ([id_servicio], [nombre_servicio]) VALUES (2, N'EPEC')
INSERT [dbo].[Servicios] ([id_servicio], [nombre_servicio]) VALUES (3, N'Aguas Cordobesas')
INSERT [dbo].[Servicios] ([id_servicio], [nombre_servicio]) VALUES (4, N'Ecogas')
INSERT [dbo].[Servicios] ([id_servicio], [nombre_servicio]) VALUES (5, N'Rentas')
INSERT [dbo].[Servicios] ([id_servicio], [nombre_servicio]) VALUES (6, N'Fibertel')
INSERT [dbo].[Servicios] ([id_servicio], [nombre_servicio]) VALUES (7, N'Telecom')
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposCuentas] ON 

INSERT [dbo].[TiposCuentas] ([id_tipo_cuenta], [nombre]) VALUES (1, N'USD')
INSERT [dbo].[TiposCuentas] ([id_tipo_cuenta], [nombre]) VALUES (2, N'ARS')
INSERT [dbo].[TiposCuentas] ([id_tipo_cuenta], [nombre]) VALUES (3, N'BTC')
SET IDENTITY_INSERT [dbo].[TiposCuentas] OFF
GO
SET IDENTITY_INSERT [dbo].[Transferencias] ON 

INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1, 236598752013654875, 236598752013654876, CAST(N'2021-09-21' AS Date), CAST(1500 AS Decimal(18, 0)), N'de algo')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1002, 236598752013654875, 236598752013654876, CAST(N'2021-09-23' AS Date), CAST(2000 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1003, 236598752013654876, 236598752013654875, CAST(N'2021-09-23' AS Date), CAST(1200 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1004, 236598752013654876, 236598752013654876, CAST(N'2021-09-23' AS Date), CAST(250 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1005, 236598752013654876, 236598752013654875, CAST(N'2021-09-23' AS Date), CAST(250 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1006, 236598752013654876, 236598752013654875, CAST(N'2021-09-23' AS Date), CAST(125 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1007, 236598752013654875, 236598752013654877, CAST(N'2021-09-24' AS Date), CAST(1200 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1008, 236598752013654875, 236598752013654877, CAST(N'2021-09-24' AS Date), CAST(1000 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1009, 236598752013654875, 236598752013654877, CAST(N'2021-09-24' AS Date), CAST(10000 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1010, 236598752013654876, 236598752013654877, CAST(N'2021-09-24' AS Date), CAST(500 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1011, 236598752013654875, 236598752013654877, CAST(N'2021-09-28' AS Date), CAST(4000 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1012, 236598752013654875, 236598752013654877, CAST(N'2021-09-28' AS Date), CAST(1200 AS Decimal(18, 0)), N'sin referencia')
INSERT [dbo].[Transferencias] ([nro_transferencia], [CVU_origen], [CVU_destino], [fecha], [monto], [referencia]) VALUES (1013, 236598752013654875, 236598752013654877, CAST(N'2021-09-28' AS Date), CAST(600 AS Decimal(18, 0)), N'sin referencia')
SET IDENTITY_INSERT [dbo].[Transferencias] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id_usuario], [dni], [nombre], [apellido], [foto_dni_frente], [foto_dni_dorso], [mail], [password]) VALUES (1, 41279708, N'Lautaro', N'Carracedo', NULL, NULL, N'lauti.carracedo@hotmail.com', N'03d2c15f4033618ee81226631c788b4285e99ffe1e4d9d2ff26b3ea5fb584aef')
INSERT [dbo].[Usuarios] ([id_usuario], [dni], [nombre], [apellido], [foto_dni_frente], [foto_dni_dorso], [mail], [password]) VALUES (2, 17078907, N'Adrian', N'Carracedo', NULL, NULL, N'adriancarracedo@hotmail.com', N'95ee90d3804c51e1339f623339154fa4dd849ac8a4dae62af8dfb9cecd7b01b2')
INSERT [dbo].[Usuarios] ([id_usuario], [dni], [nombre], [apellido], [foto_dni_frente], [foto_dni_dorso], [mail], [password]) VALUES (3, 55206320, N'Pedro', N'Sin Apellido', 0x, 0x, N'pedrito@hotmail.com', N'pedro123')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[ComprasMonedas]  WITH CHECK ADD  CONSTRAINT [FK_ComprasMonedas_Cuentas] FOREIGN KEY([CVU_compra])
REFERENCES [dbo].[Cuentas] ([CVU])
GO
ALTER TABLE [dbo].[ComprasMonedas] CHECK CONSTRAINT [FK_ComprasMonedas_Cuentas]
GO
ALTER TABLE [dbo].[Cuentas]  WITH CHECK ADD  CONSTRAINT [FK_Cuentas_TipoCuentas] FOREIGN KEY([id_tipo_cuenta])
REFERENCES [dbo].[TiposCuentas] ([id_tipo_cuenta])
GO
ALTER TABLE [dbo].[Cuentas] CHECK CONSTRAINT [FK_Cuentas_TipoCuentas]
GO
ALTER TABLE [dbo].[Cuentas]  WITH CHECK ADD  CONSTRAINT [FK_Cuentas_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Cuentas] CHECK CONSTRAINT [FK_Cuentas_Usuario]
GO
ALTER TABLE [dbo].[IngresosDinero]  WITH CHECK ADD  CONSTRAINT [FK_IngresosDinero_Cuentas] FOREIGN KEY([CVU_deposito])
REFERENCES [dbo].[Cuentas] ([CVU])
GO
ALTER TABLE [dbo].[IngresosDinero] CHECK CONSTRAINT [FK_IngresosDinero_Cuentas]
GO
ALTER TABLE [dbo].[Inversiones]  WITH CHECK ADD  CONSTRAINT [FK_Inversiones_Cuentas] FOREIGN KEY([CVU_inversion])
REFERENCES [dbo].[Cuentas] ([CVU])
GO
ALTER TABLE [dbo].[Inversiones] CHECK CONSTRAINT [FK_Inversiones_Cuentas]
GO
ALTER TABLE [dbo].[PagosServicio]  WITH CHECK ADD  CONSTRAINT [FK_PagosServicio_Cuentas] FOREIGN KEY([CVU_pago])
REFERENCES [dbo].[Cuentas] ([CVU])
GO
ALTER TABLE [dbo].[PagosServicio] CHECK CONSTRAINT [FK_PagosServicio_Cuentas]
GO
ALTER TABLE [dbo].[PagosServicio]  WITH CHECK ADD  CONSTRAINT [FK_PagosServicio_Servicios] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[Servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[PagosServicio] CHECK CONSTRAINT [FK_PagosServicio_Servicios]
GO
ALTER TABLE [dbo].[RetirosDinero]  WITH CHECK ADD  CONSTRAINT [FK_RetirosDinero_Cuentas] FOREIGN KEY([CVU_retiro])
REFERENCES [dbo].[Cuentas] ([CVU])
GO
ALTER TABLE [dbo].[RetirosDinero] CHECK CONSTRAINT [FK_RetirosDinero_Cuentas]
GO
ALTER TABLE [dbo].[Transferencias]  WITH CHECK ADD  CONSTRAINT [FK_Transferencias_Cuentas_Destino] FOREIGN KEY([CVU_destino])
REFERENCES [dbo].[Cuentas] ([CVU])
GO
ALTER TABLE [dbo].[Transferencias] CHECK CONSTRAINT [FK_Transferencias_Cuentas_Destino]
GO
ALTER TABLE [dbo].[Transferencias]  WITH CHECK ADD  CONSTRAINT [FK_Transferencias_Cuentas_Origen] FOREIGN KEY([CVU_origen])
REFERENCES [dbo].[Cuentas] ([CVU])
GO
ALTER TABLE [dbo].[Transferencias] CHECK CONSTRAINT [FK_Transferencias_Cuentas_Origen]
GO
ALTER TABLE [dbo].[VentasMonedas]  WITH CHECK ADD  CONSTRAINT [FK_VentasMonedas_Cuentas] FOREIGN KEY([CVU_venta])
REFERENCES [dbo].[Cuentas] ([CVU])
GO
ALTER TABLE [dbo].[VentasMonedas] CHECK CONSTRAINT [FK_VentasMonedas_Cuentas]
GO
/****** Object:  StoredProcedure [dbo].[GetTransferencias]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTransferencias] @CVU bigint
as
select * from transferencias t join cuentas c on t.CVU_origen = c.CVU where c.CVU = @CVU;
GO
/****** Object:  StoredProcedure [dbo].[insertInversion]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertInversion] @monto_inversion decimal, @fecha_inicio date, @fecha_fin date, @CVU_inversion bigint
as


insert into Inversiones(monto_inversion, fecha_inicio, fecha_fin, CVU_inversion) values (@monto_inversion,@fecha_inicio,@fecha_fin,@CVU_inversion);
GO
/****** Object:  StoredProcedure [dbo].[procedure_name]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procedure_name]
AS
select nombre_servicio from Servicios
GO;
GO
/****** Object:  StoredProcedure [dbo].[ver_servicios]    Script Date: 04/10/2021 11:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ver_servicios]
AS
select nombre_servicio from Servicios
GO;

GO
USE [master]
GO
ALTER DATABASE [APPO 2.0] SET  READ_WRITE 
GO
