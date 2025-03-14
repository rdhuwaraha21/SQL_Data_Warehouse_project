/* Derived column - SUBSTRING( )   */
SELECT 
REPLACE (SUBSTRING(prd_key, 1, 5), '-', '_') AS cat_id,
SUBSTRING(prd_key, 7, LEN(prd_key)) AS prd_key,
FROM bronze.crm_prd_info 

/* prd_cost - replace null with  ISNULL( )  */
SELECT 
ISNULL(prd_cost,0) AS prd_cost,
FROM bronze.crm_prd_info 

/* prd_cost - replace null with  ISNULL( )  */
SELECT
CASE
		WHEN UPPER (TRIM(prd_line)) = 'M' THEN 'Mountain'
		WHEN UPPER (TRIM(prd_line)) = 'R' THEN 'Road'
		WHEN UPPER (TRIM(prd_line)) = 'S' THEN 'Other Sales'
		WHEN UPPER (TRIM(prd_line)) = 'T' THEN 'Touring'
		ELSE 'n/a'
	END AS prd_line,
FROM bronze.crm_prd_info 

/* 1. change the datetime to date
Row changing from the start date and  adding another end column & -1  */
select
CAST (prd_start_dt AS DATE) AS prd_start_dt,
CAST (LEAD (prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)-1 AS DATE) AS prd_end_dt
FROM bronze.crm_prd_info
