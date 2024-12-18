USE [master]
GO

/*Crear Base de datos*/
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'BaseAlmacen')
BEGIN
    DROP DATABASE BaseAlmacen;
END

-- Crear la nueva base de datos
CREATE DATABASE BaseAlmacen;


/*Agregar Tablas*/

use BaseAlmacen

CREATE TABLE [dbo].[Asociado] (
    [id_asoc] INT NOT NULL PRIMARY KEY,
    [tipoAsociado] NVARCHAR(50),
    [nombre] VARCHAR(255),
    [telefono] VARCHAR(50),
    CHECK ([tipoAsociado] IN ('Proveedor', 'Cliente'))
);

CREATE TABLE [dbo].[Rol] (
    [id_rol] INT NOT NULL PRIMARY KEY,
    [descripcion] VARCHAR(255)
);

CREATE TABLE [dbo].[Categoria] (
    [id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [descripcion] VARCHAR(255)
);

CREATE TABLE [dbo].[Producto] (
    [id_producto] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [nombre] VARCHAR(255),
    [descripcion] VARCHAR(255),
    [id_categoria] INT,
    [precio] INT,
    [costo_almacen] INT,
    FOREIGN KEY ([id_categoria]) REFERENCES [dbo].[Categoria] ([id])
);

CREATE TABLE [dbo].[Usuario] (
    [id_usuario] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [logUsuario] VARCHAR(255),
    [pass] VARCHAR(255),
    [nombre] VARCHAR(255),
    [id_rol] INT,
    FOREIGN KEY ([id_rol]) REFERENCES [dbo].[Rol] ([id_rol])
);

CREATE TABLE [dbo].[Auditoria_reg] (
    [id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [descripcion] VARCHAR(255),
    [id_usuario] INT,
    [fecha] DATETIME,
    FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([id_usuario])
);

CREATE TABLE [dbo].[Inventario] (
    [id_producto] INT,
    [existencias] INT,
    [max_existencias] INT,
    [min_existencias] INT,
    FOREIGN KEY ([id_producto]) REFERENCES [dbo].[Producto] ([id_producto])
);

CREATE TABLE [dbo].[Movimiento] (
    [id_mov] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [tipoMovimiento] NVARCHAR(50),
    [id_asociado] INT,
    [id_usuario] INT,
    [fecha_reg] DATETIME,
    FOREIGN KEY ([id_asociado]) REFERENCES [dbo].[Asociado] ([id_asoc]),
    FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([id_usuario]),
    CHECK ([tipoMovimiento] IN ('DevolucionProveedor', 'DevolucionCliente', 'Venta', 'Compra'))
);

CREATE TABLE [dbo].[Detalle_mov] (
    [id_detalle] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [id_mov] INT,
    [id_producto] INT,
    [cantidad] INT,
    [costo_total] INT,
    FOREIGN KEY ([id_mov]) REFERENCES [dbo].[Movimiento] ([id_mov]),
    FOREIGN KEY ([id_producto]) REFERENCES [dbo].[Producto] ([id_producto])
);



/*Agregar datos*/
-- Insertar Asociados
INSERT INTO [dbo].[Asociado] ([id_asoc], [tipoAsociado], [nombre], [telefono]) VALUES 
(1, 'Cliente', 'Juan Pérez', '555-0123'),
(2, 'Proveedor', 'Distribuciones S.A.', '555-4567'),
(3, 'Cliente', 'María López', '555-8910'),
(4, 'Proveedor', 'Comercial ABC', '555-3210'),
(5, 'Cliente', 'Carlos Ruiz', '555-6543'),
(6, 'Proveedor', 'Alimentos Frescos', '555-7890');

-- Insertar Roles
INSERT INTO [dbo].[Rol] ([id_rol], [descripcion]) VALUES 
(1, 'Administrador'),
(2, 'Jefe'),
(3, 'Supervisor'),
(4, 'Vendedor');

-- Insertar Categorías
INSERT INTO [dbo].[Categoria] ([descripcion]) VALUES 
('Electrónica'),
('Ropa'),
('Alimentos'),
('Hogar'),
('Jardinería');


-- Insertar Productos
INSERT INTO [dbo].[Producto] ([nombre], [descripcion], [id_categoria], [precio], [costo_almacen]) VALUES 
('Smartphone', 'Teléfono inteligente de última generación', 1, 699, 500),
('Laptop', 'Laptop para gamers', 1, 1299, 900),
('Camiseta', 'Camiseta de algodón', 2, 20, 10),
('Cereal', 'Cereal integral', 3, 5, 2),
('Sofá', 'Sofá de tres plazas', 4, 499, 300),
('Tijeras', 'Tijeras de acero inoxidable', 5, 10, 5),
('Balón de fútbol', 'Balón para practicar fútbol', 4, 25, 15),
('Mesa de comedor', 'Mesa de madera para 6 personas', 4, 299, 200),
('Polo', 'Polo color azul', 2, 15, 8),
('Mayonesa', 'Mayonesa 250gr', 3, 30, 18);

-- Insertar Usuarios
INSERT INTO [dbo].[Usuario] ([logUsuario], [pass], [nombre], [id_rol]) VALUES 
('admin', 'admin123', 'Mario', 1),
('jefe1', 'jefe145', 'Marco', 2),
('supervisor1', 'supervisor145', 'Claudia', 3),
('vendedor1', 'vendedor145', 'Alberto', 4),
('jefe2', 'jefe146', 'Charlie', 2),
('supervisor2', 'supervisor165', 'Johana', 3);

-- Insertar Auditoría
INSERT INTO [dbo].[Auditoria_reg] ([descripcion], [id_usuario], [fecha]) VALUES 
('Se realizó una venta', 2, '2024-01-16T15:00:00'),
('Se añadió un nuevo producto', 1, '2024-01-15T09:00:00'),
('Se actualizó el inventario', 1, '2024-01-17T12:00:00'),
('Se registró una compra', 1, '2024-01-18T09:05:00'),
('Se devolvió un producto', 2, '2024-01-19T15:05:00'),
('Se realizó una auditoría', 1, '2024-01-20T12:05:00'),
('Se registró una venta', 2, '2024-01-22T14:05:00'),
('Se actualizó un producto', 1, '2024-01-23T13:05:00'),
('Se creó un nuevo asociado', 1, '2024-01-24T11:45:00'),
('Se eliminó un producto', 1, '2024-01-25T10:00:00');

-- Insertar Movimientos
INSERT INTO [dbo].[Movimiento] ([tipoMovimiento], [id_asociado], [id_usuario], [fecha_reg]) VALUES 
('Compra', 2, 1, '2024-01-15T10:00:00'),
('Venta', 1, 2, '2024-01-16T14:30:00'),
('DevolucionCliente', 1, 2, '2024-01-17T11:00:00'),
('Compra', 4, 1, '2024-01-18T09:00:00'),
('Venta', 3, 2, '2024-01-19T15:00:00'),
('DevolucionProveedor', 4, 1, '2024-01-20T12:00:00'),
('Compra', 6, 1, '2024-01-21T10:30:00'),
('Venta', 5, 2, '2024-01-22T14:00:00'),
('DevolucionCliente', 3, 2, '2024-01-23T13:00:00'),
('Compra', 1, 1, '2024-01-24T11:45:00');

-- Insertar Detalles de Movimientos
INSERT INTO [dbo].[Detalle_mov] ([id_mov], [id_producto], [cantidad], [costo_total]) VALUES 
(1, 1, 10, 6990),
(2, 3, 5, 100),
(3, 2, 1, 1299),
(4, 5, 3, 1497),
(5, 9, 2, 30),
(6, 10, 1, 30),
(7, 6, 15, 150),
(8, 7, 4, 100),
(9, 8, 1, 15),
(10, 4, 8, 40);

-- Insertar Inventarios
INSERT INTO [dbo].[Inventario] ([id_producto], [existencias], [max_existencias], [min_existencias]) VALUES 
(1, 50, 100, 20),
(2, 30, 60, 10),
(3, 100, 200, 50),
(4, 200, 300, 100),
(5, 10, 20, 5),
(6, 150, 250, 50),
(7, 75, 150, 30),
(8, 20, 40, 10),
(9, 80, 150, 20),
(10, 60, 120, 30);