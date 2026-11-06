# E-Commerce Sales & Customer Analytics

## 📌 Project Overview

I worked on this project to understand the sales performance of a UK-based online retailer. I used the online Retail II dataset and analysed sales, customers, products, and country-level performance. I used Python for cleaning and exploratory analysis, SQL to answer business questions, and Power BI to build an interactive five-page dashboard.

## Dataset

- Source: UCI Machine Learning Repository – Online Retail II
- Business: UK-based online retailer
- Data: Historical transaction records
- Original size: 1,067,371 rows and 8 columns
- Period: December 2009 to December 2011
- Dataset: https://archive.ics.uci.edu/dataset/502/online+retail+ii
- The figures above describe the original dataset, before cleaning.

## Tools & Technologies

- Python (Pandas): Used to inspect and clean the transaction data, create analysis fields, and explore sales and customer patterns.
- SQL: Used for sales summaries, product and country analysis, and customer analysis with joins, grouping, subqueries, and CTEs.
- Power BI: Used to create the five-page interactive dashboard.
- Microsoft Excel: Used for data inspection and preliminary analysis.

## Data Cleaning & Preparation

I prepared the transaction data in Python before carrying out the analysis.
The cleaning steps were:

1. Excluded invoices beginning with C, which the notebook identifies as cancellations.
2. Excluded invoices beginning with A, which the notebook identifies as accounting adjustments.
3. Removed records with zero or negative quantities.
4. Removed records with zero or negative prices.
5. Removed exact duplicate rows.
6. Created a Revenue field by multiplying Quantity by Price.
7. Both invoice prefixes were excluded so the analysis focused on valid sales transactions.

- Rows after cleaning: 1,007,912 (from 1,067,371 original rows).

- Customer IDs that were missing were retained for overall sales analysis. For customer-level analysis, records without a Customer ID were excluded because they could not be linked to an identifiable customer.

## SQL Analysis
I used SQL to answer questions such as:

- How much revenue, how many orders, and how many units were recorded?
- Which products performed best by revenue and quantity sold?
- Which countries generated the most revenue and orders?
- Which customers generated the most revenue?
- How did repeat customers compare with one-time customers?
- The queries used JOIN, GROUP BY, subqueries, and CTEs.

## Power BI Dashboard
I built an interactive dashboard with five pages:

- Sales Overview: Main KPIs, monthly revenue, leading products and countries, and a customer overview.
- Sales Performance: Monthly order trends, average order value, yearly revenue, and product sales volume.
- Customer Analysis: Repeat and one-time customers, order frequency, recency, and top customers by revenue.
- Product Performance: Product revenue, units sold, average selling price, and product comparisons.
- Geographical Analysis: Revenue and order comparisons by country, customer distribution, and international sales.
The report includes slicers for date, country, customer type, and product, where relevant to each page.

## Key Business Insights
The analysis highlighted the following results:

- Total revenue: Approximately £20.47 million.
- Total units sold: Approximately 11.2 million.
- Total orders: 40,076.
- Average order value: Approximately £510.67.
- Identifiable customers: 5,878.
- Repeat customers: Approximately 72.39% of identifiable customers.
- Average orders per customer: Approximately 6.29.
- Leading country by revenue: United Kingdom.
These figures are based on the cleaned sales data and the measures used in the project dashboard.

## Business Recommendations
Based on these findings, a retailer could consider:

- Customer retention: Use loyalty offers and relevant promotions to encourage further purchases.
- Order value: Test product bundles and cross-selling to encourage larger orders.
- Product planning: Use product sales trends to support stock and inventory decisions.
- International markets: Compare country-level performance to identify markets worth investigating further.
- Sales monitoring: Track monthly revenue and order patterns to support planning.

Project Files
The project repository can include the Power BI report, Python notebook, SQL queries, and dashboard screenshots. Add each file once it is ready to share.


## 📁 Project Structure

```text
ecommerce-sales-customer-analytics/
│
├── data/
├── sql/
├── python/
├── powerbi/
├── images/
└── README.md
