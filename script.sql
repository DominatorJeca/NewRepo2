USE [master]
GO
/****** Object:  Database [Inventario]    Script Date: 17/1/2024 22:08:37 ******/
CREATE DATABASE [Inventario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inventario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Inventario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Inventario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Inventario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Inventario] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inventario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inventario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inventario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inventario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inventario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inventario] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inventario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inventario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inventario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inventario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inventario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inventario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inventario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inventario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inventario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inventario] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inventario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inventario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inventario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inventario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inventario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inventario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inventario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inventario] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Inventario] SET  MULTI_USER 
GO
ALTER DATABASE [Inventario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inventario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inventario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inventario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Inventario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Inventario] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Inventario] SET QUERY_STORE = ON
GO
ALTER DATABASE [Inventario] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Inventario]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] NOT NULL,
	[NumeroIdentidad] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Telefono] [varchar](13) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Genero] [varchar](1) NOT NULL,
	[FechaContratacion] [datetime] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadoUsuario]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadoUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpleadoId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_EmpleadoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lotes]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaVencimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_Lotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombrePerfil] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerfilUsuario]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PerfilId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_PerfilUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[PrecioProducto] [float] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalidaDetalle]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalidaDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalidaId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [float] NULL,
 CONSTRAINT [PK_SalidaDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salidas]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salidas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaCreado] [datetime] NOT NULL,
	[UsuarioCrea] [int] NOT NULL,
	[SucursalId] [int] NOT NULL,
	[Encabezado] [varchar](50) NOT NULL,
	[Detalle] [varchar](150) NOT NULL,
	[Estado] [varchar](1) NOT NULL,
	[FechaRecibido] [datetime] NULL,
	[UsuarioRecibe] [int] NULL,
 CONSTRAINT [PK_Salidas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[Id] [int] NOT NULL,
	[NombreSucursal] [varchar](50) NOT NULL,
	[Telefono] [varchar](13) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmpleadoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoUsuario_Empleado] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[EmpleadoUsuario] CHECK CONSTRAINT [FK_EmpleadoUsuario_Empleado]
