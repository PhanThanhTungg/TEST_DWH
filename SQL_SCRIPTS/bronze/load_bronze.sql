﻿CREATE OR ALTER PROCEDURE "bronze.load_bronze" AS
BEGIN
	DECLARE @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		TRUNCATE TABLE "bronze.crm_cust_info";
		BULK INSERT "bronze.crm_cust_info"
		FROM 'D:\tung\fourth_year_2\Data warehouse and mining\DWHTEST\DWHCode_test\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK -- khóa bảng để tăng tốc 
		);
		
		TRUNCATE TABLE "bronze.crm_prd_info";
		BULK INSERT "bronze.crm_prd_info"
		FROM 'D:\tung\fourth_year_2\Data warehouse and mining\DWHTEST\DWHCode_test\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		
		TRUNCATE TABLE "bronze.crm_sales_details";
		BULK INSERT "bronze.crm_sales_details"
		FROM 'D:\tung\fourth_year_2\Data warehouse and mining\DWHTEST\DWHCode_test\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		
		TRUNCATE TABLE "bronze.erp_loc_a101";
		BULK INSERT "bronze.erp_loc_a101"
		FROM 'D:\tung\fourth_year_2\Data warehouse and mining\DWHTEST\DWHCode_test\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		
		TRUNCATE TABLE "bronze.erp_cust_az12";
		BULK INSERT "bronze.erp_cust_az12"
		FROM 'D:\tung\fourth_year_2\Data warehouse and mining\DWHTEST\DWHCode_test\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		
		TRUNCATE TABLE "bronze.erp_px_cat_g1v2";
		BULK INSERT "bronze.erp_px_cat_g1v2"
		FROM 'D:\tung\fourth_year_2\Data warehouse and mining\DWHTEST\DWHCode_test\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	
		SET @batch_end_time = GETDATE();
        PRINT '- Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END

exec [bronze.load_bronze]
