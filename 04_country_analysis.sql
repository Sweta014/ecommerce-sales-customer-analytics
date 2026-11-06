-- E-Commerce Sales & Customer Analytics
-- 04 - Country Analysis


-- 1. Revenue and Orders by Country

SELECT
    Country,
    SUM(Revenue) AS Total_Revenue,
    COUNT(DISTINCT Invoice) AS Total_Orders
FROM sales
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;


-- 2. Revenue per Order by Country
-- Only countries with at least 20 orders are included
-- to avoid misleading results from very small markets.

SELECT
    Country,
    SUM(Revenue) AS Total_Revenue,
    COUNT(DISTINCT Invoice) AS Total_Orders,
    SUM(Revenue) / COUNT(DISTINCT Invoice) AS Revenue_Per_Order
FROM sales
GROUP BY Country
HAVING COUNT(DISTINCT Invoice) >= 20
ORDER BY Revenue_Per_Order DESC
LIMIT 10;