GO
ALTER TABLE [dbo].[EmpleadoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoUsuario_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[EmpleadoUsuario] CHECK CONSTRAINT [FK_EmpleadoUsuario_Usuario]
GO
ALTER TABLE [dbo].[Lotes]  WITH CHECK ADD  CONSTRAINT [FK_Lotes_Producto] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[Lotes] CHECK CONSTRAINT [FK_Lotes_Producto]
GO
ALTER TABLE [dbo].[PerfilUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PerfilUsuario_Perfil] FOREIGN KEY([PerfilId])
REFERENCES [dbo].[Perfil] ([Id])
GO
ALTER TABLE [dbo].[PerfilUsuario] CHECK CONSTRAINT [FK_PerfilUsuario_Perfil]
GO
ALTER TABLE [dbo].[PerfilUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PerfilUsuario_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[PerfilUsuario] CHECK CONSTRAINT [FK_PerfilUsuario_Usuario]
GO
ALTER TABLE [dbo].[SalidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SalidaDetalle_Producto] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[SalidaDetalle] CHECK CONSTRAINT [FK_SalidaDetalle_Producto]
GO
ALTER TABLE [dbo].[SalidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SalidaDetalle_Salidas] FOREIGN KEY([SalidaId])
REFERENCES [dbo].[Salidas] ([Id])
GO
ALTER TABLE [dbo].[SalidaDetalle] CHECK CONSTRAINT [FK_SalidaDetalle_Salidas]
GO
ALTER TABLE [dbo].[Salidas]  WITH CHECK ADD  CONSTRAINT [FK_Salidas_Sucursal] FOREIGN KEY([SucursalId])
REFERENCES [dbo].[Sucursal] ([Id])
GO
ALTER TABLE [dbo].[Salidas] CHECK CONSTRAINT [FK_Salidas_Sucursal]
GO
ALTER TABLE [dbo].[Salidas]  WITH CHECK ADD  CONSTRAINT [FK_Salidas_Usuario] FOREIGN KEY([UsuarioRecibe])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Salidas] CHECK CONSTRAINT [FK_Salidas_Usuario]
GO
ALTER TABLE [dbo].[Salidas]  WITH CHECK ADD  CONSTRAINT [FK_Salidas_Usuario1] FOREIGN KEY([UsuarioCrea])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Salidas] CHECK CONSTRAINT [FK_Salidas_Usuario1]
GO
/****** Object:  StoredProcedure [dbo].[CrearSalida]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearSalida]
	@UsuarioCrea int,
	@Sucursal int,
	@Encabezado varchar(50),
	@Detalle varchar(150)
AS
BEGIN
	INSERT INTO [dbo].[Salidas]
           ([FechaCreado]
           ,[UsuarioCrea]
           ,[SucursalId]
           ,[Encabezado]
           ,[Detalle]
           ,[Estado])
     VALUES(GETDATE(),@UsuarioCrea,@Sucursal,@Encabezado, @Detalle,'E')

	 select top(1)Id from Salidas order by FechaCreado desc

END
GO
/****** Object:  StoredProcedure [dbo].[DetalleSalida]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DetalleSalida]
	@Salida int,
	@Producto int,
	@Cantidad float
AS
BEGIN	
	insert into SalidaDetalle values(@Salida,@Producto,@Cantidad)

	DECLARE @CantidadRestante float
	DECLARE @Id int

	while @Cantidad>0
	BEGIN

	set @Id = (SELECT top(1) Id from Lotes where ProductoId = @Producto and Cantidad > 0 order by FechaVencimiento asc )
	set @CantidadRestante = (select top(1) Cantidad from Lotes where Id=@Id)

	if @CantidadRestante >= @Cantidad
	Begin
		UPDATE Lotes set Cantidad=Cantidad-@Cantidad where Id=@Id
		set @Cantidad=0
	End

	if @CantidadRestante < @Cantidad
	begin
		update Lotes set Cantidad=0 where Id=@Id
		set @Cantidad=@Cantidad-@CantidadRestante
	end

	End

	select top(1)SalidaId from SalidaDetalle where SalidaId=@Salida
END
GO
/****** Object:  StoredProcedure [dbo].[EnviosPendientes]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EnviosPendientes]
	@Sucursal int
AS
BEGIN
	select sum(p.PrecioProducto*s.Cantidad) as Pendiente from SalidaDetalle s
	inner join Producto p on s.ProductoId=p.Id
END
GO
/****** Object:  StoredProcedure [dbo].[ListaProductos]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListaProductos]
	
AS
BEGIN	
	Select p.Id, p.NombreProducto, p.PrecioProducto, sum(l.Cantidad) as Cantidad from Producto p
	INNER JOIN Lotes l on p.Id=l.ProductoId
	group by p.Id, p.NombreProducto, p.PrecioProducto
END
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LoginUser]
	@Username varchar(50),
	@Password varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT u.Id as Username, pu.PerfilId from Usuario u
	inner join PerfilUsuario pu on u.Id=pu.UsuarioId
	where u.Username=@Username and u.Password=CONVERT(NVARCHAR(50), HASHBYTES('SHA2_512', @Password), 2)
END
GO
/****** Object:  StoredProcedure [dbo].[MostrarDetallexSalida]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MostrarDetallexSalida]
	@SalidaId int
AS
BEGIN
	Select p.NombreProducto, p.PrecioProducto, s.Cantidad, (p.PrecioProducto*s.Cantidad) as Costo from SalidaDetalle s
	inner join Producto p on s.ProductoId=p.Id
	where SalidaId=@SalidaId
END
GO
/****** Object:  StoredProcedure [dbo].[MostrarSalida]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MostrarSalida]
AS
BEGIN	
	Select s.Id,s.FechaCreado,u.Username as UsuarioCrea, su.NombreSucursal as SucursalId, s.Encabezado, s.Detalle,
		case when s.Estado= 'E' THEN 'Enviado a Sucursal'
		ELSE 'Recibido'
		End as Estado, uu.Username as UsuarioRecibe, s.FechaRecibido
	from Salidas s
	inner join Usuario u on s.UsuarioCrea=u.Id
	left join Usuario uu on s.UsuarioRecibe=uu.Id
	inner join Sucursal su on s.SucursalId=su.Id
	order by s.FechaCreado desc
END
GO
/****** Object:  StoredProcedure [dbo].[MostrarSalidaFiltrado]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MostrarSalidaFiltrado] 
	@FechaDesde as date,
	@FechaHasta as date,
	@Sucursal int
AS
BEGIN
	select s.Id, s.FechaCreado, u.Username AS UsuarioCrea, su.NombreSucursal as SucursalId,Encabezado, Detalle, 
	CASE WHEN s.Estado = 'E'THEN 'Enviado a Sucursal'
	Else 'Recibido'
	End as Estado, FechaRecibido, uu.Username as UsuarioRecibe
	from Salidas s
	inner join Usuario u on s.UsuarioCrea=u.Id
	left join Usuario uu on s.UsuarioRecibe=uu.Id
	inner join Sucursal su on s.SucursalId=su.Id 
	where (FechaCreado between @FechaDesde and @FechaHasta) and SucursalId=@Sucursal
END
GO
/****** Object:  StoredProcedure [dbo].[RecibirSalida]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RecibirSalida]
	@Usuario int,
	@Salida int
AS
BEGIN
	update Salidas set Estado='R', FechaRecibido=GETDATE(),UsuarioRecibe=@Usuario
	where Id=@Salida

	SELECT Id from Salidas where Id=@Salida
END
GO
/****** Object:  StoredProcedure [dbo].[Sucursales]    Script Date: 17/1/2024 22:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sucursales]
AS
BEGIN
	Select Id, NombreSucursal from Sucursal
End
GO
USE [master]
GO
ALTER DATABASE [Inventario] SET  READ_WRITE 
GO
