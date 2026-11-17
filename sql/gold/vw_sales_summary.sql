
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Gold
-- View: gold.vw_sales_summary
-- Purpose: Calculate overall retail sales performance KPIs
-- Source: silver.vw_orders_business_quality
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW gold.vw_sales_summary
AS
SELECT
    COUNT(*) AS TotalOrders,

    CAST(
        SUM(total_amount_gbp)
        AS DECIMAL(18,2)
    ) AS TotalSalesGBP,

    CAST(
        AVG(total_amount_gbp)
        AS DECIMAL(18,2)
    ) AS AverageOrderValueGBP,

    SUM(quantity) AS TotalUnitsSold

FROM silver.vw_orders_business_quality

WHERE reporting_status = 'Reporting Ready'
  AND order_status = 'COMPLETED';
