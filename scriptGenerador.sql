USE [master]
GO
/****** Object:  Database [BaseAlmacen]    Script Date: 8/11/2024 02:35:07 ******/
CREATE DATABASE [BaseAlmacen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaseAlmacen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BaseAlmacen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BaseAlmacen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BaseAlmacen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BaseAlmacen] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaseAlmacen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaseAlmacen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaseAlmacen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaseAlmacen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaseAlmacen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaseAlmacen] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaseAlmacen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BaseAlmacen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaseAlmacen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaseAlmacen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaseAlmacen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaseAlmacen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaseAlmacen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaseAlmacen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaseAlmacen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaseAlmacen] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BaseAlmacen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaseAlmacen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaseAlmacen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaseAlmacen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaseAlmacen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaseAlmacen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaseAlmacen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaseAlmacen] SET RECOVERY FULL 
GO
ALTER DATABASE [BaseAlmacen] SET  MULTI_USER 
GO
ALTER DATABASE [BaseAlmacen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaseAlmacen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaseAlmacen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaseAlmacen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BaseAlmacen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BaseAlmacen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BaseAlmacen', N'ON'
GO
ALTER DATABASE [BaseAlmacen] SET QUERY_STORE = ON
GO
ALTER DATABASE [BaseAlmacen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BaseAlmacen]
GO
/****** Object:  Table [dbo].[Asociado]    Script Date: 8/11/2024 02:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asociado](
	[id_asoc] [int] NOT NULL,
	[tipoAsociado] [nvarchar](50) NULL,
	[nombre] [varchar](255) NULL,
	[telefono] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_asoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditoria_reg]    Script Date: 8/11/2024 02:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoria_reg](
	[id] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[id_usuario] [int] NULL,
	[fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 8/11/2024 02:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_mov]    Script Date: 8/11/2024 02:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_mov](
	[id_detalle] [int] NOT NULL,
	[id_mov] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
	[costo_total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 8/11/2024 02:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[id_producto] [int] NULL,
	[existencias] [int] NULL,
	[max_existencias] [int] NULL,
	[min_existencias] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 8/11/2024 02:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[id_mov] [int] NOT NULL,
	[tipoMovimiento] [nvarchar](50) NULL,
	[id_asociado] [int] NULL,
	[id_usuario] [int] NULL,
	[fecha_reg] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_mov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 8/11/2024 02:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [int] NOT NULL,
	[nombre] [varchar](255) NULL,
	[descripcion] [varchar](255) NULL,
	[id_categoria] [int] NULL,
	[precio] [int] NULL,
	[costo_almacen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 8/11/2024 02:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[id_rol] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/11/2024 02:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id_usuario] [int] NOT NULL,
	[logUsuario] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[nombre] [varchar](255) NULL,
	[id_rol] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Asociado] ([id_asoc], [tipoAsociado], [nombre], [telefono]) VALUES (1, N'Cliente', N'Juan Pérez', N'555-0123')
INSERT [dbo].[Asociado] ([id_asoc], [tipoAsociado], [nombre], [telefono]) VALUES (2, N'Proveedor', N'Distribuciones S.A.', N'555-4567')
INSERT [dbo].[Asociado] ([id_asoc], [tipoAsociado], [nombre], [telefono]) VALUES (3, N'Cliente', N'María López', N'555-8910')
INSERT [dbo].[Asociado] ([id_asoc], [tipoAsociado], [nombre], [telefono]) VALUES (4, N'Proveedor', N'Comercial ABC', N'555-3210')
INSERT [dbo].[Asociado] ([id_asoc], [tipoAsociado], [nombre], [telefono]) VALUES (5, N'Cliente', N'Carlos Ruiz', N'555-6543')
INSERT [dbo].[Asociado] ([id_asoc], [tipoAsociado], [nombre], [telefono]) VALUES (6, N'Proveedor', N'Alimentos Frescos', N'555-7890')
GO
INSERT [dbo].[Auditoria_reg] ([id], [descripcion], [id_usuario], [fecha]) VALUES (1, N'Se realizó una venta', 2, CAST(N'2024-01-16T15:00:00.000' AS DateTime))
INSERT [dbo].[Auditoria_reg] ([id], [descripcion], [id_usuario], [fecha]) VALUES (2, N'Se añadió un nuevo producto', 1, CAST(N'2024-01-15T09:00:00.000' AS DateTime))
INSERT [dbo].[Auditoria_reg] ([id], [descripcion], [id_usuario], [fecha]) VALUES (3, N'Se actualizó el inventario', 1, CAST(N'2024-01-17T12:00:00.000' AS DateTime))
INSERT [dbo].[Auditoria_reg] ([id], [descripcion], [id_usuario], [fecha]) VALUES (4, N'Se registró una compra', 1, CAST(N'2024-01-18T09:05:00.000' AS DateTime))
INSERT [dbo].[Auditoria_reg] ([id], [descripcion], [id_usuario], [fecha]) VALUES (5, N'Se devolvió un producto', 2, CAST(N'2024-01-19T15:05:00.000' AS DateTime))
INSERT [dbo].[Auditoria_reg] ([id], [descripcion], [id_usuario], [fecha]) VALUES (6, N'Se realizó una auditoría', 1, CAST(N'2024-01-20T12:05:00.000' AS DateTime))
INSERT [dbo].[Auditoria_reg] ([id], [descripcion], [id_usuario], [fecha]) VALUES (7, N'Se registró una venta', 2, CAST(N'2024-01-22T14:05:00.000' AS DateTime))
INSERT [dbo].[Auditoria_reg] ([id], [descripcion], [id_usuario], [fecha]) VALUES (8, N'Se actualizó un producto', 1, CAST(N'2024-01-23T13:05:00.000' AS DateTime))
INSERT [dbo].[Auditoria_reg] ([id], [descripcion], [id_usuario], [fecha]) VALUES (9, N'Se creó un nuevo asociado', 1, CAST(N'2024-01-24T11:45:00.000' AS DateTime))
INSERT [dbo].[Auditoria_reg] ([id], [descripcion], [id_usuario], [fecha]) VALUES (10, N'Se eliminó un producto', 1, CAST(N'2024-01-25T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Categoria] ([id], [descripcion]) VALUES (1, N'Electrónica')
INSERT [dbo].[Categoria] ([id], [descripcion]) VALUES (2, N'Ropa')
INSERT [dbo].[Categoria] ([id], [descripcion]) VALUES (3, N'Alimentos')
INSERT [dbo].[Categoria] ([id], [descripcion]) VALUES (4, N'Hogar')
INSERT [dbo].[Categoria] ([id], [descripcion]) VALUES (5, N'Jardinería')
GO
INSERT [dbo].[Detalle_mov] ([id_detalle], [id_mov], [id_producto], [cantidad], [costo_total]) VALUES (1, 1, 1, 10, 6990)
INSERT [dbo].[Detalle_mov] ([id_detalle], [id_mov], [id_producto], [cantidad], [costo_total]) VALUES (2, 2, 3, 5, 100)
INSERT [dbo].[Detalle_mov] ([id_detalle], [id_mov], [id_producto], [cantidad], [costo_total]) VALUES (3, 3, 2, 1, 1299)
INSERT [dbo].[Detalle_mov] ([id_detalle], [id_mov], [id_producto], [cantidad], [costo_total]) VALUES (4, 4, 5, 3, 1497)
INSERT [dbo].[Detalle_mov] ([id_detalle], [id_mov], [id_producto], [cantidad], [costo_total]) VALUES (5, 5, 9, 2, 30)
INSERT [dbo].[Detalle_mov] ([id_detalle], [id_mov], [id_producto], [cantidad], [costo_total]) VALUES (6, 6, 10, 1, 30)
INSERT [dbo].[Detalle_mov] ([id_detalle], [id_mov], [id_producto], [cantidad], [costo_total]) VALUES (7, 7, 6, 15, 150)
INSERT [dbo].[Detalle_mov] ([id_detalle], [id_mov], [id_producto], [cantidad], [costo_total]) VALUES (8, 8, 7, 4, 100)
INSERT [dbo].[Detalle_mov] ([id_detalle], [id_mov], [id_producto], [cantidad], [costo_total]) VALUES (9, 9, 8, 1, 15)
INSERT [dbo].[Detalle_mov] ([id_detalle], [id_mov], [id_producto], [cantidad], [costo_total]) VALUES (10, 10, 4, 8, 40)
GO
INSERT [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES (1, 50, 100, 20)
INSERT [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES (2, 30, 60, 10)
INSERT [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES (3, 100, 200, 50)
INSERT [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES (4, 200, 300, 100)
INSERT [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES (5, 10, 20, 5)
INSERT [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES (6, 150, 250, 50)
INSERT [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES (7, 75, 150, 30)
INSERT [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES (8, 20, 40, 10)
INSERT [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES (9, 80, 150, 20)
INSERT [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES (10, 60, 120, 30)
GO
INSERT [dbo].[Movimiento] ([id_mov], [tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES (1, N'Compra', 2, 1, CAST(N'2024-01-15T10:00:00.000' AS DateTime))
INSERT [dbo].[Movimiento] ([id_mov], [tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES (2, N'Venta', 1, 2, CAST(N'2024-01-16T14:30:00.000' AS DateTime))
INSERT [dbo].[Movimiento] ([id_mov], [tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES (3, N'DevolucionCliente', 1, 2, CAST(N'2024-01-17T11:00:00.000' AS DateTime))
INSERT [dbo].[Movimiento] ([id_mov], [tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES (4, N'Compra', 4, 1, CAST(N'2024-01-18T09:00:00.000' AS DateTime))
INSERT [dbo].[Movimiento] ([id_mov], [tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES (5, N'Venta', 3, 2, CAST(N'2024-01-19T15:00:00.000' AS DateTime))
INSERT [dbo].[Movimiento] ([id_mov], [tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES (6, N'DevolucionProveedor', 4, 1, CAST(N'2024-01-20T12:00:00.000' AS DateTime))
INSERT [dbo].[Movimiento] ([id_mov], [tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES (7, N'Compra', 6, 1, CAST(N'2024-01-21T10:30:00.000' AS DateTime))
INSERT [dbo].[Movimiento] ([id_mov], [tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES (8, N'Venta', 5, 2, CAST(N'2024-01-22T14:00:00.000' AS DateTime))
INSERT [dbo].[Movimiento] ([id_mov], [tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES (9, N'DevolucionCliente', 3, 2, CAST(N'2024-01-23T13:00:00.000' AS DateTime))
INSERT [dbo].[Movimiento] ([id_mov], [tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES (10, N'Compra', 1, 1, CAST(N'2024-01-24T11:45:00.000' AS DateTime))
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES (1, N'Smartphone', N'Teléfono inteligente de última generación', 1, 699, 500)
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES (2, N'Laptop', N'Laptop para gamers', 1, 1299, 900)
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES (3, N'Camiseta', N'Camiseta de algodón', 2, 20, 10)
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES (4, N'Cereal', N'Cereal integral', 3, 5, 2)
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES (5, N'Sofá', N'Sofá de tres plazas', 4, 499, 300)
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES (6, N'Tijeras', N'Tijeras de acero inoxidable', 5, 10, 5)
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES (7, N'Balón de fútbol', N'Balón para practicar fútbol', 4, 25, 15)
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES (8, N'Mesa de comedor', N'Mesa de madera para 6 personas', 4, 299, 200)
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES (9, N'Polo', N'Polo color azul', 2, 15, 8)
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES (10, N'Mayonesa', N'Mayonesa 250gr', 3, 30, 18)
GO
INSERT [dbo].[Rol] ([id_rol], [descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[Rol] ([id_rol], [descripcion]) VALUES (2, N'Jefe')
INSERT [dbo].[Rol] ([id_rol], [descripcion]) VALUES (3, N'Supervisor')
INSERT [dbo].[Rol] ([id_rol], [descripcion]) VALUES (4, N'Vendedor')
GO
INSERT [dbo].[Usuario] ([id_usuario], [logUsuario], [pass], [nombre], [id_rol]) VALUES (1, N'admin', N'admin123', N'Mario', 1)
INSERT [dbo].[Usuario] ([id_usuario], [logUsuario], [pass], [nombre], [id_rol]) VALUES (2, N'jefe1', N'jefe145', N'Marco', 2)
INSERT [dbo].[Usuario] ([id_usuario], [logUsuario], [pass], [nombre], [id_rol]) VALUES (3, N'supervisor1', N'supervisor145', N'Claudia', 3)
INSERT [dbo].[Usuario] ([id_usuario], [logUsuario], [pass], [nombre], [id_rol]) VALUES (4, N'vendedor1', N'vendedor145', N'Alberto', 4)
INSERT [dbo].[Usuario] ([id_usuario], [logUsuario], [pass], [nombre], [id_rol]) VALUES (5, N'jefe2', N'jefe146', N'Charlie', 2)
INSERT [dbo].[Usuario] ([id_usuario], [logUsuario], [pass], [nombre], [id_rol]) VALUES (6, N'supervisor2', N'supervisor165', N'Johana', 3)
GO
ALTER TABLE [dbo].[Auditoria_reg]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Detalle_mov]  WITH CHECK ADD FOREIGN KEY([id_mov])
REFERENCES [dbo].[Movimiento] ([id_mov])
GO
ALTER TABLE [dbo].[Detalle_mov]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD FOREIGN KEY([id_asociado])
REFERENCES [dbo].[Asociado] ([id_asoc])
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([id_categoria])
REFERENCES [dbo].[Categoria] ([id])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([id_rol])
REFERENCES [dbo].[Rol] ([id_rol])
GO
ALTER TABLE [dbo].[Asociado]  WITH CHECK ADD CHECK  (([tipoAsociado]='Proveedor' OR [tipoAsociado]='Cliente'))
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD CHECK  (([tipoMovimiento]='DevolucionProveedor' OR [tipoMovimiento]='DevolucionCliente' OR [tipoMovimiento]='Venta' OR [tipoMovimiento]='Compra'))
GO
USE [master]
GO
ALTER DATABASE [BaseAlmacen] SET  READ_WRITE 
GO
