
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Gold
-- View: gold.vw_sales_by_category
-- Purpose: Aggregate sales performance by product category
-- Source: gold.vw_product_performance_enriched
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW gold.vw_sales_by_category
AS
SELECT
    category AS ProductCategory,

    SUM(TotalOrders) AS TotalOrders,

    SUM(TotalUnitsSold) AS TotalUnitsSold,

    CAST(
        SUM(TotalSalesGBP)
        AS DECIMAL(18,2)
    ) AS TotalSalesGBP,

    CAST(
        SUM(TotalSalesGBP) /
        NULLIF(SUM(TotalOrders), 0)
        AS DECIMAL(18,2)
    ) AS AverageOrderValueGBP

FROM gold.vw_product_performance_enriched

GROUP BY category;
