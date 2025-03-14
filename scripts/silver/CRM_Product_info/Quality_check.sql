/* Begining - bronze , after transformation - change to silver */

/* Null & Duplicate */
-- prd_id -- primary key
SELECT prd_id, COUNT(*) 
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- prd_cost
select prd_cost 
from bronze.crm_prd_info
where prd_cost < 0 or prd_cost is null

/* Unwanted spaces */
SELECT prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

/* Data standardization & consistency */
select distinct prd_line
from bronze.crm_prd_info

/* Date related (start_date & end_date) */
select * 
from bronze.crm_prd_info
where prd_end_dt < prd_start_dt
