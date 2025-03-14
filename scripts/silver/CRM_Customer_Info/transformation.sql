/* NULLS OR DUPLICATES IN PRIMARY KEY*/

-- Check for NULL or DUPLICATE
SELECT cst_id, COUNT(*) 
FROM bronze.crm_cst_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

--Finding the rows to be kept
SELECT * 
FROM bronze.crm_cst_info
WHERE cst_id IS 29466

-- ROW_NUMBER( ) - assigns unique number to each row in a result set, based on a defined order
SELECT * ,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last --check--
FROM bronze.crm_cst_info
WHERE cst_id = 29466

SELECT *
FROM(
SELECT * ,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
FROM bronze.crm_cst_info    
)t WHERE flag_last = 1  

/*UNWANTED SPACES IN STRINGS*/
  
SELECT cst_id,
cst_key,
TRIM (cst_firstname) AS cst_firstname,
TRIM (cst_lastname) AS cst_firstname,
cst_material_status,
cst_gndr,
cst_create_date
FROM bronze.crm_cst_info
WHERE cst_firstname != TRIM(cst_firstname)

 /*  CONSISTENCY OF VALUES IN LOW CARDINALITY COLUMNS */

-- Keep full names not Abbrevations
--UPPER() Incase of mixed values

-- Gender
SELECT 
CASE WHEN UPPER (TRIM(cst_gndr)) = 'F' THEN 'FEMALE'
		 WHEN UPPER (TRIM(cst_gndr)) = 'M' THEN 'MALE'
		 ELSE 'n/a'
END cst_gndr
FROM bronze.crm_cst_info

-- Marital Status
SELECT 
CASE WHEN UPPER (TRIM(cst_material_status)) = 'S' THEN 'SINGLE'
		 WHEN UPPER (TRIM(cst_material_status)) = 'M' THEN 'MARRIED'
		 ELSE 'n/a'
END cst_material_status
FROM bronze.crm_cst_info


/* Date column - in DATE type no transformation needed */











