/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.
    - Summary of Bronze Layer Stored Procedure Improvements
        - Enhanced Logging & Status Updates
        - Added `PRINT` statements at each major step.
        - Time Tracking (Captures the full batch & table duration.)
        - Error Handling (Utilizes `TRY...CATCH` blocks to log any issues.)
          
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/


EXEC bronze.load_bronze;

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	
	DECLARE @start_time DATETIME, @end_time DATETIME , @batch_start_time DATETIME , @batch_end_time DATETIME;
	
	BEGIN TRY

    	SET @batch_start_time =  GETDATE();
    
    		PRINT '================================================';
    		PRINT 'Loading Bronze Layer';
    		PRINT '================================================';
    
    		PRINT '------------------------------------------------';
    		PRINT 'Loading CRM Tables';
    		PRINT '------------------------------------------------';
    
    		SET @start_time = GETDATE();
    
    		-- Load CRM Customer Information
    		PRINT '>> Truncating Table: bronze.crm_cst_info';
    		TRUNCATE TABLE bronze.crm_cst_info;  
    		PRINT '>> Inserting Data Into: bronze.crm_cst_info';
    		BULK INSERT bronze.crm_cst_info  
    		FROM 'C:\Users\parth\AppData\Local\Temp\5183bad4-18bb-42a6-922c-3ea35cf9a0d2_sql-data-warehouse-project.zip.0d2\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			TABLOCK
    		);
    		SET @end_time = GETDATE();
    		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
    		PRINT '====================================='
    
    		SET @start_time = GETDATE();
    		-- Load CRM Product Information
    		PRINT '>> Truncating Table: bronze.crm_prd_info';
    		TRUNCATE TABLE bronze.crm_prd_info;
    		PRINT '>> Inserting Data Into: bronze.crm_prd_info';
    		BULK INSERT bronze.crm_prd_info  
    		FROM 'C:\Users\parth\AppData\Local\Temp\6bb78518-e866-465f-9b15-7b7e4a8bcbb2_sql-data-warehouse-project.zip.bb2\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			TABLOCK
    		);
    		SET @end_time = GETDATE();
    		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
    		PRINT '====================================='
    
    		SET @start_time = GETDATE();
    		-- Load CRM Sales Details
    		PRINT '>> Truncating Table: bronze.crm_sales_details';
    		TRUNCATE TABLE bronze.crm_sales_details;
    		PRINT '>> Inserting Data Into: bronze.crm_sales_details';
    		BULK INSERT bronze.crm_sales_details  
    		FROM 'C:\Users\parth\AppData\Local\Temp\e5c9d950-7fdd-4cfa-b2ed-bc1f78949ad4_sql-data-warehouse-project.zip.ad4\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			TABLOCK
    		);
    		SET @end_time = GETDATE();
    		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
    		PRINT '====================================='
    
    		PRINT '------------------------------------------------';
    		PRINT 'Loading ERP Tables';
    		PRINT '------------------------------------------------';
    		SET @start_time = GETDATE();
    		-- Load ERP Customer Data
    		PRINT '>> Truncating Table: bronze.erp_cust_az12';
    		TRUNCATE TABLE bronze.erp_cust_az12;
    		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';  
    		BULK INSERT bronze.erp_cust_az12  
    		FROM 'C:\Users\parth\AppData\Local\Temp\70ba90ee-bd4e-4e2b-8edd-277bf75eaa56_sql-data-warehouse-project.zip.a56\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			TABLOCK
    		);
    		SET @end_time = GETDATE();
    		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
    		PRINT '====================================='
    
    		SET @start_time = GETDATE();
    		-- Load ERP Location Data
    		PRINT '>> Truncating Table: bronze.erp_loc_a101';
    		TRUNCATE TABLE bronze.erp_loc_a101;
    		PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
    		BULK INSERT bronze.erp_loc_a101  
    		FROM 'C:\Users\parth\AppData\Local\Temp\2a7cffb2-8b71-49e9-8bb1-9c2a65133003_sql-data-warehouse-project.zip.003\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			TABLOCK
    		);
    		SET @end_time = GETDATE();
    		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
    		PRINT '====================================='
    
    		SET @start_time = GETDATE();
    		-- Load ERP Product Category Data
    		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
    		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';  
    		BULK INSERT bronze.erp_px_cat_g1v2  
    		FROM 'C:\Users\parth\AppData\Local\Temp\b0e5bd28-0fd5-4245-9365-582b89ca4d50_sql-data-warehouse-project.zip.d50\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			TABLOCK
    		);
    		SET @end_time = GETDATE();
    		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
    		PRINT '====================================='
    
    	SET @batch_end_time = GETDATE();

	PRINT '====================================='
	PRINT 'LOADING BRONZE LAYER IS COMPLETED'
	PRINT '>> Load Duration of whole batch: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds';
	PRINT '====================================='

	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH

	
END;
