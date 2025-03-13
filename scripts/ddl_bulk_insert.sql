/*
===============================================================================
Script: Loading the Data
===============================================================================
Script Purpose:
    This script truncates existing data in the  tables, 
    followed by a bulk insert operation to load new data from an external source.
    Use this script whenever  need to refresh or reload the data in the 'bronze' schema.
===============================================================================
*/

TRUNCATE TABLE bronze.crm_cst_info  
BULK INSERT bronze.crm_cst_info  
FROM 'C:\Users\parth\AppData\Local\Temp\5183bad4-18bb-42a6-922c-3ea35cf9a0d2_sql-data-warehouse-project.zip.0d2\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

TRUNCATE TABLE bronze.crm_prd_info
BULK INSERT bronze.crm_prd_info  
FROM 'C:\Users\parth\AppData\Local\Temp\6bb78518-e866-465f-9b15-7b7e4a8bcbb2_sql-data-warehouse-project.zip.bb2\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

TRUNCATE TABLE bronze.crm_sales_details  
BULK INSERT bronze.crm_sales_details  
FROM 'C:\Users\parth\AppData\Local\Temp\e5c9d950-7fdd-4cfa-b2ed-bc1f78949ad4_sql-data-warehouse-project.zip.ad4\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

TRUNCATE TABLE bronze.erp_cust_az12  
BULK INSERT bronze.erp_cust_az12  
FROM 'C:\Users\parth\AppData\Local\Temp\70ba90ee-bd4e-4e2b-8edd-277bf75eaa56_sql-data-warehouse-project.zip.a56\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

TRUNCATE TABLE bronze.erp_loc_a101  
BULK INSERT bronze.erp_loc_a101  
FROM 'C:\Users\parth\AppData\Local\Temp\2a7cffb2-8b71-49e9-8bb1-9c2a65133003_sql-data-warehouse-project.zip.003\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

TRUNCATE TABLE bronze.erp_px_cat_g1v2  
BULK INSERT bronze.erp_px_cat_g1v2  
FROM 'C:\Users\parth\AppData\Local\Temp\b0e5bd28-0fd5-4245-9365-582b89ca4d50_sql-data-warehouse-project.zip.d50\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO
