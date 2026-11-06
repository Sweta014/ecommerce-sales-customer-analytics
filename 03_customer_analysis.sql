-- E-Commerce Sales & Customer Analytics
-- 03 - Customer Analysis


-- 1. Total Orders per Customer

SELECT
    `Customer ID`,
    COUNT(DISTINCT Invoice) AS Total_Orders
FROM sales
WHERE `Customer ID` <> 0
GROUP BY `Customer ID`
ORDER BY Total_Orders DESC
LIMIT 10;


-- 2. Customer Revenue

SELECT
    `Customer ID`,
    SUM(Revenue) AS Total_Revenue
FROM sales
WHERE `Customer ID` <> 0
GROUP BY `Customer ID`
ORDER BY Total_Revenue DESC
LIMIT 10;


-- 3. Customer Average Order Value

SELECT
    `Customer ID`,
    SUM(Revenue) AS Total_Revenue,
    COUNT(DISTINCT Invoice) AS Total_Orders,
    SUM(Revenue) / COUNT(DISTINCT Invoice) AS Customer_AOV
FROM sales
WHERE `Customer ID` <> 0
GROUP BY `Customer ID`
ORDER BY Customer_AOV DESC
LIMIT 10;


-- 4. Repeat vs One-Time Customers

SELECT
    CASE
        WHEN Total_Orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS Customer_Type,
    COUNT(*) AS Customer_Count
FROM (
    SELECT
        `Customer ID`,
        COUNT(DISTINCT Invoice) AS Total_Orders
    FROM sales
    WHERE `Customer ID` <> 0
    GROUP BY `Customer ID`
) AS customer_orders
GROUP BY
    CASE
        WHEN Total_Orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END;