
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Gold
-- View: gold.vw_monthly_sales
-- Purpose: Aggregate monthly retail sales performance
-- Source: silver.vw_orders_business_quality
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW gold.vw_monthly_sales
AS
SELECT
    YEAR(order_date) AS SalesYear,
    MONTH(order_date) AS SalesMonth,

    COUNT(*) AS TotalOrders,

    SUM(quantity) AS TotalUnitsSold,

    CAST(
        SUM(total_amount_gbp)
        AS DECIMAL(18,2)
    ) AS TotalSalesGBP

FROM silver.vw_orders_business_quality

WHERE reporting_status = 'Reporting Ready'
  AND order_status = 'COMPLETED'

GROUP BY
    YEAR(order_date),
    MONTH(order_date);
