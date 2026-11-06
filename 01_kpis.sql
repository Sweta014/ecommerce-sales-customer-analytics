-- E-Commerce Sales & Customer Analytics
-- 01 - Core Business KPIs


-- 1. Total Revenue

SELECT
    SUM(Revenue) AS Total_Revenue
FROM sales;


-- 2. Total Units Sold

SELECT
    SUM(Quantity) AS Total_Units_Sold
FROM sales;


-- 3. Total Orders

SELECT
    COUNT(DISTINCT Invoice) AS Total_Orders
FROM sales;


-- 4. Average Order Value (AOV)

SELECT
    SUM(Revenue) / COUNT(DISTINCT Invoice) AS Average_Order_Value
FROM sales;


-- 5. Unique Identifiable Customers

SELECT
    COUNT(DISTINCT `Customer ID`) AS Unique_Customers
FROM sales
WHERE `Customer ID` <> 0;


-- 6. Unique Merchandise Products

SELECT
    COUNT(DISTINCT StockCode) AS Unique_Products
FROM sales
WHERE StockCode NOT IN (
    'M', 'm',
    'POST',
    'DOT',
    'AMAZONFEE',
    'BANK CHARGES',
    'ADJUST',
    'ADJUST2',
    'D',
    'S',
    'TEST001',
    'TEST002'
);