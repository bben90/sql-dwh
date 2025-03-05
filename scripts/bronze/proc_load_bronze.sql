/*
=====================================================================
Stored Procedure : Load Bronze layer ( Source -> Bronze)
=====================================================================

Script Purpose"
  This stored procedure loads data into the 'bronze' schema from external CSV files.

*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		PRINT '=====================================================';
		PRINT 'LOADING CRM TABLE';
		PRINT '=====================================================';

	 
		TRUNCATE TABLE [bronze].[crm_cust_info]

		PRINT '>> INSERTING TABLE : [bronze].[crm_cust_info]';
		BULK INSERT [bronze].[crm_cust_info]
		FROM 'C:\Documents\DataWarehouse - SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		 

		PRINT '=====================================================';

 		PRINT '>> TRUNCATING TABLE : bronze.crm_prd_info';
		TRUNCATE TABLE [bronze].[crm_prd_info]

		PRINT '>> INSERTING TABLE : bronze.crm_prd_info';
		BULK INSERT [bronze].[crm_prd_info]
		FROM 'C:\Documents\DataWarehouse - SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT '>> TRUNCATING TABLE : bronze.[crm_sales_details]';
		TRUNCATE TABLE [bronze].[crm_sales_details]

		PRINT '>> INSERTING TABLE : bronze.[crm_sales_details]';
		BULK INSERT [bronze].[crm_sales_details]
		FROM 'C:\Documents\DataWarehouse - SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT '=====================================================';
		PRINT 'LOADING ERP TABLE';
		PRINT '=====================================================';

		PRINT '>> TRUNCATING TABLE : bronze.[[erp_cust_az12]]';
		TRUNCATE TABLE [bronze].[erp_cust_az12]

		PRINT '>> INSERTING TABLE : bronze.[[erp_cust_az12]]';
		BULK INSERT [bronze].[erp_cust_az12]
		FROM 'C:\DataWarehouse - SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT '>> TRUNCATING TABLE : bronze.[erp_loc_a101]';
		TRUNCATE TABLE  [bronze].[erp_loc_a101]

		PRINT '>> INSERTING TABLE : bronze.[erp_loc_a101]';
		BULK INSERT  [bronze].[erp_loc_a101]
		FROM 'C:\DataWarehouse - SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT '>> TRUNCATING TABLE : bronze.[erp_px_cat_g1v2]';
		TRUNCATE TABLE  [bronze].[erp_px_cat_g1v2]

		PRINT '>> INSERTING TABLE : bronze.[erp_px_cat_g1v2]';
		BULK INSERT  [bronze].[erp_px_cat_g1v2]
		FROM 'C:\DataWarehouse - SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		END TRY
		BEGIN CATCH
		END CATCH

END
