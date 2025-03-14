/*cid*/
SELECT
			CASE
					WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4,LEN (cid))
					ELSE cid
			END AS cid,
FROM bronze.erp_cust_az12

/*bdate*/
-- Identify Out-of-Range Dates
SELECT DISTINCT
 CASE WHEN bdate > GETDATE() THEN NULL
      ELSE bdate
 END AS bdate
FROM bronze.erp_cust_az12

/*gen*/
-- Data Standardization & Consistency
SELECT DISTINCT
    CASE 
        WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
        WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
        ELSE 'n/a'
    END AS gen
FROM bronze.erp_cust_az12
