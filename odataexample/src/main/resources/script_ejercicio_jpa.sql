USE [master]
GO
/****** Object:  Database [EJERCICIO_JPA]    Script Date: 30/12/2016 12:04:34 p.m. ******/
CREATE DATABASE [EJERCICIO_JPA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EJERCICIO_JPA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EJERCICIO_JPA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EJERCICIO_JPA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EJERCICIO_JPA_log.ldf' , SIZE = 2304KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EJERCICIO_JPA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EJERCICIO_JPA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EJERCICIO_JPA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET ARITHABORT OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EJERCICIO_JPA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EJERCICIO_JPA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EJERCICIO_JPA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EJERCICIO_JPA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET RECOVERY FULL 
GO
ALTER DATABASE [EJERCICIO_JPA] SET  MULTI_USER 
GO
ALTER DATABASE [EJERCICIO_JPA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EJERCICIO_JPA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EJERCICIO_JPA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EJERCICIO_JPA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EJERCICIO_JPA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EJERCICIO_JPA', N'ON'
GO
USE [EJERCICIO_JPA]
GO
/****** Object:  Table [dbo].[localidades]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[localidades](
	[id_pais] [int] NOT NULL,
	[id_provincia] [int] NOT NULL,
	[id_localidad] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[cp] [int] NULL,
	[prefijo] [int] NULL,
 CONSTRAINT [PK_localidades] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC,
	[id_provincia] ASC,
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logging_event]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logging_event](
	[timestmp] [decimal](20, 0) NOT NULL,
	[formatted_message] [varchar](4000) NOT NULL,
	[logger_name] [varchar](254) NOT NULL,
	[level_string] [varchar](254) NOT NULL,
	[thread_name] [varchar](254) NULL,
	[reference_flag] [smallint] NULL,
	[arg0] [varchar](254) NULL,
	[arg1] [varchar](254) NULL,
	[arg2] [varchar](254) NULL,
	[arg3] [varchar](254) NULL,
	[caller_filename] [varchar](254) NOT NULL,
	[caller_class] [varchar](254) NOT NULL,
	[caller_method] [varchar](254) NOT NULL,
	[caller_line] [char](4) NOT NULL,
	[event_id] [decimal](38, 0) IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logging_event_exception]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logging_event_exception](
	[event_id] [decimal](38, 0) NOT NULL,
	[i] [smallint] NOT NULL,
	[trace_line] [varchar](254) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[i] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logging_event_property]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logging_event_property](
	[event_id] [decimal](38, 0) NOT NULL,
	[mapped_key] [varchar](254) NOT NULL,
	[mapped_value] [varchar](1024) NULL,
PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[mapped_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paises]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paises](
	[id_pais] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[prefijo] [int] NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[permisos]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[permisos](
	[nombre_permiso] [varchar](50) NOT NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_permisos] PRIMARY KEY CLUSTERED 
(
	[nombre_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[personas]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[personas](
	[id_tipodoc] [int] NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[nombres] [varchar](100) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[apodo] [varchar](100) NULL,
	[id_pais] [int] NOT NULL,
	[id_provincia] [int] NOT NULL,
	[id_localidad] [int] NOT NULL,
	[fecha_alta] [date] NOT NULL,
	[genero] [char](1) NOT NULL,
 CONSTRAINT [PK_personas] PRIMARY KEY CLUSTERED 
(
	[id_tipodoc] ASC,
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[personas_sectores]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[personas_sectores](
	[id_tipodoc] [int] NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[id_sector] [int] NOT NULL,
	[fecha_ingreso] [date] NOT NULL,
 CONSTRAINT [PK_personas_sectores] PRIMARY KEY CLUSTERED 
(
	[id_tipodoc] ASC,
	[numero_documento] ASC,
	[id_sector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[provincias](
	[id_pais] [int] NOT NULL,
	[id_provincia] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_provincias] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC,
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sectores]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sectores](
	[id_sector] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
 CONSTRAINT [PK_sectores] PRIMARY KEY CLUSTERED 
(
	[id_sector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipos_documentos]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipos_documentos](
	[id_tipodoc] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[abreviatura] [varchar](5) NULL,
 CONSTRAINT [PK_tipos_documentos] PRIMARY KEY CLUSTERED 
(
	[id_tipodoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_tipodoc] [int] NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[nombre_usuario] [varchar](200) NOT NULL,
	[clave] [varchar](40) NOT NULL,
	[fecha_alta] [date] NOT NULL,
	[cuenta_vencida] [tinyint] NOT NULL,
	[clave_vencida] [tinyint] NOT NULL,
	[cuenta_bloqueada] [tinyint] NOT NULL,
	[usuario_habilitado] [tinyint] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_tipodoc] ASC,
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuarios_permisos]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios_permisos](
	[id_tipodoc] [int] NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[nombre_permiso] [varchar](50) NOT NULL,
 CONSTRAINT [PK_usuarios_permisos] PRIMARY KEY CLUSTERED 
(
	[id_tipodoc] ASC,
	[numero_documento] ASC,
	[nombre_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UNIQUE_paises_nombre]    Script Date: 30/12/2016 12:04:34 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UNIQUE_paises_nombre] ON [dbo].[paises]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UNIQUE_provincias_nombre]    Script Date: 30/12/2016 12:04:34 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UNIQUE_provincias_nombre] ON [dbo].[provincias]
(
	[id_pais] ASC,
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_nombre_usuario_unico]    Script Date: 30/12/2016 12:04:34 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_nombre_usuario_unico] ON [dbo].[usuarios]
(
	[id_tipodoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[localidades]  WITH CHECK ADD  CONSTRAINT [FK_localidades_paises] FOREIGN KEY([id_pais])
REFERENCES [dbo].[paises] ([id_pais])
GO
ALTER TABLE [dbo].[localidades] CHECK CONSTRAINT [FK_localidades_paises]
GO
ALTER TABLE [dbo].[localidades]  WITH CHECK ADD  CONSTRAINT [FK_localidades_provincias] FOREIGN KEY([id_pais], [id_provincia])
REFERENCES [dbo].[provincias] ([id_pais], [id_provincia])
GO
ALTER TABLE [dbo].[localidades] CHECK CONSTRAINT [FK_localidades_provincias]
GO
ALTER TABLE [dbo].[logging_event_exception]  WITH CHECK ADD FOREIGN KEY([event_id])
REFERENCES [dbo].[logging_event] ([event_id])
GO
ALTER TABLE [dbo].[logging_event_property]  WITH CHECK ADD FOREIGN KEY([event_id])
REFERENCES [dbo].[logging_event] ([event_id])
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD  CONSTRAINT [FK_personas_localidades] FOREIGN KEY([id_pais], [id_provincia], [id_localidad])
REFERENCES [dbo].[localidades] ([id_pais], [id_provincia], [id_localidad])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [FK_personas_localidades]
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD  CONSTRAINT [FK_personas_tipos_documentos] FOREIGN KEY([id_tipodoc])
REFERENCES [dbo].[tipos_documentos] ([id_tipodoc])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [FK_personas_tipos_documentos]
GO
ALTER TABLE [dbo].[personas_sectores]  WITH CHECK ADD  CONSTRAINT [FK_personas_sectores_personas] FOREIGN KEY([id_tipodoc], [numero_documento])
REFERENCES [dbo].[personas] ([id_tipodoc], [numero_documento])
GO
ALTER TABLE [dbo].[personas_sectores] CHECK CONSTRAINT [FK_personas_sectores_personas]
GO
ALTER TABLE [dbo].[personas_sectores]  WITH CHECK ADD  CONSTRAINT [FK_personas_sectores_sectores] FOREIGN KEY([id_sector])
REFERENCES [dbo].[sectores] ([id_sector])
GO
ALTER TABLE [dbo].[personas_sectores] CHECK CONSTRAINT [FK_personas_sectores_sectores]
GO
ALTER TABLE [dbo].[provincias]  WITH CHECK ADD  CONSTRAINT [FK_provincias_paises] FOREIGN KEY([id_pais])
REFERENCES [dbo].[paises] ([id_pais])
GO
ALTER TABLE [dbo].[provincias] CHECK CONSTRAINT [FK_provincias_paises]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_personas] FOREIGN KEY([id_tipodoc], [numero_documento])
REFERENCES [dbo].[personas] ([id_tipodoc], [numero_documento])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_personas]
GO
ALTER TABLE [dbo].[usuarios_permisos]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_permisos_permisos] FOREIGN KEY([nombre_permiso])
REFERENCES [dbo].[permisos] ([nombre_permiso])
GO
ALTER TABLE [dbo].[usuarios_permisos] CHECK CONSTRAINT [FK_usuarios_permisos_permisos]
GO
ALTER TABLE [dbo].[usuarios_permisos]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_permisos_usuarios] FOREIGN KEY([id_tipodoc], [numero_documento])
REFERENCES [dbo].[usuarios] ([id_tipodoc], [numero_documento])
GO
ALTER TABLE [dbo].[usuarios_permisos] CHECK CONSTRAINT [FK_usuarios_permisos_usuarios]
GO
/****** Object:  StoredProcedure [dbo].[uspNuevoPais]    Script Date: 30/12/2016 12:04:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspNuevoPais] @Id int = NULL, @Nombre nvarchar(100) = NULL, @Prefijo int = NULL
AS
INSERT INTO paises (id_pais, nombre, prefijo) VALUES (@Id, @Nombre, @Prefijo)

GO
USE [master]
GO
ALTER DATABASE [EJERCICIO_JPA] SET  READ_WRITE 
GO
