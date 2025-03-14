/* cid  */
SELECT
    cid,
    bdate,
    gen
FROM bronze.erp_cust_az12
WHERE cid LIKE '%AW00011000%'

/* bdate  */
-- Identify Out-of-Range Dates
SELECT DISTINCT
    bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

/* gen  */
-- Data Standardization & Consistency
SELECT DISTINCT gen
FROM bronze.erp_cust_az12
