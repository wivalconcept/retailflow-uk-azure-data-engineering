
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Bronze
-- View: bronze.vw_customers_raw
-- Purpose: Read raw customer CSV data from Azure Storage
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW bronze.vw_customers_raw
AS
SELECT *
FROM OPENROWSET(
    BULK 'https://detraining2026.blob.core.windows.net/retailflow/bronze/customers/*.csv',
    FORMAT = 'CSV',
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE
) AS customers;
