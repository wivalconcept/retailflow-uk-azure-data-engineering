
# RetailFlow UK — Architecture Diagram

```mermaid
flowchart TD
    A["Retail CSV Datasets<br/>Customers | Products | Orders"]
    B["Azure Data Lake Storage Gen2<br/>detraining2026 / retailflow"]

    subgraph S["Azure Synapse Analytics — Serverless SQL"]
        C["Bronze Layer<br/>3 Raw SQL Views"]
        D["Silver Layer<br/>8 Cleaning and Validation Views"]
        E["Gold Layer<br/>9 Business Analytics Views"]

        C --> D
        D --> E
    end

    F["Power BI Desktop<br/>Sales Overview | Product Performance"]

    A --> B
    B --> C
    E --> F
```

## Architecture Summary

RetailFlow UK uses Azure Data Lake Storage Gen2
for source data storage, Azure Synapse Analytics
Serverless SQL for data transformation, and
Power BI for business intelligence reporting.

The Medallion Architecture separates raw data
access, data quality processing and business
analytics into Bronze, Silver and Gold layers.
