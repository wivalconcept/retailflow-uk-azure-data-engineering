
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Gold
-- View: gold.vw_sales_by_channel
-- Purpose: Analyse sales performance by retail channel
-- Source: silver.vw_orders_business_quality
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW gold.vw_sales_by_channel
AS
SELECT
    sales_channel AS SalesChannel,

    COUNT(*) AS TotalOrders,

    SUM(quantity) AS TotalUnitsSold,

    CAST(
        SUM(total_amount_gbp)
        AS DECIMAL(18,2)
    ) AS TotalSalesGBP,

    CAST(
        AVG(total_amount_gbp)
        AS DECIMAL(18,2)
    ) AS AverageOrderValueGBP

FROM silver.vw_orders_business_quality

WHERE reporting_status = 'Reporting Ready'
  AND order_status = 'COMPLETED'

GROUP BY sales_channel;
