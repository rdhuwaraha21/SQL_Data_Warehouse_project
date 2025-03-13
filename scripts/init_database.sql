/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'OULD DataWarehouse'and sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
*/

--CREATE DATABASE
use master;
create database OULAD_DataWarehouse;
use OULAD_DataWarehouse;

--CREATE SCHEMAS
create schema bronze;
go
create schema silver;
go
create schema gold;
go
