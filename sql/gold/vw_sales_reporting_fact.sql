
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Gold
-- View: gold.vw_sales_reporting_fact
-- Purpose: Provide reporting-ready sales transactions
-- Source: silver.vw_orders_business_quality
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW gold.vw_sales_reporting_fact
AS
SELECT *
FROM silver.vw_orders_business_quality
WHERE reporting_status = 'Reporting Ready';
