/*
Create database and schemas
==========================

script purpose:
	This script create a new database names 'DataWarehouse' after checking if it exists. In case it exists, it is dropped and recreated. Additionally, the script sets up three schemas
	within the database: 'bronze', 'silver', 'gold'.


*/

USE master;

GO

--drop and recreate 'datawarehouse' database
IF EXISTS( SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;

GO

--create the datawarehouse database

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse
GO

--create schemas

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
