/*Date transformation */
select 
    CASE 
        WHEN sls_order_dt = O OR LEN(sls_order_dt) != 8 THEN NULL
        ELSE CAST(CAST(sls_order_dt AS VARCHAR) AS DATE)
    END AS sls_order_dt,
    CASE 
        WHEN sls_ship_dt = O OR LEN(sls_ship_dt) != 8 THEN NULL
        ELSE CAST(CAST(sls_ship_dt AS VARCHAR) AS DATE)
    END AS sls_ship_dt,
    CASE 
        WHEN sls_due_dt = 0 OR LEN(sls_due_dt) != 8 THEN NULL
        ELSE CAST(CAST(sls_due_dt AS VARCHAR) AS DATE)
    END AS sls_due_dt, 
from bronze.crm_sales_details

/*Sales, qty, price */
select
CASE 
		WHEN sls_sales is null or sls_sales <=0 or sls_sales != sls_quantity * abs(sls_price)
				THEN sls_quantity * abs(sls_price)
		ELSE sls_sales
	END AS sls_sales,
	sls_quantity,
	CASE 
		WHEN sls_price is null or sls_price <=0 
				THEN sls_sales / nullif (sls_quantity,0)
		ELSE sls_sales
	END AS sls_price
FROM bronze.crm_sales_details
