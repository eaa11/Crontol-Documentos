USE master
GO
CREATE DATABASE dbdocuments
GO
USE [dbdocuments]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 19/04/2021 04:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departaments]    Script Date: 19/04/2021 04:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departaments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Siglas] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Departaments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Documents]    Script Date: 19/04/2021 04:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Numero] [nvarchar](max) NULL,
	[Nombre] [nvarchar](max) NULL,
	[User_Id] [int] NOT NULL,
	[Departament_Origen_Id] [int] NOT NULL,
	[Departament_Destino_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Secuencias]    Script Date: 19/04/2021 04:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Secuencias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Secuencias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 19/04/2021 04:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](max) NOT NULL,
	[Apellidos] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Cargo] [nvarchar](max) NOT NULL,
	[Departamento_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Departaments] ON 

INSERT [dbo].[Departaments] ([Id], [Nombre], [Siglas]) VALUES (1, N'DEFAULT', N'DEFAULT')
SET IDENTITY_INSERT [dbo].[Departaments] OFF
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Documents_dbo.Departaments_Departament_Destino_Id] FOREIGN KEY([Departament_Destino_Id])
REFERENCES [dbo].[Departaments] ([Id])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_dbo.Documents_dbo.Departaments_Departament_Destino_Id]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Documents_dbo.Departaments_Departament_Origen_Id] FOREIGN KEY([Departament_Origen_Id])
REFERENCES [dbo].[Departaments] ([Id])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_dbo.Documents_dbo.Departaments_Departament_Origen_Id]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Documents_dbo.Users_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_dbo.Documents_dbo.Users_User_Id]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Departaments_Departamento_Id] FOREIGN KEY([Departamento_Id])
REFERENCES [dbo].[Departaments] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Departaments_Departamento_Id]
GO
