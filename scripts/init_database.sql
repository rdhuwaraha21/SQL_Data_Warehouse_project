/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named DataWarehouse and sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
*/
USE master;
GO
-- Create the 'DataWarehouse3' database
CREATE DATABASE DataWarehouse3;
GO

USE DataWarehouse3;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
