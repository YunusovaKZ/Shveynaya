
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/05/2023 12:30:57
-- Generated from EDMX file: C:\Users\DNS\source\repos\Shveynaya\Shveynaya\Shveynaya.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Shveynaya];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_FabricStock_Unit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FabricStock] DROP CONSTRAINT [FK_FabricStock_Unit];
GO
IF OBJECT_ID(N'[dbo].[FK_FabricStock_Unit1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FabricStock] DROP CONSTRAINT [FK_FabricStock_Unit1];
GO
IF OBJECT_ID(N'[dbo].[FK_FurnitureStock_Furniture]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FurnitureStock] DROP CONSTRAINT [FK_FurnitureStock_Furniture];
GO
IF OBJECT_ID(N'[dbo].[FK_FurnitureStock_Unit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FurnitureStock] DROP CONSTRAINT [FK_FurnitureStock_Unit];
GO
IF OBJECT_ID(N'[dbo].[FK_FurnitureStock_Unit1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FurnitureStock] DROP CONSTRAINT [FK_FurnitureStock_Unit1];
GO
IF OBJECT_ID(N'[dbo].[FK_Order_OrderState]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_OrderState];
GO
IF OBJECT_ID(N'[dbo].[FK_Order_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_User];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderItem_Unit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItem] DROP CONSTRAINT [FK_OrderItem_Unit];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderItem_Unit1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItem] DROP CONSTRAINT [FK_OrderItem_Unit1];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderList_Fabric]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItem] DROP CONSTRAINT [FK_OrderList_Fabric];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderList_Furniture]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItem] DROP CONSTRAINT [FK_OrderList_Furniture];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderList_Order]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItem] DROP CONSTRAINT [FK_OrderList_Order];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderList_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItem] DROP CONSTRAINT [FK_OrderList_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Unit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Unit];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Unit1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Unit1];
GO
IF OBJECT_ID(N'[dbo].[FK_ScrapRule_Material]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScrapRule] DROP CONSTRAINT [FK_ScrapRule_Material];
GO
IF OBJECT_ID(N'[dbo].[FK_Stock_Material]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FabricStock] DROP CONSTRAINT [FK_Stock_Material];
GO
IF OBJECT_ID(N'[dbo].[FK_UnitConvert_Unit1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UnitConvert] DROP CONSTRAINT [FK_UnitConvert_Unit1];
GO
IF OBJECT_ID(N'[dbo].[FK_UnitConvert_Unit2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UnitConvert] DROP CONSTRAINT [FK_UnitConvert_Unit2];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Fabric]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Fabric];
GO
IF OBJECT_ID(N'[dbo].[FabricStock]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FabricStock];
GO
IF OBJECT_ID(N'[dbo].[Furniture]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Furniture];
GO
IF OBJECT_ID(N'[dbo].[FurnitureStock]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FurnitureStock];
GO
IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[OrderItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderItem];
GO
IF OBJECT_ID(N'[dbo].[OrderState]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderState];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[ScrapRule]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ScrapRule];
GO
IF OBJECT_ID(N'[dbo].[Unit]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Unit];
GO
IF OBJECT_ID(N'[dbo].[UnitConvert]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UnitConvert];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Fabric'
CREATE TABLE [dbo].[Fabric] (
    [Id] varchar(50)  NOT NULL,
    [Name] varchar(50)  NULL,
    [Color] varchar(50)  NULL,
    [Pattern] varchar(50)  NULL,
    [Composition] varchar(50)  NULL
);
GO

-- Creating table 'FabricStock'
CREATE TABLE [dbo].[FabricStock] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdFabric] varchar(50)  NOT NULL,
    [Width] float  NULL,
    [Height] float  NULL,
    [IdUnitWidth] int  NULL,
    [IdUnitHeight] int  NULL,
    [PurchasePrice] float  NULL
);
GO

-- Creating table 'Furniture'
CREATE TABLE [dbo].[Furniture] (
    [Id] varchar(50)  NOT NULL,
    [Name] varchar(500)  NULL,
    [Type] varchar(100)  NULL,
    [PurchasePrice] float  NULL
);
GO

-- Creating table 'FurnitureStock'
CREATE TABLE [dbo].[FurnitureStock] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdFurniture] varchar(50)  NOT NULL,
    [Width] float  NULL,
    [IdUnitWidth] int  NULL,
    [Height] float  NULL,
    [IdUnitHeight] int  NULL,
    [PurchasePrice] float  NULL
);
GO

-- Creating table 'Order'
CREATE TABLE [dbo].[Order] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdUser] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [IdState] int  NOT NULL,
    [IdManager] int  NULL,
    [Price] float  NULL
);
GO

-- Creating table 'OrderItem'
CREATE TABLE [dbo].[OrderItem] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdOrder] int  NOT NULL,
    [IdProduct] varchar(50)  NOT NULL,
    [IdFabric] varchar(50)  NOT NULL,
    [IdFurniture] varchar(50)  NOT NULL,
    [IdBorder] varchar(50)  NOT NULL,
    [Width] float  NOT NULL,
    [Height] float  NOT NULL,
    [IdUnitWidth] int  NOT NULL,
    [IdUnitHeight] int  NOT NULL,
    [Price] float  NOT NULL,
    [RotationAngle] int  NOT NULL,
    [Amount] int  NOT NULL
);
GO

-- Creating table 'OrderState'
CREATE TABLE [dbo].[OrderState] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL
);
GO

-- Creating table 'Product'
CREATE TABLE [dbo].[Product] (
    [Id] varchar(50)  NOT NULL,
    [Description] varchar(1200)  NULL,
    [Name] varchar(100)  NULL,
    [Width] float  NULL,
    [Height] float  NULL,
    [IdUnitWidth] int  NULL,
    [IdUnitHeight] int  NULL
);
GO

-- Creating table 'Role'
CREATE TABLE [dbo].[Role] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL
);
GO

-- Creating table 'ScrapRule'
CREATE TABLE [dbo].[ScrapRule] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdMaterial] varchar(50)  NOT NULL,
    [IdUnit] int  NOT NULL,
    [Value] int  NOT NULL
);
GO

-- Creating table 'Unit'
CREATE TABLE [dbo].[Unit] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL
);
GO

-- Creating table 'UnitConvert'
CREATE TABLE [dbo].[UnitConvert] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdUnit1] int  NOT NULL,
    [IdUnit2] int  NOT NULL,
    [Ratio] float  NOT NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Login] varchar(50)  NOT NULL,
    [Password] varchar(50)  NOT NULL,
    [IdRole] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Fabric'
ALTER TABLE [dbo].[Fabric]
ADD CONSTRAINT [PK_Fabric]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FabricStock'
ALTER TABLE [dbo].[FabricStock]
ADD CONSTRAINT [PK_FabricStock]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Furniture'
ALTER TABLE [dbo].[Furniture]
ADD CONSTRAINT [PK_Furniture]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FurnitureStock'
ALTER TABLE [dbo].[FurnitureStock]
ADD CONSTRAINT [PK_FurnitureStock]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [PK_Order]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [PK_OrderItem]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderState'
ALTER TABLE [dbo].[OrderState]
ADD CONSTRAINT [PK_OrderState]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [PK_Product]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Role'
ALTER TABLE [dbo].[Role]
ADD CONSTRAINT [PK_Role]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ScrapRule'
ALTER TABLE [dbo].[ScrapRule]
ADD CONSTRAINT [PK_ScrapRule]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Unit'
ALTER TABLE [dbo].[Unit]
ADD CONSTRAINT [PK_Unit]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UnitConvert'
ALTER TABLE [dbo].[UnitConvert]
ADD CONSTRAINT [PK_UnitConvert]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IdFabric] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderList_Fabric]
    FOREIGN KEY ([IdFabric])
    REFERENCES [dbo].[Fabric]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderList_Fabric'
