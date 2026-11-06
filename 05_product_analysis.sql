-- E-Commerce Sales & Customer Analytics
-- 05 - Product Analysis


-- 1. Top Products by Revenue

SELECT
    StockCode,
    Description,
    SUM(Revenue) AS Total_Revenue
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
)
GROUP BY StockCode, Description
ORDER BY Total_Revenue DESC
LIMIT 10;


-- 2. Top Products by Units Sold

SELECT
    StockCode,
    Description,
    SUM(Quantity) AS Units_Sold
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
)
GROUP BY StockCode, Description
ORDER BY Units_Sold DESC
LIMIT 10;


-- 3. Top Products by Number of Orders

SELECT
    StockCode,
    Description,
    COUNT(DISTINCT Invoice) AS Total_Orders
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
)
GROUP BY StockCode, Description
ORDER BY Total_Orders DESC
LIMIT 10;


-- 4. Average Selling Price by Product
-- Products with fewer than 100 units are excluded
-- to avoid results dominated by very small sales volumes.

SELECT
    StockCode,
    Description,
    SUM(Revenue) / SUM(Quantity) AS Avg_Selling_Price
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
)
GROUP BY StockCode, Description
HAVING SUM(Quantity) >= 100
ORDER BY Avg_Selling_Price DESC
LIMIT 10;