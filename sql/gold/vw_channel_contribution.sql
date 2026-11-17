
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Gold
-- View: gold.vw_channel_contribution
-- Purpose: Calculate each sales channel's percentage
--          contribution to total sales revenue
-- Source: gold.vw_sales_by_channel
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW gold.vw_channel_contribution
AS
SELECT
    SalesChannel,
    TotalOrders,
    TotalSalesGBP,

    CAST(
        100.0 * TotalSalesGBP /
        NULLIF(SUM(TotalSalesGBP) OVER (), 0)
        AS DECIMAL(5,2)
    ) AS SalesContributionPercent

FROM gold.vw_sales_by_channel;