CREATE INDEX [IX_FK_OrderList_Fabric]
ON [dbo].[OrderItem]
    ([IdFabric]);
GO

-- Creating foreign key on [IdMaterial] in table 'ScrapRule'
ALTER TABLE [dbo].[ScrapRule]
ADD CONSTRAINT [FK_ScrapRule_Material]
    FOREIGN KEY ([IdMaterial])
    REFERENCES [dbo].[Fabric]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ScrapRule_Material'
CREATE INDEX [IX_FK_ScrapRule_Material]
ON [dbo].[ScrapRule]
    ([IdMaterial]);
GO

-- Creating foreign key on [IdFabric] in table 'FabricStock'
ALTER TABLE [dbo].[FabricStock]
ADD CONSTRAINT [FK_Stock_Material]
    FOREIGN KEY ([IdFabric])
    REFERENCES [dbo].[Fabric]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Stock_Material'
CREATE INDEX [IX_FK_Stock_Material]
ON [dbo].[FabricStock]
    ([IdFabric]);
GO

-- Creating foreign key on [IdUnitHeight] in table 'FabricStock'
ALTER TABLE [dbo].[FabricStock]
ADD CONSTRAINT [FK_FabricStock_Unit]
    FOREIGN KEY ([IdUnitHeight])
    REFERENCES [dbo].[Unit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FabricStock_Unit'
CREATE INDEX [IX_FK_FabricStock_Unit]
ON [dbo].[FabricStock]
    ([IdUnitHeight]);
GO

-- Creating foreign key on [IdUnitWidth] in table 'FabricStock'
ALTER TABLE [dbo].[FabricStock]
ADD CONSTRAINT [FK_FabricStock_Unit1]
    FOREIGN KEY ([IdUnitWidth])
    REFERENCES [dbo].[Unit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FabricStock_Unit1'
CREATE INDEX [IX_FK_FabricStock_Unit1]
ON [dbo].[FabricStock]
    ([IdUnitWidth]);
GO

-- Creating foreign key on [IdFurniture] in table 'FurnitureStock'
ALTER TABLE [dbo].[FurnitureStock]
ADD CONSTRAINT [FK_FurnitureStock_Furniture]
    FOREIGN KEY ([IdFurniture])
    REFERENCES [dbo].[Furniture]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FurnitureStock_Furniture'
CREATE INDEX [IX_FK_FurnitureStock_Furniture]
ON [dbo].[FurnitureStock]
    ([IdFurniture]);
GO

-- Creating foreign key on [IdFurniture] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderList_Furniture]
    FOREIGN KEY ([IdFurniture])
    REFERENCES [dbo].[Furniture]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderList_Furniture'
CREATE INDEX [IX_FK_OrderList_Furniture]
ON [dbo].[OrderItem]
    ([IdFurniture]);
GO

-- Creating foreign key on [IdUnitHeight] in table 'FurnitureStock'
ALTER TABLE [dbo].[FurnitureStock]
ADD CONSTRAINT [FK_FurnitureStock_Unit]
    FOREIGN KEY ([IdUnitHeight])
    REFERENCES [dbo].[Unit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FurnitureStock_Unit'
CREATE INDEX [IX_FK_FurnitureStock_Unit]
ON [dbo].[FurnitureStock]
    ([IdUnitHeight]);
GO

-- Creating foreign key on [IdUnitWidth] in table 'FurnitureStock'
ALTER TABLE [dbo].[FurnitureStock]
ADD CONSTRAINT [FK_FurnitureStock_Unit1]
    FOREIGN KEY ([IdUnitWidth])
    REFERENCES [dbo].[Unit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FurnitureStock_Unit1'
CREATE INDEX [IX_FK_FurnitureStock_Unit1]
ON [dbo].[FurnitureStock]
    ([IdUnitWidth]);
GO

-- Creating foreign key on [IdState] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [FK_Order_OrderState]
    FOREIGN KEY ([IdState])
    REFERENCES [dbo].[OrderState]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_OrderState'
CREATE INDEX [IX_FK_Order_OrderState]
ON [dbo].[Order]
    ([IdState]);
GO

-- Creating foreign key on [IdUser] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [FK_Order_User]
    FOREIGN KEY ([IdUser])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_User'
CREATE INDEX [IX_FK_Order_User]
ON [dbo].[Order]
    ([IdUser]);
GO

-- Creating foreign key on [IdOrder] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderList_Order]
    FOREIGN KEY ([IdOrder])
    REFERENCES [dbo].[Order]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderList_Order'
CREATE INDEX [IX_FK_OrderList_Order]
ON [dbo].[OrderItem]
    ([IdOrder]);
GO

-- Creating foreign key on [IdUnitHeight] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderItem_Unit]
    FOREIGN KEY ([IdUnitHeight])
    REFERENCES [dbo].[Unit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItem_Unit'
CREATE INDEX [IX_FK_OrderItem_Unit]
ON [dbo].[OrderItem]
    ([IdUnitHeight]);
GO

-- Creating foreign key on [IdUnitWidth] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderItem_Unit1]
    FOREIGN KEY ([IdUnitWidth])
    REFERENCES [dbo].[Unit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItem_Unit1'
CREATE INDEX [IX_FK_OrderItem_Unit1]
ON [dbo].[OrderItem]
    ([IdUnitWidth]);
GO

-- Creating foreign key on [IdProduct] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderList_Product]
    FOREIGN KEY ([IdProduct])
    REFERENCES [dbo].[Product]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderList_Product'
CREATE INDEX [IX_FK_OrderList_Product]
ON [dbo].[OrderItem]
    ([IdProduct]);
GO

-- Creating foreign key on [IdUnitWidth] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [FK_Product_Unit]
    FOREIGN KEY ([IdUnitWidth])
    REFERENCES [dbo].[Unit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Unit'
CREATE INDEX [IX_FK_Product_Unit]
ON [dbo].[Product]
    ([IdUnitWidth]);
GO

-- Creating foreign key on [IdUnitHeight] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [FK_Product_Unit1]
    FOREIGN KEY ([IdUnitHeight])
    REFERENCES [dbo].[Unit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Unit1'
CREATE INDEX [IX_FK_Product_Unit1]
ON [dbo].[Product]
    ([IdUnitHeight]);
GO

-- Creating foreign key on [IdRole] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [FK_User_Role]
    FOREIGN KEY ([IdRole])
    REFERENCES [dbo].[Role]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_User_Role'
CREATE INDEX [IX_FK_User_Role]
ON [dbo].[User]
    ([IdRole]);
GO

-- Creating foreign key on [IdUnit1] in table 'UnitConvert'
ALTER TABLE [dbo].[UnitConvert]
ADD CONSTRAINT [FK_UnitConvert_Unit1]
    FOREIGN KEY ([IdUnit1])
    REFERENCES [dbo].[Unit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UnitConvert_Unit1'
CREATE INDEX [IX_FK_UnitConvert_Unit1]
ON [dbo].[UnitConvert]
    ([IdUnit1]);
GO

-- Creating foreign key on [IdUnit2] in table 'UnitConvert'
ALTER TABLE [dbo].[UnitConvert]
ADD CONSTRAINT [FK_UnitConvert_Unit2]
    FOREIGN KEY ([IdUnit2])
    REFERENCES [dbo].[Unit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UnitConvert_Unit2'
CREATE INDEX [IX_FK_UnitConvert_Unit2]
ON [dbo].[UnitConvert]
    ([IdUnit2]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------