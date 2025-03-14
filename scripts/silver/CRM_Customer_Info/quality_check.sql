-- check for nulle or duplicates in primary key--
SELECT cst_id, COUNT(*) 
FROM silver.crm_cst_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

--Check unwanted spaces -- check first & last names
SELECT cst_firstname
FROM silver.crm_cst_info
WHERE cst_firstname != TRIM(cst_firstname) 

-- Check the consistency of values is low cardinality columns 
SELECT DISTINCT cst_gndr
FROM silver.crm_cst_info

SELECT DISTINCT cst_marital_status
FROM silver.crm_cst_info

