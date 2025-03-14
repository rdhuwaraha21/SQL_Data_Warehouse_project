/*cid*/
SELECT 
    cid, 
    cntry 
FROM bronze.erp_loc_a101;

SELECT cst_key FROM silver.crm_cust_info;

/*cntry*/
-- Data Standardization & Consistency
SELECT DISTINCT cntry
FROM bronze.erp_loc_a101
ORDER BY cntry;

