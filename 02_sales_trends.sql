-- E-Commerce Sales & Customer Analytics
-- 02 - Sales Trends


-- 1. Monthly Revenue

SELECT
    Month,
    SUM(Revenue) AS Monthly_Revenue
FROM sales
GROUP BY Month
ORDER BY Month;


-- 2. Monthly Orders

SELECT
    Month,
    COUNT(DISTINCT Invoice) AS Monthly_Orders
FROM sales
GROUP BY Month
ORDER BY Month;


-- 3. Monthly Average Order Value (AOV)

SELECT
    Month,
    SUM(Revenue) / COUNT(DISTINCT Invoice) AS Monthly_AOV
FROM sales
GROUP BY Month
ORDER BY Month;


-- 4. Yearly Revenue

SELECT
    Year,
    SUM(Revenue) AS Yearly_Revenue
FROM sales
GROUP BY Year
ORDER BY Year;


-- 5. Revenue Change: 2010 vs 2011

SELECT
    (
        SUM(CASE WHEN Year = 2011 THEN Revenue ELSE 0 END)
        -
        SUM(CASE WHEN Year = 2010 THEN Revenue ELSE 0 END)
    )
    /
    SUM(CASE WHEN Year = 2010 THEN Revenue ELSE 0 END)
    * 100 AS Revenue_Change_Percentage
FROM sales;