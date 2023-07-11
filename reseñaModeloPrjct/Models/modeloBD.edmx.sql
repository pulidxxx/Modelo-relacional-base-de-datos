
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/10/2023 00:57:20
-- Generated from EDMX file: C:\Users\HP\Downloads\reseñaModeloSln\reseñaModeloPrjct\Models\modeloBD.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SistemaDeCriticaBD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UsuarioReseña]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reseña] DROP CONSTRAINT [FK_UsuarioReseña];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioNoticias]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Noticias] DROP CONSTRAINT [FK_UsuarioNoticias];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioComentario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ComentarioSet] DROP CONSTRAINT [FK_UsuarioComentario];
GO
IF OBJECT_ID(N'[dbo].[FK_ReseñaComentario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ComentarioSet] DROP CONSTRAINT [FK_ReseñaComentario];
GO
IF OBJECT_ID(N'[dbo].[FK_ReseñaCategoria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reseña] DROP CONSTRAINT [FK_ReseñaCategoria];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO
IF OBJECT_ID(N'[dbo].[Reseña]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reseña];
GO
IF OBJECT_ID(N'[dbo].[Noticias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Noticias];
GO
IF OBJECT_ID(N'[dbo].[ComentarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ComentarioSet];
GO
IF OBJECT_ID(N'[dbo].[Categoria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categoria];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre_usuario] nvarchar(max)  NOT NULL,
    [contraseña_usuario] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Reseña'
CREATE TABLE [dbo].[Reseña] (
    [IdReseña] int IDENTITY(1,1) NOT NULL,
    [titulo_reseña] nvarchar(max)  NOT NULL,
    [contenido_reseña] nvarchar(max)  NOT NULL,
    [puntuacion_reseña] decimal(18,0)  NULL,
    [fecha_reseña] datetime  NOT NULL,
    [UsuarioId] int  NOT NULL,
    [Categoria_IdCategoria] int  NOT NULL
);
GO

-- Creating table 'Noticias'
CREATE TABLE [dbo].[Noticias] (
    [IdNoticias] int IDENTITY(1,1) NOT NULL,
    [titular_noticia] nvarchar(max)  NOT NULL,
    [fecha_noticia] datetime  NOT NULL,
    [contenido_noticia] nvarchar(max)  NOT NULL,
    [UsuarioId] int  NOT NULL
);
GO

-- Creating table 'ComentarioSet'
CREATE TABLE [dbo].[ComentarioSet] (
    [IdComentario] int IDENTITY(1,1) NOT NULL,
    [contenido_comentario] nvarchar(max)  NOT NULL,
    [UsuarioId] int  NOT NULL,
    [ReseñaIdReseña] int  NOT NULL
);
GO

-- Creating table 'Categoria'
CREATE TABLE [dbo].[Categoria] (
    [IdCategoria] int IDENTITY(1,1) NOT NULL,
    [nombre_categoria] nvarchar(max)  NOT NULL,
    [descripcion_categoria] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [IdReseña] in table 'Reseña'
ALTER TABLE [dbo].[Reseña]
ADD CONSTRAINT [PK_Reseña]
    PRIMARY KEY CLUSTERED ([IdReseña] ASC);
GO

-- Creating primary key on [IdNoticias] in table 'Noticias'
ALTER TABLE [dbo].[Noticias]
ADD CONSTRAINT [PK_Noticias]
    PRIMARY KEY CLUSTERED ([IdNoticias] ASC);
GO

-- Creating primary key on [IdComentario] in table 'ComentarioSet'
ALTER TABLE [dbo].[ComentarioSet]
ADD CONSTRAINT [PK_ComentarioSet]
    PRIMARY KEY CLUSTERED ([IdComentario] ASC);
GO

-- Creating primary key on [IdCategoria] in table 'Categoria'
ALTER TABLE [dbo].[Categoria]
ADD CONSTRAINT [PK_Categoria]
    PRIMARY KEY CLUSTERED ([IdCategoria] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UsuarioId] in table 'Reseña'
ALTER TABLE [dbo].[Reseña]
ADD CONSTRAINT [FK_UsuarioReseña]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioReseña'
CREATE INDEX [IX_FK_UsuarioReseña]
ON [dbo].[Reseña]
    ([UsuarioId]);
GO

-- Creating foreign key on [UsuarioId] in table 'Noticias'
ALTER TABLE [dbo].[Noticias]
ADD CONSTRAINT [FK_UsuarioNoticias]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioNoticias'
CREATE INDEX [IX_FK_UsuarioNoticias]
ON [dbo].[Noticias]
    ([UsuarioId]);
GO

-- Creating foreign key on [UsuarioId] in table 'ComentarioSet'
ALTER TABLE [dbo].[ComentarioSet]
ADD CONSTRAINT [FK_UsuarioComentario]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioComentario'
CREATE INDEX [IX_FK_UsuarioComentario]
ON [dbo].[ComentarioSet]
    ([UsuarioId]);
GO

-- Creating foreign key on [ReseñaIdReseña] in table 'ComentarioSet'
ALTER TABLE [dbo].[ComentarioSet]
ADD CONSTRAINT [FK_ReseñaComentario]
    FOREIGN KEY ([ReseñaIdReseña])
    REFERENCES [dbo].[Reseña]
        ([IdReseña])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReseñaComentario'
CREATE INDEX [IX_FK_ReseñaComentario]
ON [dbo].[ComentarioSet]
    ([ReseñaIdReseña]);
GO

-- Creating foreign key on [Categoria_IdCategoria] in table 'Reseña'
ALTER TABLE [dbo].[Reseña]
ADD CONSTRAINT [FK_ReseñaCategoria]
    FOREIGN KEY ([Categoria_IdCategoria])
    REFERENCES [dbo].[Categoria]
        ([IdCategoria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReseñaCategoria'
CREATE INDEX [IX_FK_ReseñaCategoria]
ON [dbo].[Reseña]
    ([Categoria_IdCategoria]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------