
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Silver
-- View: silver.vw_orders_business_quality
-- Purpose: Classify orders by business quality and
--          determine reporting eligibility
-- Source: silver.vw_orders_integrity
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW silver.vw_orders_business_quality
AS
SELECT
    o.*,

    CASE
        WHEN o.sales_channel IS NULL
            THEN 'Missing Sales Channel'
        ELSE 'Valid Sales Channel'
    END AS channel_quality,

    CASE
        WHEN o.order_status = 'COMPLETED'
            THEN 'Completed Sale'

        WHEN o.order_status = 'CANCELLED'
            THEN 'Cancelled Order'

        WHEN o.order_status = 'RETURNED'
            THEN 'Returned Order'

        ELSE 'Unknown Status'
    END AS business_status,

    CASE
        WHEN o.integrity_status = 'Matched'
             AND o.sales_channel IS NOT NULL
             AND o.order_status = 'COMPLETED'
            THEN 'Reporting Ready'

        ELSE 'Requires Review'
    END AS reporting_status

FROM silver.vw_orders_integrity AS o;
