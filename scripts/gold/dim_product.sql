/*Left Join*/
SELECT 
    ci.cst_id, 
    ci.cst_key, 
    ci.cst_firstname, 
    ci.cst_lastname, 
    ci.cst_material_status, 
    ci.cst_gndr, 
    ci.cst_create_date,
	ca.bdate,
	ca.gen,
	la.cntry
FROM silver.crm_cst_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON        ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON        ci.cst_key = la.cid

/*Check with duplicates*/
SELECT cst_id, COUNT(*) FROM
(SELECT 
    ci.cst_id, 
    ci.cst_key, 
    ci.cst_firstname, 
    ci.cst_lastname, 
    ci.cst_material_status, 
    ci.cst_gndr, 
    ci.cst_create_date,
	ca.bdate,
	ca.gen,
	la.cntry
FROM silver.crm_cst_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON        ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON        ci.cst_key = la.cid
)t
GROUP BY cst_id
HAVING COUNT (*) >1

/*DATA Integration - fixed 2 gender columns*/
SELECT DISTINCT
    ci.cst_gndr,
    ca.gen,  
    CASE 
        WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr -- CRM is the Master for gender Info
        ELSE COALESCE(ca.gen, 'n/a')
    END AS new_gen
FROM silver.crm_cst_info ci
LEFT JOIN silver.erp_cust_az12 ca 
    ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la 
    ON ci.cst_key = la.cid
ORDER BY 1, 2;
