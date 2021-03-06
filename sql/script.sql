/****** Object:  Database [db_6thstore_dweb]    Script Date: 5/05/2021 20:45:59 ******/
CREATE DATABASE [db_6thstore_dweb]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [db_6thstore_dweb] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [db_6thstore_dweb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_6thstore_dweb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_6thstore_dweb] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [db_6thstore_dweb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_6thstore_dweb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [db_6thstore_dweb] SET  MULTI_USER 
GO
ALTER DATABASE [db_6thstore_dweb] SET ENCRYPTION ON
GO
ALTER DATABASE [db_6thstore_dweb] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_6thstore_dweb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPath] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[image] [nvarchar](max) NOT NULL,
	[detalle] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[idContacto] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[asunto] [varchar](50) NOT NULL,
	[mensaje] [varchar](4000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idContacto] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Despacho]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Despacho](
	[idDespacho] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDespacho] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[idDistrito] [nvarchar](6) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDistrito] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[idInventario] [bigint] IDENTITY(1,1) NOT NULL,
	[fechaMov] [date] NOT NULL,
	[idTipoMov] [int] NOT NULL,
	[flagMov] [char](1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [decimal](10, 3) NOT NULL,
	[condicion] [char](1) NOT NULL,
	[comprobante] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idInventario] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oferta]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oferta](
	[idOferta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[costoOferta] [decimal](10, 2) NOT NULL,
	[vigencia] [bit] NOT NULL,
	[idUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idOferta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertaDetalle]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertaDetalle](
	[idOfertaDeta] [bigint] IDENTITY(1,1) NOT NULL,
	[idOferta] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[cantidad] [decimal](10, 3) NOT NULL,
	[costoUnitario] [decimal](10, 2) NOT NULL,
	[costoTotal] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idOfertaDeta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PathFile]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PathFile](
	[idPath] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](100) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[ruta] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPath] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[dni] [nvarchar](12) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](80) NULL,
	[sexo] [char](1) NULL,
	[nacimiento] [date] NULL,
	[email] [varchar](100) NOT NULL,
	[celular] [nvarchar](9) NULL,
	[idDistrito] [nvarchar](6) NULL,
	[direccion] [varchar](250) NULL,
	[referencia] [varchar](250) NULL,
	[contraseña] [nvarchar](4000) NOT NULL,
	[role] [varchar](900) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[codigoProducto] [nvarchar](50) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[nombreProducto] [varchar](50) NOT NULL,
	[precioBase] [decimal](10, 2) NOT NULL,
	[stockMinimo] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[imageFile] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoComprobante](
	[idTipoComp] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[nomenclatura] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoComp] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[idTipoMov] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoMov] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpStock]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpStock](
	[idProducto] [int] NOT NULL,
	[codigoProducto] [nvarchar](50) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[nombreCategoria] [varchar](50) NULL,
	[nombreProducto] [varchar](50) NOT NULL,
	[imageFile] [nvarchar](max) NULL,
	[precioBase] [decimal](10, 2) NOT NULL,
	[stockMinimo] [int] NOT NULL,
	[stock] [decimal](38, 3) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [bigint] IDENTITY(1,1) NOT NULL,
	[fechaVenta] [date] NOT NULL,
	[idTipoComp] [int] NOT NULL,
	[comprobante] [nvarchar](13) NULL,
	[idCliente] [int] NOT NULL,
	[importeTotal] [decimal](10, 2) NOT NULL,
	[idVendedor] [int] NOT NULL,
	[idDespacho] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[estado] [char](1) NOT NULL,
	[compAnterior] [nvarchar](13) NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 5/05/2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaDetalle](
	[idVentaDeta] [bigint] IDENTITY(1,1) NOT NULL,
	[idVenta] [bigint] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [decimal](10, 3) NOT NULL,
	[costoUnitario] [decimal](10, 2) NOT NULL,
	[costoTotal] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idVentaDeta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([id], [idPath], [nombre], [image]) VALUES (1, 1, N'Abarrotes', N'abarrote.jpg')
INSERT [dbo].[Banner] ([id], [idPath], [nombre], [image]) VALUES (2, 1, N'Bebidas', N'bebida.jpg')
INSERT [dbo].[Banner] ([id], [idPath], [nombre], [image]) VALUES (3, 1, N'Frutas y Verduras', N'fruta-verdura.jpg')
INSERT [dbo].[Banner] ([id], [idPath], [nombre], [image]) VALUES (4, 1, N'Harinas', N'harina.jpg')
INSERT [dbo].[Banner] ([id], [idPath], [nombre], [image]) VALUES (5, 1, N'Lácteos', N'lacteo.jpg')
INSERT [dbo].[Banner] ([id], [idPath], [nombre], [image]) VALUES (6, 1, N'Menestras', N'menestra.jpg')
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [image], [detalle]) VALUES (1, N'Lácteos', N'lacteo.png', N'Productos frescos, de buena calidad, derivados...')
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [image], [detalle]) VALUES (2, N'Harinas', N'harina.png', N'Fideos, Harina de toda clase, pastas e infinidad de productos a base de harína')
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [image], [detalle]) VALUES (3, N'Menestras', N'menestra.png', N'Variedad de menestras como frijoles, arvejas, lentejas, garbanzo, etc.')
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [image], [detalle]) VALUES (4, N'Limpieza', N'limpieza.png', N'Productos de limpieza y aseo personal, calidad certificada.')
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [image], [detalle]) VALUES (5, N'Bebidas', N'bebida.png', N'Bebidas gaseosas, agua de mesa, tonicos y hielo.')
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [image], [detalle]) VALUES (6, N'Licores', N'licor.png', N'Bebidas alcohólicas, reguladas seg;un norma.')
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [image], [detalle]) VALUES (7, N'Abarrote varios', N'abarrote.png', N'Variedad de abarrotes, arroz, azucar, aceite, condimentos, etc.')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Despacho] ON 

INSERT [dbo].[Despacho] ([idDespacho], [descripcion]) VALUES (1, N'Recojo en tienda')
INSERT [dbo].[Despacho] ([idDespacho], [descripcion]) VALUES (2, N'Envio motorizado')
SET IDENTITY_INSERT [dbo].[Despacho] OFF
GO
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150101', N'Lima')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150102', N'Ancon')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150103', N'Ate')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150104', N'Barranco')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150105', N'Breña')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150106', N'Carabayllo')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150107', N'Chaclacayo')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150108', N'Chorrillos')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150109', N'Cieneguilla')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150110', N'Comas')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150111', N'El Agustino')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150112', N'Independencia')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150113', N'Jesus Maria')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150114', N'La Molina')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150115', N'La Victoria')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150116', N'Lince')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150117', N'Los Olivos')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150118', N'Lurigancho')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150119', N'Lurin')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150120', N'Magdalena Del Mar')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150121', N'Pueblo Libre')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150122', N'Miraflores')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150123', N'Pachacamac')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150124', N'Pucusana')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150125', N'Puente Piedra')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150126', N'Punta Hermosa')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150127', N'Punta Negra')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150128', N'Rimac')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150129', N'San Bartolo')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150130', N'San Borja')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150131', N'San Isidro')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150132', N'San Juan De Lurigancho')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150133', N'San Juan De Miraflores')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150134', N'San Luis')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150135', N'San Martin De Porres')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150136', N'San Miguel')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150137', N'Santa Anita')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150138', N'Santa Maria Del Mar')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150139', N'Santa Rosa')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150140', N'Santiago De Surco')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150141', N'Surquillo')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150142', N'Villa El Salvador')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150143', N'Villa Maria Del Triunfo')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150201', N'Barranca')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150202', N'Paramonga')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150203', N'Pativilca')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150204', N'Supe')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150205', N'Supe Puerto')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150301', N'Cajatambo')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150302', N'Copa')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150303', N'Gorgor')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150304', N'Huancapon')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150305', N'Manas')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150401', N'Canta')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150402', N'Arahuay')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150403', N'Huamantanga')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150404', N'Huaros')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150405', N'Lachaqui')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150406', N'San Buenaventura')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150407', N'Santa Rosa De Quives')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150501', N'San Vicente De Cañete')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150502', N'Asia')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150503', N'Calango')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150504', N'Cerro Azul')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150505', N'Chilca')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150506', N'Coayllo')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150507', N'Imperial')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150508', N'Lunahuana')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150509', N'Mala')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150510', N'Nuevo Imperial')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150511', N'Pacaran')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150512', N'Quilmana')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150513', N'San Antonio')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150514', N'San Luis')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150515', N'Santa Cruz De Flores')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150516', N'Zuñiga')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150601', N'Huaral')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150602', N'Atavillos Alto')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150603', N'Atavillos Bajo')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150604', N'Aucallama')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150605', N'Chancay')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150606', N'Ihuari')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150607', N'Lampian')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150608', N'Pacaraos')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150609', N'San Miguel De Acos')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150610', N'Santa Cruz De Andamarca')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150611', N'Sumbilca')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150612', N'Veintisiete De Noviembre')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150701', N'Matucana')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150702', N'Antioquia')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150703', N'Callahuanca')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150704', N'Carampoma')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150705', N'Chicla')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150706', N'Cuenca')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150707', N'Huachupampa')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150708', N'Huanza')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150709', N'Huarochiri')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150710', N'Lahuaytambo')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150711', N'Langa')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150712', N'Laraos')
GO
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150713', N'Mariatana')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150714', N'Ricardo Palma')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150715', N'San Andres De Tupicocha')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150716', N'San Antonio')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150717', N'San Bartolome')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150718', N'San Damian')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150719', N'San Juan De Iris')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150720', N'San Juan De Tantaranche')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150721', N'San Lorenzo De Quinti')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150722', N'San Mateo')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150723', N'San Mateo De Otao')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150724', N'San Pedro De Casta')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150725', N'San Pedro De Huancayre')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150726', N'Sangallaya')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150727', N'Santa Cruz De Cocachacra')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150728', N'Santa Eulalia')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150729', N'Santiago De Anchucaya')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150730', N'Santiago De Tuna')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150731', N'Santo Domingo De Los Olleros')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150732', N'Surco')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150801', N'Huacho')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150802', N'Ambar')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150803', N'Caleta De Carquin')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150804', N'Checras')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150805', N'Hualmay')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150806', N'Huaura')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150807', N'Leoncio Prado')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150808', N'Paccho')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150809', N'Santa Leonor')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150810', N'Santa Maria')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150811', N'Sayan')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150812', N'Vegueta')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150901', N'Oyon')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150902', N'Andajes')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150903', N'Caujul')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150904', N'Cochamarca')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150905', N'Navan')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'150906', N'Pachangara')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151001', N'Yauyos')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151002', N'Alis')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151003', N'Allauca')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151004', N'Ayaviri')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151005', N'Azangaro')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151006', N'Cacra')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151007', N'Carania')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151008', N'Catahuasi')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151009', N'Chocos')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151010', N'Cochas')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151011', N'Colonia')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151012', N'Hongos')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151013', N'Huampara')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151014', N'Huancaya')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151015', N'Huangascar')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151016', N'Huantan')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151017', N'Huañec')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151018', N'Laraos')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151019', N'Lincha')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151020', N'Madean')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151021', N'Miraflores')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151022', N'Omas')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151023', N'Putinza')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151024', N'Quinches')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151025', N'Quinocay')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151026', N'San Joaquin')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151027', N'San Pedro De Pilas')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151028', N'Tanta')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151029', N'Tauripampa')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151030', N'Tomas')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151031', N'Tupe')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151032', N'Viñac')
INSERT [dbo].[Distrito] ([idDistrito], [Descripcion]) VALUES (N'151033', N'Vitis')
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 

INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (1, CAST(N'2021-02-15' AS Date), 1, N'E', 1, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100001')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (2, CAST(N'2021-02-15' AS Date), 1, N'E', 2, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100002')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (3, CAST(N'2021-02-15' AS Date), 1, N'E', 3, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100003')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (4, CAST(N'2021-02-15' AS Date), 1, N'E', 4, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100004')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (5, CAST(N'2021-02-15' AS Date), 1, N'E', 5, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100005')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (6, CAST(N'2021-02-15' AS Date), 1, N'E', 6, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100006')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (7, CAST(N'2021-02-15' AS Date), 1, N'E', 7, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100007')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (8, CAST(N'2021-02-15' AS Date), 1, N'E', 8, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100008')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (9, CAST(N'2021-02-15' AS Date), 1, N'E', 9, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100009')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (10, CAST(N'2021-02-15' AS Date), 1, N'E', 10, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100010')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (11, CAST(N'2021-02-15' AS Date), 1, N'E', 11, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100011')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (12, CAST(N'2021-02-15' AS Date), 1, N'E', 12, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100012')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (13, CAST(N'2021-02-15' AS Date), 1, N'E', 13, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100013')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (14, CAST(N'2021-02-15' AS Date), 1, N'E', 14, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100014')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (15, CAST(N'2021-02-15' AS Date), 1, N'E', 15, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100015')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (16, CAST(N'2021-02-15' AS Date), 1, N'E', 16, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100016')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (17, CAST(N'2021-02-15' AS Date), 1, N'E', 17, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100017')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (18, CAST(N'2021-02-15' AS Date), 1, N'E', 18, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100018')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (19, CAST(N'2021-02-15' AS Date), 1, N'E', 19, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100019')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (20, CAST(N'2021-02-15' AS Date), 1, N'E', 20, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100020')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (21, CAST(N'2021-02-15' AS Date), 1, N'E', 21, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100021')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (22, CAST(N'2021-02-15' AS Date), 1, N'E', 22, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100022')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (23, CAST(N'2021-02-15' AS Date), 1, N'E', 23, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100023')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (24, CAST(N'2021-02-15' AS Date), 1, N'E', 24, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100024')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (25, CAST(N'2021-02-15' AS Date), 1, N'E', 25, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100025')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (26, CAST(N'2021-02-15' AS Date), 1, N'E', 26, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100026')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (27, CAST(N'2021-02-15' AS Date), 1, N'E', 27, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100027')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (28, CAST(N'2021-02-15' AS Date), 1, N'E', 28, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100028')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (29, CAST(N'2021-02-15' AS Date), 1, N'E', 29, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100029')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (30, CAST(N'2021-02-15' AS Date), 1, N'E', 30, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100030')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (31, CAST(N'2021-02-15' AS Date), 1, N'E', 31, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100031')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (32, CAST(N'2021-02-15' AS Date), 1, N'E', 32, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100032')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (33, CAST(N'2021-02-15' AS Date), 1, N'E', 33, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100033')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (34, CAST(N'2021-02-15' AS Date), 1, N'E', 34, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100034')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (35, CAST(N'2021-02-15' AS Date), 1, N'E', 35, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100035')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (36, CAST(N'2021-02-15' AS Date), 1, N'E', 36, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100036')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (37, CAST(N'2021-02-15' AS Date), 1, N'E', 37, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100037')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (38, CAST(N'2021-02-15' AS Date), 1, N'E', 38, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100038')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (39, CAST(N'2021-02-15' AS Date), 1, N'E', 39, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100039')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (40, CAST(N'2021-02-15' AS Date), 1, N'E', 40, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100040')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (41, CAST(N'2021-02-28' AS Date), 1, N'E', 1, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100041')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (42, CAST(N'2021-02-28' AS Date), 1, N'E', 2, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100042')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (43, CAST(N'2021-02-28' AS Date), 1, N'E', 3, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100043')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (44, CAST(N'2021-02-28' AS Date), 1, N'E', 4, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100044')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (45, CAST(N'2021-02-28' AS Date), 1, N'E', 5, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100045')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (46, CAST(N'2021-02-28' AS Date), 1, N'E', 6, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100046')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (47, CAST(N'2021-02-28' AS Date), 1, N'E', 7, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100047')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (48, CAST(N'2021-02-28' AS Date), 1, N'E', 8, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100048')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (49, CAST(N'2021-02-28' AS Date), 1, N'E', 9, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100049')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (50, CAST(N'2021-02-28' AS Date), 1, N'E', 10, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100050')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (51, CAST(N'2021-02-28' AS Date), 1, N'E', 11, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100051')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (52, CAST(N'2021-02-28' AS Date), 1, N'E', 12, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100052')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (53, CAST(N'2021-02-28' AS Date), 1, N'E', 13, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100053')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (54, CAST(N'2021-02-28' AS Date), 1, N'E', 14, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100054')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (55, CAST(N'2021-02-28' AS Date), 1, N'E', 15, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100055')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (56, CAST(N'2021-02-28' AS Date), 1, N'E', 16, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100056')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (57, CAST(N'2021-02-28' AS Date), 1, N'E', 17, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100057')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (58, CAST(N'2021-02-28' AS Date), 1, N'E', 18, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100058')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (59, CAST(N'2021-02-28' AS Date), 1, N'E', 19, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100059')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (60, CAST(N'2021-02-28' AS Date), 1, N'E', 20, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100060')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (61, CAST(N'2021-02-28' AS Date), 1, N'E', 21, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100061')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (62, CAST(N'2021-02-28' AS Date), 1, N'E', 22, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100062')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (63, CAST(N'2021-02-28' AS Date), 1, N'E', 23, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100063')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (64, CAST(N'2021-02-28' AS Date), 1, N'E', 24, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100064')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (65, CAST(N'2021-02-28' AS Date), 1, N'E', 25, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100065')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (66, CAST(N'2021-02-28' AS Date), 1, N'E', 26, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100066')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (67, CAST(N'2021-02-28' AS Date), 1, N'E', 27, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100067')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (68, CAST(N'2021-02-28' AS Date), 1, N'E', 28, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100068')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (69, CAST(N'2021-02-28' AS Date), 1, N'E', 29, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100069')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (70, CAST(N'2021-02-28' AS Date), 1, N'E', 30, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100070')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (71, CAST(N'2021-02-28' AS Date), 1, N'E', 31, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100071')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (72, CAST(N'2021-02-28' AS Date), 1, N'E', 32, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100072')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (73, CAST(N'2021-02-28' AS Date), 1, N'E', 33, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100073')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (74, CAST(N'2021-02-28' AS Date), 1, N'E', 34, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100074')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (75, CAST(N'2021-02-28' AS Date), 1, N'E', 35, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100075')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (76, CAST(N'2021-02-28' AS Date), 1, N'E', 36, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100076')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (77, CAST(N'2021-02-28' AS Date), 1, N'E', 37, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100077')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (78, CAST(N'2021-02-28' AS Date), 1, N'E', 38, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100078')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (79, CAST(N'2021-02-28' AS Date), 1, N'E', 39, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100079')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (80, CAST(N'2021-02-28' AS Date), 1, N'E', 40, CAST(100.000 AS Decimal(10, 3)), N'R', N'BV-001-202100080')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (81, CAST(N'2021-04-19' AS Date), 4, N'S', 7, CAST(14.000 AS Decimal(10, 3)), N'R', N'BV-2021000001')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (88, CAST(N'2021-04-20' AS Date), 4, N'S', 9, CAST(2.000 AS Decimal(10, 3)), N'R', N'FC-2021000001')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (90, CAST(N'2021-04-20' AS Date), 4, N'S', 19, CAST(20.000 AS Decimal(10, 3)), N'R', N'FC-2021000001')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (92, CAST(N'2021-04-27' AS Date), 4, N'S', 3, CAST(20.000 AS Decimal(10, 3)), N'P', N'BV-2021000003')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (93, CAST(N'2021-04-28' AS Date), 4, N'S', 4, CAST(100.000 AS Decimal(10, 3)), N'P', N'BV-2021000004')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (94, CAST(N'2021-04-28' AS Date), 4, N'S', 2, CAST(100.000 AS Decimal(10, 3)), N'P', N'BV-2021000004')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (95, CAST(N'2021-05-05' AS Date), 4, N'S', 13, CAST(3.000 AS Decimal(10, 3)), N'P', N'RC-2021000001')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (98, CAST(N'2021-05-05' AS Date), 4, N'S', 11, CAST(3.000 AS Decimal(10, 3)), N'P', N'RC-2021000004')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (99, CAST(N'2021-05-05' AS Date), 4, N'S', 16, CAST(3.000 AS Decimal(10, 3)), N'P', N'RC-2021000004')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (100, CAST(N'2021-05-05' AS Date), 4, N'S', 23, CAST(3.000 AS Decimal(10, 3)), N'P', N'RC-2021000004')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (101, CAST(N'2021-05-05' AS Date), 4, N'S', 7, CAST(3.000 AS Decimal(10, 3)), N'P', N'RC-2021000004')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (102, CAST(N'2021-05-05' AS Date), 4, N'S', 10, CAST(6.000 AS Decimal(10, 3)), N'P', N'RC-2021000001')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (103, CAST(N'2021-05-05' AS Date), 4, N'S', 17, CAST(5.000 AS Decimal(10, 3)), N'P', N'RC-2021000001')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (104, CAST(N'2021-05-05' AS Date), 4, N'S', 14, CAST(10.000 AS Decimal(10, 3)), N'P', N'RC-2021000001')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (105, CAST(N'2021-05-05' AS Date), 4, N'S', 15, CAST(5.000 AS Decimal(10, 3)), N'P', N'RC-2021000001')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (115, CAST(N'2021-05-05' AS Date), 4, N'S', 2, CAST(11.000 AS Decimal(10, 3)), N'P', N'RC-2021000005')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (117, CAST(N'2021-05-05' AS Date), 4, N'S', 5, CAST(2.000 AS Decimal(10, 3)), N'P', N'RC-2021000003')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (118, CAST(N'2021-05-06' AS Date), 4, N'S', 32, CAST(2.000 AS Decimal(10, 3)), N'P', N'RC-2021000005')
INSERT [dbo].[Inventario] ([idInventario], [fechaMov], [idTipoMov], [flagMov], [idProducto], [cantidad], [condicion], [comprobante]) VALUES (119, CAST(N'2021-05-06' AS Date), 4, N'S', 1, CAST(6.000 AS Decimal(10, 3)), N'P', N'RC-2021000003')
GO
SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
SET IDENTITY_INSERT [dbo].[Oferta] ON 

INSERT [dbo].[Oferta] ([idOferta], [descripcion], [costoOferta], [vigencia], [idUsuario]) VALUES (1, N'Oferta COVID', CAST(250.00 AS Decimal(10, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[Oferta] OFF
GO
SET IDENTITY_INSERT [dbo].[OfertaDetalle] ON 

INSERT [dbo].[OfertaDetalle] ([idOfertaDeta], [idOferta], [IdProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (1, 1, 1, CAST(2.000 AS Decimal(10, 3)), CAST(2.15 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)))
INSERT [dbo].[OfertaDetalle] ([idOfertaDeta], [idOferta], [IdProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (2, 1, 4, CAST(2.000 AS Decimal(10, 3)), CAST(1.80 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
INSERT [dbo].[OfertaDetalle] ([idOfertaDeta], [idOferta], [IdProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (3, 1, 5, CAST(5.000 AS Decimal(10, 3)), CAST(3.80 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OfertaDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[PathFile] ON 

INSERT [dbo].[PathFile] ([idPath], [tipo], [descripcion], [ruta]) VALUES (1, N'Banner', N'Banner de productos', N'assets/img/banner/product/')
INSERT [dbo].[PathFile] ([idPath], [tipo], [descripcion], [ruta]) VALUES (2, N'Banner', N'Banner de promociones', N'assets/img/banner/promo/')
INSERT [dbo].[PathFile] ([idPath], [tipo], [descripcion], [ruta]) VALUES (3, N'Banner', N'Banner de categorías', N'assets/img/banner/category/')
INSERT [dbo].[PathFile] ([idPath], [tipo], [descripcion], [ruta]) VALUES (4, N'Individual', N'Imagen individual de productos', N'assets/img/alone/product/')
SET IDENTITY_INSERT [dbo].[PathFile] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (1, N'40101010', N'Admin', N'Devs', N'H', CAST(N'1984-10-12' AS Date), N'admin@6th-store.com', N'999000000', N'150502', N'Km 97 paramericana sur', N'Frente a Boulevard', N'Admin123', N'admin')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (2, N'40101011', N'Ricardo ', N'Muñoz Sánchez', N'H', CAST(N'1986-05-06' AS Date), N'rmunoz@6th-store.com', N'999000001', N'150502', N'Hola', N'', N'Ventas123', N'vendedor,cliente')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (3, N'40101011', N'Fabiana', N'Rivas-Plata Sarmiento', N'M', CAST(N'1996-10-23' AS Date), N'frivasps@gmail.com', N'999000002', N'150510', N'', N'', N'Cliente123', N'cliente')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (5, N'45075898', N'Peter', N'Castle', N'M', CAST(N'1959-10-12' AS Date), N'castle@gmail.com', N'947858989', NULL, NULL, NULL, N'123456', N'cliente')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (8, N'', N'Anibal', N'', N'H', CAST(N'2021-05-02' AS Date), N'anibal@mail.com', N'', N'', N'', N'', N'12345678', N'visita')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (9, N'', N'tes1222', N'', N'H', CAST(N'2021-05-03' AS Date), N'tes11@mail.com', N'', N'', N'', N'', N'test001', N'cliente')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (10, N'', N'teste-web', N'', N'H', CAST(N'2021-05-03' AS Date), N'abc@mail.com', N'', N'', N'', N'', N'abc123456', N'cliente')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (11, N'54222122', N'Alex', N'Flores', N'H', CAST(N'2021-05-05' AS Date), N'string@mail.com', N'66223', N'11212', N'sadasd asd', N'fsf', N'ss222333s', N'cliente')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (12, N'455666622', N'Priscilla', N'Velasquez', N'M', CAST(N'2021-05-05' AS Date), N'pris@mail.com', N'988665565', N'001212', N'asd adasd ', N'sadsadas ', N'pri00112223', N'cliente')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (13, N'', N'Pablo picapiedra', N'', N'H', CAST(N'2021-05-05' AS Date), N'pablito@mail.com', N'', N'', N'', N'', N'pablo123456', N'cliente')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (14, N'', N'Carlos Carbonel', N'', N'H', CAST(N'2021-05-05' AS Date), N'carlos.carbonel@gmail.com', N'', N'', N'', N'', N'carlos 1234', N'cliente')
INSERT [dbo].[Persona] ([idPersona], [dni], [nombres], [apellidos], [sexo], [nacimiento], [email], [celular], [idDistrito], [direccion], [referencia], [contraseña], [role]) VALUES (15, N'', N'Efrain', N'', N'H', CAST(N'2021-05-06' AS Date), N'ccarlosc@gmail.com', N'', N'', N'', N'', N'pruenq123', N'cliente')
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (1, N'L01-00000001', 1, N'Leche evaporada', CAST(2.50 AS Decimal(10, 2)), 5, 1, N'leche.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (2, N'L01-00000002', 1, N'Leche en polvo', CAST(1.80 AS Decimal(10, 2)), 5, 1, N'leche-polvo.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (3, N'L01-00000003', 1, N'Leche descremada', CAST(2.60 AS Decimal(10, 2)), 5, 1, N'leche-descremada.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (4, N'M01-00000004', 1, N'Mantequilla', CAST(1.80 AS Decimal(10, 2)), 5, 1, N'mantequilla.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (5, N'Y01-00000005', 1, N'Yogurt', CAST(3.80 AS Decimal(10, 2)), 5, 1, N'yogurt.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (6, N'Q01-00000006', 1, N'Queso', CAST(6.30 AS Decimal(10, 2)), 5, 1, N'queso.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (7, N'H01-00000007', 2, N'Harina de trigo', CAST(2.80 AS Decimal(10, 2)), 5, 1, N'harina-trigo.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (8, N'A01-00000008', 2, N'Avena', CAST(2.60 AS Decimal(10, 2)), 5, 1, N'avena.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (9, N'H01-00000009', 2, N'Harina de pescado', CAST(1.60 AS Decimal(10, 2)), 5, 1, N'harina-pescado.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (10, N'F01-00000010', 2, N'Fideos tallarines', CAST(3.20 AS Decimal(10, 2)), 5, 1, N'fideo-tallarin.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (11, N'F01-00000011', 2, N'Fideos cabello de ángel', CAST(3.20 AS Decimal(10, 2)), 5, 1, N'fideo-cabello-angel.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (12, N'F01-00000012', 2, N'Fideos corbata', CAST(3.20 AS Decimal(10, 2)), 5, 1, N'fideo-corbata.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (13, N'F01-00000013', 3, N'Frijol canario', CAST(5.30 AS Decimal(10, 2)), 5, 1, N'frijol.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (14, N'A01-00000014', 3, N'Arveja', CAST(5.40 AS Decimal(10, 2)), 5, 1, N'arveja.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (15, N'H01-00000015', 3, N'Haba seca', CAST(5.20 AS Decimal(10, 2)), 5, 1, N'habas.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (16, N'L01-00000016', 3, N'Lenteja', CAST(3.80 AS Decimal(10, 2)), 5, 1, N'lenteja.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (17, N'S01-00000017', 3, N'Soya', CAST(3.90 AS Decimal(10, 2)), 5, 1, N'soja.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (18, N'J01-00000018', 4, N'Jabón Camay', CAST(1.20 AS Decimal(10, 2)), 5, 1, N'jabon-camay.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (19, N'S01-00000019', 4, N'Shapoo sachet', CAST(0.60 AS Decimal(10, 2)), 5, 1, N'shampoo-sachet.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (20, N'P01-00000020', 4, N'Pasta dental Colgate', CAST(3.20 AS Decimal(10, 2)), 5, 1, N'pasta-colgate.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (21, N'P01-00000021', 4, N'Pasta dental Dento', CAST(2.80 AS Decimal(10, 2)), 5, 1, N'pasta-dento.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (22, N'J01-00000022', 4, N'Jabon Boliva', CAST(1.80 AS Decimal(10, 2)), 5, 1, N'jabon-bolivar.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (23, N'D01-00000023', 4, N'Detergente Ariel 800mg.', CAST(8.40 AS Decimal(10, 2)), 5, 1, N'detergente-ariel.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (24, N'D01-00000024', 4, N'Detergente Ace 800mg.', CAST(8.20 AS Decimal(10, 2)), 5, 1, N'detergente-ace.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (25, N'L01-00000025', 4, N'Lejía Clorox bot. 0.400ml.', CAST(3.60 AS Decimal(10, 2)), 5, 1, N'lejia-clorox.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (26, N'D01-00000026', 4, N'Desinfectante 0.600ml', CAST(2.60 AS Decimal(10, 2)), 5, 1, N'desinfectante.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (27, N'A01-00000027', 4, N'Aromatizante Poet', CAST(1.60 AS Decimal(10, 2)), 5, 1, N'aromatizante.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (28, N'A01-00000028', 5, N'Agua bot. 1/2L. San Luis', CAST(1.80 AS Decimal(10, 2)), 5, 1, N'agua-sanluis.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (29, N'A01-00000029', 5, N'Agua bot. 1/2L. Cielo', CAST(1.80 AS Decimal(10, 2)), 5, 1, N'agua-cielo.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (30, N'I01-00000030', 5, N'Incakola bot. 1/2L.', CAST(2.20 AS Decimal(10, 2)), 5, 1, N'inkacola.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (31, N'C01-00000031', 5, N'Cocacola bot. 1/2L.', CAST(2.20 AS Decimal(10, 2)), 5, 1, N'cocacola.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (32, N'V01-00000032', 6, N'Vino Borgoña', CAST(18.50 AS Decimal(10, 2)), 5, 1, N'vino-borgoña.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (33, N'P01-00000033', 6, N'Pisco Tacama', CAST(23.50 AS Decimal(10, 2)), 5, 1, N'pisco-tacama.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (34, N'V01-00000034', 6, N'Vino Viña vieja', CAST(20.80 AS Decimal(10, 2)), 5, 1, N'vino-viña.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (35, N'A01-00000035', 7, N'Arroz Costeño', CAST(3.80 AS Decimal(10, 2)), 5, 1, N'arroz-costerño.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (36, N'A01-00000036', 7, N'Arroz Faraon', CAST(3.90 AS Decimal(10, 2)), 5, 1, N'arroz-faraon.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (37, N'A01-00000037', 7, N'Azucar morena', CAST(2.60 AS Decimal(10, 2)), 5, 1, N'azucar-morena.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (38, N'A01-00000038', 7, N'Azucar blanca', CAST(2.80 AS Decimal(10, 2)), 5, 1, N'azucar-blanca.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (39, N'A01-00000039', 7, N'Atún filete Inca-mar', CAST(3.90 AS Decimal(10, 2)), 5, 1, N'atun-filete.jpg')
INSERT [dbo].[Producto] ([idProducto], [codigoProducto], [idCategoria], [nombreProducto], [precioBase], [stockMinimo], [idUsuario], [imageFile]) VALUES (40, N'A01-00000040', 7, N'Aceite Crisol', CAST(3.70 AS Decimal(10, 2)), 5, 1, N'aceite-crisol.jpg')
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoComprobante] ON 

INSERT [dbo].[TipoComprobante] ([idTipoComp], [descripcion], [nomenclatura]) VALUES (1, N'Boleta de venta', N'BV')
INSERT [dbo].[TipoComprobante] ([idTipoComp], [descripcion], [nomenclatura]) VALUES (2, N'Factura', N'FC')
INSERT [dbo].[TipoComprobante] ([idTipoComp], [descripcion], [nomenclatura]) VALUES (3, N'Recibo interno', N'RC')
SET IDENTITY_INSERT [dbo].[TipoComprobante] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMovimiento] ON 

INSERT [dbo].[TipoMovimiento] ([idTipoMov], [descripcion]) VALUES (1, N'Entrada por abastecimiento')
INSERT [dbo].[TipoMovimiento] ([idTipoMov], [descripcion]) VALUES (2, N'Entrada por resposición')
INSERT [dbo].[TipoMovimiento] ([idTipoMov], [descripcion]) VALUES (3, N'Entrada por devolución')
INSERT [dbo].[TipoMovimiento] ([idTipoMov], [descripcion]) VALUES (4, N'Salida por venta')
INSERT [dbo].[TipoMovimiento] ([idTipoMov], [descripcion]) VALUES (5, N'Salida por caducidad')
INSERT [dbo].[TipoMovimiento] ([idTipoMov], [descripcion]) VALUES (6, N'Salida por transferencia')
INSERT [dbo].[TipoMovimiento] ([idTipoMov], [descripcion]) VALUES (7, N'Salida especial')
SET IDENTITY_INSERT [dbo].[TipoMovimiento] OFF
GO
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (1, N'L01-00000001', 1, N'Lácteos', N'Leche evaporada', N'leche.jpg', CAST(2.50 AS Decimal(10, 2)), 5, CAST(194.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (2, N'L01-00000002', 1, N'Lácteos', N'Leche en polvo', N'leche-polvo.jpg', CAST(1.80 AS Decimal(10, 2)), 5, CAST(89.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (3, N'L01-00000003', 1, N'Lácteos', N'Leche descremada', N'leche-descremada.jpg', CAST(2.60 AS Decimal(10, 2)), 5, CAST(180.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (4, N'M01-00000004', 1, N'Lácteos', N'Mantequilla', N'mantequilla.jpg', CAST(1.80 AS Decimal(10, 2)), 5, CAST(100.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (5, N'Y01-00000005', 1, N'Lácteos', N'Yogurt', N'yogurt.jpg', CAST(3.80 AS Decimal(10, 2)), 5, CAST(198.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (6, N'Q01-00000006', 1, N'Lácteos', N'Queso', N'queso.jpg', CAST(6.30 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (7, N'H01-00000007', 2, N'Harinas', N'Harina de trigo', N'harina-trigo.jpg', CAST(2.80 AS Decimal(10, 2)), 5, CAST(183.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (8, N'A01-00000008', 2, N'Harinas', N'Avena', N'avena.jpg', CAST(2.60 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (9, N'H01-00000009', 2, N'Harinas', N'Harina de pescado', N'harina-pescado.jpg', CAST(1.60 AS Decimal(10, 2)), 5, CAST(198.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (10, N'F01-00000010', 2, N'Harinas', N'Fideos tallarines', N'fideo-tallarin.jpg', CAST(3.20 AS Decimal(10, 2)), 5, CAST(194.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (11, N'F01-00000011', 2, N'Harinas', N'Fideos cabello de ángel', N'fideo-cabello-angel.jpg', CAST(3.20 AS Decimal(10, 2)), 5, CAST(197.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (12, N'F01-00000012', 2, N'Harinas', N'Fideos corbata', N'fideo-corbata.jpg', CAST(3.20 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (13, N'F01-00000013', 3, N'Menestras', N'Frijol canario', N'frijol.jpg', CAST(5.30 AS Decimal(10, 2)), 5, CAST(197.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (14, N'A01-00000014', 3, N'Menestras', N'Arveja', N'arveja.jpg', CAST(5.40 AS Decimal(10, 2)), 5, CAST(190.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (15, N'H01-00000015', 3, N'Menestras', N'Haba seca', N'habas.jpg', CAST(5.20 AS Decimal(10, 2)), 5, CAST(195.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (16, N'L01-00000016', 3, N'Menestras', N'Lenteja', N'lenteja.jpg', CAST(3.80 AS Decimal(10, 2)), 5, CAST(197.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (17, N'S01-00000017', 3, N'Menestras', N'Soya', N'soja.jpg', CAST(3.90 AS Decimal(10, 2)), 5, CAST(195.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (18, N'J01-00000018', 4, N'Limpieza', N'Jabón Camay', N'jabon-camay.jpg', CAST(1.20 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (19, N'S01-00000019', 4, N'Limpieza', N'Shapoo sachet', N'shampoo-sachet.jpg', CAST(0.60 AS Decimal(10, 2)), 5, CAST(180.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (20, N'P01-00000020', 4, N'Limpieza', N'Pasta dental Colgate', N'pasta-colgate.jpg', CAST(3.20 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (21, N'P01-00000021', 4, N'Limpieza', N'Pasta dental Dento', N'pasta-dento.jpg', CAST(2.80 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (22, N'J01-00000022', 4, N'Limpieza', N'Jabon Boliva', N'jabon-bolivar.jpg', CAST(1.80 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (23, N'D01-00000023', 4, N'Limpieza', N'Detergente Ariel 800mg.', N'detergente-ariel.jpg', CAST(8.40 AS Decimal(10, 2)), 5, CAST(197.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (24, N'D01-00000024', 4, N'Limpieza', N'Detergente Ace 800mg.', N'detergente-ace.jpg', CAST(8.20 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (25, N'L01-00000025', 4, N'Limpieza', N'Lejía Clorox bot. 0.400ml.', N'lejia-clorox.jpg', CAST(3.60 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (26, N'D01-00000026', 4, N'Limpieza', N'Desinfectante 0.600ml', N'desinfectante.jpg', CAST(2.60 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (27, N'A01-00000027', 4, N'Limpieza', N'Aromatizante Poet', N'aromatizante.jpg', CAST(1.60 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (28, N'A01-00000028', 5, N'Bebidas', N'Agua bot. 1/2L. San Luis', N'agua-sanluis.jpg', CAST(1.80 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (29, N'A01-00000029', 5, N'Bebidas', N'Agua bot. 1/2L. Cielo', N'agua-cielo.jpg', CAST(1.80 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (30, N'I01-00000030', 5, N'Bebidas', N'Incakola bot. 1/2L.', N'inkacola.jpg', CAST(2.20 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (31, N'C01-00000031', 5, N'Bebidas', N'Cocacola bot. 1/2L.', N'cocacola.jpg', CAST(2.20 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (32, N'V01-00000032', 6, N'Licores', N'Vino Borgoña', N'vino-borgoña.jpg', CAST(18.50 AS Decimal(10, 2)), 5, CAST(198.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (33, N'P01-00000033', 6, N'Licores', N'Pisco Tacama', N'pisco-tacama.jpg', CAST(23.50 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (34, N'V01-00000034', 6, N'Licores', N'Vino Viña vieja', N'vino-viña.jpg', CAST(20.80 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (35, N'A01-00000035', 7, N'Abarrote varios', N'Arroz Costeño', N'arroz-costerño.jpg', CAST(3.80 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (36, N'A01-00000036', 7, N'Abarrote varios', N'Arroz Faraon', N'arroz-faraon.jpg', CAST(3.90 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (37, N'A01-00000037', 7, N'Abarrote varios', N'Azucar morena', N'azucar-morena.jpg', CAST(2.60 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (38, N'A01-00000038', 7, N'Abarrote varios', N'Azucar blanca', N'azucar-blanca.jpg', CAST(2.80 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (39, N'A01-00000039', 7, N'Abarrote varios', N'Atún filete Inca-mar', N'atun-filete.jpg', CAST(3.90 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
INSERT [dbo].[tmpStock] ([idProducto], [codigoProducto], [idCategoria], [nombreCategoria], [nombreProducto], [imageFile], [precioBase], [stockMinimo], [stock]) VALUES (40, N'A01-00000040', 7, N'Abarrote varios', N'Aceite Crisol', N'aceite-crisol.jpg', CAST(3.70 AS Decimal(10, 2)), 5, CAST(200.000 AS Decimal(38, 3)))
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([idVenta], [fechaVenta], [idTipoComp], [comprobante], [idCliente], [importeTotal], [idVendedor], [idDespacho], [idUsuario], [estado], [compAnterior]) VALUES (28, CAST(N'2021-04-19' AS Date), 1, N'BV-2021000001', 3, CAST(39.20 AS Decimal(10, 2)), 2, 1, 2, N'V', N'')
INSERT [dbo].[Venta] ([idVenta], [fechaVenta], [idTipoComp], [comprobante], [idCliente], [importeTotal], [idVendedor], [idDespacho], [idUsuario], [estado], [compAnterior]) VALUES (30, CAST(N'2021-04-20' AS Date), 2, N'FC-2021000001', 3, CAST(15.20 AS Decimal(10, 2)), 2, 1, 2, N'V', N'')
INSERT [dbo].[Venta] ([idVenta], [fechaVenta], [idTipoComp], [comprobante], [idCliente], [importeTotal], [idVendedor], [idDespacho], [idUsuario], [estado], [compAnterior]) VALUES (34, CAST(N'2021-04-27' AS Date), 1, N'BV-2021000002', 2, CAST(0.00 AS Decimal(10, 2)), 2, 1, 2, N'P', N'BV-2021000002')
INSERT [dbo].[Venta] ([idVenta], [fechaVenta], [idTipoComp], [comprobante], [idCliente], [importeTotal], [idVendedor], [idDespacho], [idUsuario], [estado], [compAnterior]) VALUES (35, CAST(N'2021-04-27' AS Date), 1, N'BV-2021000003', 1, CAST(52.00 AS Decimal(10, 2)), 2, 1, 2, N'P', N'BV-2021000003')
INSERT [dbo].[Venta] ([idVenta], [fechaVenta], [idTipoComp], [comprobante], [idCliente], [importeTotal], [idVendedor], [idDespacho], [idUsuario], [estado], [compAnterior]) VALUES (36, CAST(N'2021-04-28' AS Date), 1, N'BV-2021000004', 5, CAST(360.00 AS Decimal(10, 2)), 2, 1, 2, N'P', N'BV-2021000004')
INSERT [dbo].[Venta] ([idVenta], [fechaVenta], [idTipoComp], [comprobante], [idCliente], [importeTotal], [idVendedor], [idDespacho], [idUsuario], [estado], [compAnterior]) VALUES (37, CAST(N'2021-05-05' AS Date), 3, N'RC-2021000001', 8, CAST(134.60 AS Decimal(10, 2)), 2, 1, 2, N'P', N'RC-2021000001')
INSERT [dbo].[Venta] ([idVenta], [fechaVenta], [idTipoComp], [comprobante], [idCliente], [importeTotal], [idVendedor], [idDespacho], [idUsuario], [estado], [compAnterior]) VALUES (38, CAST(N'2021-05-05' AS Date), 3, N'RC-2021000002', 3, CAST(0.00 AS Decimal(10, 2)), 2, 1, 2, N'P', N'RC-2021000002')
INSERT [dbo].[Venta] ([idVenta], [fechaVenta], [idTipoComp], [comprobante], [idCliente], [importeTotal], [idVendedor], [idDespacho], [idUsuario], [estado], [compAnterior]) VALUES (39, CAST(N'2021-05-05' AS Date), 3, N'RC-2021000003', 13, CAST(22.60 AS Decimal(10, 2)), 2, 1, 2, N'P', N'RC-2021000003')
INSERT [dbo].[Venta] ([idVenta], [fechaVenta], [idTipoComp], [comprobante], [idCliente], [importeTotal], [idVendedor], [idDespacho], [idUsuario], [estado], [compAnterior]) VALUES (40, CAST(N'2021-05-05' AS Date), 3, N'RC-2021000004', 12, CAST(54.60 AS Decimal(10, 2)), 2, 1, 2, N'P', N'RC-2021000004')
INSERT [dbo].[Venta] ([idVenta], [fechaVenta], [idTipoComp], [comprobante], [idCliente], [importeTotal], [idVendedor], [idDespacho], [idUsuario], [estado], [compAnterior]) VALUES (41, CAST(N'2021-05-05' AS Date), 3, N'RC-2021000005', 14, CAST(56.80 AS Decimal(10, 2)), 2, 1, 2, N'P', N'RC-2021000005')
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
SET IDENTITY_INSERT [dbo].[VentaDetalle] ON 

INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (1, 28, 7, CAST(14.000 AS Decimal(10, 3)), CAST(2.80 AS Decimal(10, 2)), CAST(39.20 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (10, 30, 9, CAST(2.000 AS Decimal(10, 3)), CAST(1.60 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (12, 30, 19, CAST(20.000 AS Decimal(10, 3)), CAST(0.60 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (14, 35, 3, CAST(20.000 AS Decimal(10, 3)), CAST(2.60 AS Decimal(10, 2)), CAST(52.00 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (15, 36, 4, CAST(100.000 AS Decimal(10, 3)), CAST(1.80 AS Decimal(10, 2)), CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (21, 36, 2, CAST(100.000 AS Decimal(10, 3)), CAST(1.80 AS Decimal(10, 2)), CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (34, 37, 13, CAST(3.000 AS Decimal(10, 3)), CAST(5.30 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (40, 40, 11, CAST(3.000 AS Decimal(10, 3)), CAST(3.20 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (41, 40, 16, CAST(3.000 AS Decimal(10, 3)), CAST(3.80 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (42, 40, 23, CAST(3.000 AS Decimal(10, 3)), CAST(8.40 AS Decimal(10, 2)), CAST(25.20 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (43, 40, 7, CAST(3.000 AS Decimal(10, 3)), CAST(2.80 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (44, 37, 10, CAST(6.000 AS Decimal(10, 3)), CAST(3.20 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (45, 37, 17, CAST(5.000 AS Decimal(10, 3)), CAST(3.90 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (46, 37, 14, CAST(10.000 AS Decimal(10, 3)), CAST(5.40 AS Decimal(10, 2)), CAST(54.00 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (47, 37, 15, CAST(5.000 AS Decimal(10, 3)), CAST(5.20 AS Decimal(10, 2)), CAST(26.00 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (59, 41, 2, CAST(11.000 AS Decimal(10, 3)), CAST(1.80 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (61, 39, 5, CAST(2.000 AS Decimal(10, 3)), CAST(3.80 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (64, 41, 32, CAST(2.000 AS Decimal(10, 3)), CAST(18.50 AS Decimal(10, 2)), CAST(37.00 AS Decimal(10, 2)))
INSERT [dbo].[VentaDetalle] ([idVentaDeta], [idVenta], [idProducto], [cantidad], [costoUnitario], [costoTotal]) VALUES (65, 39, 1, CAST(6.000 AS Decimal(10, 3)), CAST(2.50 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[VentaDetalle] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Persona__5AE6D5CA78A197B2]    Script Date: 5/05/2021 20:46:12 ******/
ALTER TABLE [dbo].[Persona] ADD UNIQUE NONCLUSTERED 
(
	[contraseña] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Persona__AB6E616499491FF3]    Script Date: 5/05/2021 20:46:12 ******/
ALTER TABLE [dbo].[Persona] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_principal_name]    Script Date: 5/05/2021 20:46:12 ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Venta__74B8B9EA84D8B4C4]    Script Date: 5/05/2021 20:46:12 ******/
ALTER TABLE [dbo].[Venta] ADD UNIQUE NONCLUSTERED 
(
	[comprobante] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__VentaDet__5783745222EE6AA2]    Script Date: 5/05/2021 20:46:12 ******/
ALTER TABLE [dbo].[VentaDetalle] ADD UNIQUE NONCLUSTERED 
(
	[idProducto] ASC,
	[idVenta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT ('') FOR [image]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT ('') FOR [detalle]
GO
ALTER TABLE [dbo].[TipoComprobante] ADD  DEFAULT ('REC') FOR [nomenclatura]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ('P') FOR [estado]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([idTipoMov])
REFERENCES [dbo].[TipoMovimiento] ([idTipoMov])
GO
ALTER TABLE [dbo].[OfertaDetalle]  WITH CHECK ADD FOREIGN KEY([idOferta])
REFERENCES [dbo].[Oferta] ([idOferta])
GO
ALTER TABLE [dbo].[OfertaDetalle]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idDespacho])
REFERENCES [dbo].[Despacho] ([idDespacho])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idTipoComp])
REFERENCES [dbo].[TipoComprobante] ([idTipoComp])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idVendedor])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD CHECK  (([condicion] like '[RP]'))
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD CHECK  (([flagMov] like '[ES]'))
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD CHECK  (([sexo] like '[HM]'))
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD CHECK  (([stockMinimo]>(0)))
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [char_estado] CHECK  (([estado] like '[VP]'))
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [char_estado]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD CHECK  (([cantidad]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[ups_CanastillaPendientePorCliente]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ups_CanastillaPendientePorCliente](
	@idCliente INT
)
AS BEGIN
	SELECT vd.idVenta,
		vd.idVentaDeta,
		v.fechaVenta,
		vd.idProducto,
		p.nombreProducto,
		vd.cantidad,
		vd.costoUnitario,
		vd.costoTotal,
		v.comprobante,
		v.estado
	FROM VentaDetalle vd
	JOIN Venta v ON v.idVenta=vd.idVenta
	JOIN Producto p ON p.idProducto=vd.idProducto
	WHERE v.idCliente=@idCliente
		AND v.estado='P'
END
GO
/****** Object:  StoredProcedure [dbo].[ups_Venta_DeleteDetalle]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ups_Venta_DeleteDetalle](
	@idDetalle INT
)
AS BEGIN
	DELETE FROM VentaDetalle
	WHERE idVentaDeta=@idDetalle
END
GO
/****** Object:  StoredProcedure [dbo].[ups_Venta_GetCantidadPorCliente]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ups_Venta_GetCantidadPorCliente](
	@idCliente INT
)
AS BEGIN
	SELECT COUNT(1) as cantidad
	FROM VentaDetalle vd
	JOIN Venta v ON v.idVenta=vd.idVenta
	WHERE v.idCliente=@idCliente
		AND v.estado='P'
END
GO
/****** Object:  StoredProcedure [dbo].[ups_Venta_GetIdVentaPorCliente]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ups_Venta_GetIdVentaPorCliente](
	@idCliente INT
)
AS BEGIN
	SELECT TOP(1) idVenta 
	FROM
		(
			SELECT CONVERT(DATE,'2000-01-01') AS fechaVenta,
				0 AS idVenta
			UNION 
			SELECT v.fechaVenta,
				ISNULL(v.idVenta,'0') AS idVenta
			FROM Venta v
			WHERE idCliente=@idCliente
			AND estado='P'
		)AS temp
		ORDER BY fechaVenta DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[ups_Venta_UpdateCantidad]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ups_Venta_UpdateCantidad](
	@idDetalle INT,
	@cantidad DECIMAL(10,3)
)
AS BEGIN
	UPDATE VentaDetalle
	SET cantidad=@cantidad
	WHERE idVentaDeta=@idDetalle
END
GO
/****** Object:  StoredProcedure [dbo].[usp_actualizar_Personas]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[usp_actualizar_Personas]
  (@idPersona int,
   @dni varchar(12)
   ,@nombres varchar(50)
   ,@apellidos varchar(80)
   ,@sexo char(1)
   ,@nacimiento date
   ,@email varchar(100)
   ,@celular varchar(9)
   ,@idDistrito varchar(6)
   ,@direccion varchar(250)
   ,@referencia varchar(250)
   ,@contraseña varchar(4000)
   ,@tipo char(1)
   
)
AS BEGIN
		
-- actualiza password
	  if @tipo = 1
		UPDATE Persona
		SET 
			[contraseña] = @contraseña
		WHERE idPersona = @idPersona;
		--actualizar full
	  else if @tipo = 2
		UPDATE Persona
		SET [dni] =  @dni
			,[nombres] = @nombres
			,[apellidos] = @apellidos
			,[sexo] = @sexo
			,[nacimiento] = @nacimiento
			,[email] = @email
			,[celular] = @celular 
			,[idDistrito] = @idDistrito
			,[direccion] = @direccion
			,[referencia] = @referencia
			,[contraseña] = @contraseña
		WHERE idPersona = @idPersona;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Categoria_Banner]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Categoria_Banner]
AS BEGIN
    SELECT DISTINCT c.idCategoria,
        c.descripcion,
        p.ruta+c.image as pathImage
        , c.detalle
    FROM Categoria c
    JOIN PathFile p ON p.idPath=3
    JOIN tmpStock s ON s.idCategoria=c.idCategoria
END
GO
/****** Object:  StoredProcedure [dbo].[usp_eliminar_Personas]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[usp_eliminar_Personas]
  (@idPersona int)
AS BEGIN
		

	  DELETE FROM Persona WHERE idPersona = @idPersona;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Insertar_Persona]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Insertar_Persona]
		(	@dni varchar(12)
		  ,@nombres varchar(50)
		  ,@apellidos varchar(80)
		  ,@sexo char(1)
		  ,@nacimiento date
		  ,@email varchar(100)
		  ,@celular varchar(9)
		  ,@idDistrito varchar(6)
		  ,@direccion varchar(250)
		  ,@referencia varchar(250)
		  ,@contraseña varchar(4000)
		  ,@role varchar(900)
		  )
AS BEGIN
	
	SET NOCOUNT ON 
	  INSERT INTO Persona ([dni]
						  ,[nombres]
						  ,[apellidos]
						  ,[sexo]
						  ,[nacimiento]
						  ,[email]
						  ,[celular]
						  ,[idDistrito]
						  ,[direccion]
						  ,[referencia]
						  ,[contraseña]
						  ,[role])
		VALUES (@dni
		  ,@nombres
		  ,@apellidos
		  ,@sexo
		  ,@nacimiento
		  ,@email
		  ,@celular
		  ,@idDistrito
		  ,@direccion
		  ,@referencia
		  ,@contraseña
		  ,@role);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Inventario_Insert]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Inventario_Insert](
    @idTipoMov INT
    , @flagMov CHAR(1) 
    , @idProducto INT
    , @cantidad DECIMAL(10,3) 
    , @condicion CHAR(1) 
    , @comprobante NVARCHAR(30)
)
AS BEGIN
    INSERT INTO Inventario
    VALUES( CONVERT(DATE,GETDATE())
        , @idTipoMov
        , @flagMov
        , @idProducto
        , @cantidad
        , @condicion --Si la venta se ha realizado o no (R/P)
        , @comprobante
    )
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Listar_Personas]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Listar_Personas]
  (
	@idPersona int,
	@tipoBusqueda int
  )
AS BEGIN
	if @tipoBusqueda = 1 

		SELECT [idPersona]
		  ,[dni]
		  ,[nombres]
		  ,[apellidos]
		  ,[sexo]
		  ,[nacimiento]
		  ,[email]
		  ,[celular]
		  ,[idDistrito]
		  ,[direccion]
		  ,[referencia]
		  ,[contraseña]
		  ,[role]
	  FROM Persona;

	  else 
	
		  SELECT [idPersona]
			  ,[dni]
			  ,[nombres]
			  ,[apellidos]
			  ,[sexo]
			  ,[nacimiento]
			  ,[email]
			  ,[celular]
			  ,[idDistrito]
			  ,[direccion]
			  ,[referencia]
			  ,[contraseña]
			  ,[role]
		  FROM Persona
		  where idPersona = @idpersona;
		
	  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Obtener_Productos]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Obtener_Productos]
AS
	SELECT A.idProducto
      ,A.codigoProducto
	  ,A.nombreProducto
      ,C.[idCategoria]
	  ,C.descripcion
      
      ,[precioBase]
	  ,B.cantidad
      ,[stockMinimo]
      ,[imageFile]
	FROM [dbo].[Producto] A 
	INNER JOIN [dbo].[Inventario] B ON A.idProducto = B.idProducto
	INNER JOIN [dbo].[Categoria] C ON A.idCategoria = C.idCategoria
GO
/****** Object:  StoredProcedure [dbo].[usp_Persona_BasicInsert]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Persona_BasicInsert](
    @nombres VARCHAR(50)
    , @email VARCHAR(100) 
    , @contraseña NVARCHAR(1700)
	, @idPersona INT OUTPUT
)
AS BEGIN
	DECLARE @id TABLE(Id INT);

    INSERT INTO Persona
	OUTPUT INSERTED.idPersona INTO @id
	VALUES('' --dni
        , @nombres
        , '' --Apellido
        , 'H' --Sexo
        , CONVERT(DATE,GETDATE())
        , @email
        , '' --Celular
        , '' --Distrito
        , '' --Direccion
        , '' --Referencia
        , @contraseña
        , 'cliente' --Role
    );

	 SET @idPersona=ISNULL((SELECT Id FROM @id),0);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Persona_BuscarPorId]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Persona_BuscarPorId](
    @idPersona INT
)
AS BEGIN
    SELECT p.idPersona,
		p.dni,
		p.nombres,
		p.apellidos,
		p.sexo,
		p.nacimiento,
		p.email,
		p.celular,
		p.idDistrito,
		p.direccion,
		p.referencia,
		p.contraseña,
		p.role
    FROM Persona p
    WHERE idPersona=@idPersona
END


GO
/****** Object:  StoredProcedure [dbo].[usp_Persona_Login]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Persona_Login](
    @email VARCHAR(100)
    , @contraseña NVARCHAR(1700)
)
AS BEGIN
    SELECT p.idPersona, p.dni, p.nombres, p.apellidos, p.sexo,
        p.email, p.role
    FROM Persona p
    WHERE email=@email
        AND contraseña=@contraseña;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Persona_UpdateInfo]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Persona_UpdateInfo](
    @idPersona INT 
    , @dni NVARCHAR(12) 
    , @nombres VARCHAR(50) 
    , @apellidos VARCHAR(80) 
    , @sexo CHAR(1) 
    , @nacimiento DATE
    , @email VARCHAR(100) 
    , @celular NVARCHAR(9) 
    , @idDistrito NVARCHAR(6) 
    , @direccion VARCHAR(250) 
    , @referencia VARCHAR(250) 
    , @contraseña NVARCHAR(1700)  
)
AS BEGIN
    UPDATE Persona
    SET dni=@dni,
        nombres=@nombres,
        apellidos=@apellidos,
        sexo=@sexo,
        nacimiento=@nacimiento,
        email=@email,
        celular=@celular,
        idDistrito=@idDistrito,
        direccion=@direccion,
        referencia=@referencia,
        contraseña=@contraseña
    WHERE idPersona=@idPersona;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Producto_Banner]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Producto_Banner]
AS BEGIN
	SELECT b.id
		, b.nombre
		, p.ruta+b.image as image
	FROM Banner b
	JOIN PathFile p ON p.idPath=b.idPath
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Producto_GenerarStock]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Producto_GenerarStock]
AS BEGIN
    IF(OBJECT_ID('tempdb..#tmpEntrada'))IS NOT NULL
    DROP TABLE #tmpEntrada
    SELECT idProducto, SUM(i.cantidad) as cantidad
    INTO #tmpEntrada
    FROM Inventario i
    WHERE i.flagMov='E'
    GROUP BY i.idProducto;
    
    IF(OBJECT_ID('tempdb..#tmpSalida'))IS NOT NULL
    DROP TABLE #tmpSalida
    SELECT i.idProducto, SUM(i.cantidad) as cantidad
    INTO #tmpSalida
    FROM Inventario i
    WHERE i.flagMov='S'
    GROUP BY i.idProducto;

    --<> Generar Stock
     IF(OBJECT_ID('tempdb..#tmpStock'))IS NOT NULL
    DROP TABLE #tmpStock
    SELECT p.idProducto, 
        SUM(ISNULL(e.cantidad,0))-SUM(ISNULL(s.cantidad,0)) as stock
    INTO #tmpStock
    FROM Producto p
    LEFT JOIN #tmpEntrada e ON e.idProducto=p.idProducto
    LEFT JOIN #tmpSalida s ON s.idProducto=p.idProducto
    GROUP BY p.idProducto
    --<>
    SELECT p.idProducto, p.codigoProducto, p.idCategoria, c.descripcion as nombreCategoria,
        p.nombreProducto, p.imageFile, p.precioBase, p.stockMinimo,
        s.stock
    INTO tmpStock
    FROM Producto p
    JOIN #tmpStock s ON s.idProducto=p.idProducto
    JOIN Categoria c ON c.idCategoria=p.idCategoria
    WHERE s.stock>p.stockMinimo -- Stock a lo permitido
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Stock]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Stock]
AS BEGIN
    IF(OBJECT_ID('tmpStock'))IS NOT NULL
    DROP TABLE tmpStock;
    EXECUTE usp_Producto_GenerarStock;
    ---
    SELECT x.idProducto, x.codigoProducto, x.idCategoria, x.nombreCategoria,
        x.nombreProducto, p.ruta+x.imageFile as imageFile, x.precioBase, x.stockMinimo,
        x.stock
    FROM tmpStock x

	JOIN PathFile p ON p.idPath=4
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Stock_ByCategory]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Stock_ByCategory](
    @idCategoria INT
)
AS BEGIN
    IF(OBJECT_ID('tmpStock'))IS NOT NULL
    DROP TABLE tmpStock;
    EXECUTE usp_Producto_GenerarStock;
    ---
    SELECT x.idProducto, x.codigoProducto, x.idCategoria, x.nombreCategoria,
        x.nombreProducto, p.ruta+x.imageFile as imageFile,
        x.precioBase, x.stockMinimo,
        x.stock
    FROM tmpStock x
    JOIN PathFile p ON p.idPath=4
    WHERE x.idCategoria=@idCategoria;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Stock_ByProduct]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Stock_ByProduct](
    @name VARCHAR(30)
)
AS BEGIN
    IF(OBJECT_ID('tmpStock'))IS NOT NULL
    DROP TABLE tmpStock;
    EXECUTE usp_Producto_GenerarStock;
    ---
    SELECT x.idProducto, x.codigoProducto, x.idCategoria, x.nombreCategoria,
        x.nombreProducto, x.imageFile, x.precioBase, x.stockMinimo,
        x.stock
    FROM tmpStock x
    WHERE x.nombreProducto LIKE'%'+@name+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Venta_Delete]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Venta_Delete](
    @idVenta BIGINT
    , @error NVARCHAR(MAX) OUTPUT
)
AS BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            SET @error='Esta venta ya se ha realizado, no se puede eliminar.'
            --Validar si la venta está pendiente
            DECLARE @estado CHAR(1)=(
                SELECT estado
                FROM Venta
                WHERE idVenta=@idVenta
            );
            -- Solo se eliminan los pendientes
            IF(@estado='P')
                BEGIN
                    --Eliminar DetalleVenta (tmb, se elimina en inventario)
                    DELETE FROM VentaDetalle
                    WHERE idVenta=@idVenta
                    
                    --Eliminar Venta
                    DELETE FROM Venta 
                    WHERE idVenta=@idVenta

                    SET @error='Eliminación de datos completada.'
                END

        END TRY
        BEGIN CATCH
            SET @error=(
                (SELECT error_message())+' '+
                (SELECT error_procedure())+' '+
                (SELECT error_line())
            );
            IF(@@trancount>0)
                ROLLBACK TRANSACTION;
        END CATCH
             IF(@@trancount>0)
                BEGIN
                    --SET @error='Transacción completada';
                    COMMIT TRANSACTION;
                END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Venta_GetComprobante]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Venta_GetComprobante](
    @idTipoComp INT
    , @outValu VARCHAR(13) OUTPUT
)
AS BEGIN
    --Obtener Comprobante correlativo
    DECLARE @nom varchar(2)=(
        SELECT nomenclatura 
        FROM TipoComprobante 
        WHERE idTipoComp=@idTipoComp
    );
    DECLARE @year varchar(4)=(YEAR(GETDATE()));
    DECLARE @comprobante VARCHAR(13)=(
        SELECT @nom+'-'+@year+
            RIGHT('000000'+
                CONVERT(VARCHAR,
                        RIGHT(ISNULL(
                                MAX(comprobante)
                                ,0)
                            ,6)+1)
                        ,6)
        FROM Venta
        WHERE idTipoComp=@idTipoComp
            AND (LEFT(RIGHT(comprobante,10),4))=@year
    );

    SET @outValu=@comprobante;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Venta_Insert]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Venta_Insert](
    @idTipoComp INT
    --, @comprobante NVARCHAR(13) 
    , @idCliente INT 
    --, @importeTotal DECIMAL(10,2) 
    , @idVendedor INT 
    , @idDespacho INT 
    --, @idUsuario INT 
    --, @estado CHAR(1)
    --------------------
    , @idVenta BIGINT
    , @idProducto INT 
    , @cantidad DECIMAL(10,3)
    --------------------
    , @error NVARCHAR(MAX) OUTPUT
)
AS BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            --Centilena para obtener el IdVenta
            DECLARE @idOutput TABLE(id BIGINT);
            --Validamos si la canastilla está habilitada
            DECLARE @valid INT=(
                SELECT COUNT(1) FROM [dbo].[Venta]
                WHERE  fechaVenta>=CONVERT(DATE,DATEADD(DAY,-1,GETDATE()))
                    AND idCliente=@idCliente AND estado='P'
            );
            --Si @valid=0; significa que, vamos a abrir la canastilla
            IF(@valid=0)
                BEGIN
                    --Obtener Comprobante correlativo
                    DECLARE @comprobante VARCHAR(13)
                    exec usp_Venta_GetComprobante @idTipoComp, @comprobante OUTPUT;
                   
                    --Insertar valores a Ventas
                    INSERT INTO Venta
                        OUTPUT INSERTED.idVenta INTO @idOutput
                    VALUES( CONVERT(DATE,GETDATE())
                        , @idTipoComp
                        , @comprobante
                        , @idCliente
                        , 0 -- Importe total actualizar con trigger
                        , @idVendedor
                        , @idDespacho
                        , @idVendedor --El vendedor es el usuario en esta instancia.
                        , 'P' -- Inicializa con Pendiente; actualizar con trigger
                        , @comprobante -- Se registra el comprobante.. servirá para identificar en inventario
                    );
                END
            --Si la canastilla está abierta. se registra los detalles
            DECLARE @newId BIGINT=ISNULL((SELECT id FROM @idOutput),0);
            IF(@newId>0)
                SET @idVenta=@newId;
				--SET @idOut=@newId;
            --- Insertar detalles
            EXECUTE usp_VentaDetalle_Insert @idVenta  
                , @idProducto  
                , @cantidad
        END TRY
        BEGIN CATCH
            SET @error='-1|'+(
                (SELECT error_message())+' '+
                (SELECT error_procedure())+' '+
                (SELECT error_line())
            );
			--SET @idOut=-1;
            IF(@@trancount>0)
                ROLLBACK TRANSACTION;
        END CATCH
             IF(@@trancount>0)
                BEGIN
                    SET @error=CONVERT(VARCHAR,@idVenta)+'|Transacción completada';
                    COMMIT TRANSACTION;
                END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Venta_Update]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Venta_Update](
    @idTipoComp INT
    , @idVenta BIGINT 
)
AS BEGIN
    --Obtener Comprobante correlativo   
    DECLARE @comprobante VARCHAR(13)
    exec usp_Venta_GetComprobante @idTipoComp, @comprobante OUTPUT;
    
    DECLARE @estado CHAR(1)='V';
    -- Validar si es FACT o BOL
    if(@comprobante LIKE'%RC%')
        BEGIN SET @estado='P'; END
    -- Actualizar
    UPDATE Venta
    SET idTipoComp=@idTipoComp
        , comprobante=@comprobante
        , estado=@estado
    WHERE idVenta=@idVenta
END

GO
/****** Object:  StoredProcedure [dbo].[usp_VentaDetalle_Delete]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_VentaDetalle_Delete](
    @idVenta BIGINT 
    , @idProducto INT
)
AS BEGIN
    DELETE FROM VentaDetalle 
    WHERE idProducto=@idProducto
        AND idVenta=@idVenta
END

GO
/****** Object:  StoredProcedure [dbo].[usp_VentaDetalle_Insert]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_VentaDetalle_Insert](
    @idVenta BIGINT 
    , @idProducto INT 
    , @cantidad DECIMAL(10,3)
)
AS BEGIN
    DECLARE @cUnit DECIMAL(10,2)=(
        SELECT precioBase 
        FROM Producto 
        WHERE idProducto=@idProducto
    );
    DECLARE @total DECIMAL(10,2)=(
        @cantidad*@cUnit
    );

    INSERT INTO VentaDetalle
    VALUES( @idVenta
        , @idProducto
        , @cantidad
        , @cUnit
        , @total
    )
    --Se registra los detalles en movimientos
    --Obtener Tipo de movimiento (venta)
    DECLARE @mov INT=(
        SELECT TOP(1) idTipoMov
        FROM TipoMovimiento 
        WHERE descripcion LIKE'Salida%'
        AND descripcion LIKE'%venta'
    );
    --Obtener comprobante de venta
    DECLARE @comprobante VARCHAR(13)=(
        SELECT TOP(1) ISNULL(comprobante,'NON')
        FROM Venta
        WHERE idVenta=@idVenta
    );
    --Ejecutar insert inventario
    EXECUTE usp_Inventario_Insert @mov
        , 'S' --Salida
        , @idProducto
        , @cantidad
        , 'P' --Condicion (P/R) inicia como Pendiente, actualizar a (R) con trigger
        , @comprobante --Comp. de venta| actualizar con trigger
END

GO
/****** Object:  StoredProcedure [dbo].[usp_VentaDetalle_Update]    Script Date: 5/05/2021 20:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_VentaDetalle_Update](
    @idVentaDeta BIGINT 
    , @cantidad DECIMAL(10,3)
)
AS BEGIN
    UPDATE VentaDetalle
    SET cantidad=@cantidad
        , costoTotal=(@cantidad*costoUnitario)
    WHERE idVentaDeta=@idVentaDeta;
END

GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
ALTER DATABASE [db_6thstore_dweb] SET  READ_WRITE 
GO
