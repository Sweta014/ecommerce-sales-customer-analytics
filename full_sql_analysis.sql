
use ecommerce_analytics;

select count(*) from sales;
select * from sales limit 10;

# total revenue
select sum(revenue) from sales;

# total orders
select count(distinct invoice) from sales;

# total units sold 
select sum(quantity) from sales;

 # average order value 
 select sum(revenue) / count(distinct invoice) as aov from sales;
 
 #unique customers
 SELECT COUNT(DISTINCT `Customer ID`) AS Unique_Customers
FROM sales;

# monthly revenue analysis
SELECT
    Month,
    SUM(Revenue) AS Monthly_Revenue
FROM sales
GROUP BY Month
ORDER BY Month;

#yearly revenue
SELECT
    Year,
    SUM(Revenue) AS Yearly_Revenue
FROM sales
GROUP BY Year
ORDER BY Year; 

#product analysis 
SELECT
    StockCode,
    Description,
    SUM(Revenue) AS Total_Revenue
FROM sales
GROUP BY StockCode, Description
ORDER BY Total_Revenue DESC
LIMIT 10;

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

#which prodcut sell the most units
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

# average selling price per product
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
ORDER BY Avg_Selling_Price DESC
LIMIT 10;

#customer analysis
SELECT
    `Customer ID`,
    SUM(Revenue) AS Total_Revenue
FROM sales
WHERE `Customer ID` <> 0
GROUP BY `Customer ID`
ORDER BY Total_Revenue DESC
LIMIT 10; 

# how many orders does each customer make
SELECT
    `Customer ID`,
    COUNT(DISTINCT Invoice) AS Total_Orders
FROM sales
WHERE `Customer ID` <> 0
GROUP BY `Customer ID`
ORDER BY Total_Orders DESC
LIMIT 10;

#average order value by customer
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

# repeat vs one-time customers
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
    
    #customer recency
    SELECT
    `Customer ID`,
    DATEDIFF(
        (SELECT MAX(InvoiceDate) FROM sales),
        MAX(InvoiceDate)
    ) AS Days_Since_Last_Order
FROM sales
WHERE `Customer ID` <> 0
GROUP BY `Customer ID`
ORDER BY Days_Since_Last_Order DESC
LIMIT 10;


SELECT
    CASE
        WHEN Days_Since_Last_Order <= 30 THEN '0-30 Days'
        WHEN Days_Since_Last_Order <= 90 THEN '31-90 Days'
        WHEN Days_Since_Last_Order <= 180 THEN '91-180 Days'
        WHEN Days_Since_Last_Order <= 365 THEN '181-365 Days'
        ELSE '365+ Days'
    END AS Recency_Group,
    COUNT(*) AS Customer_Count
FROM (
    SELECT
        `Customer ID`,
        DATEDIFF(
            (SELECT MAX(InvoiceDate) FROM sales),
            MAX(InvoiceDate)
        ) AS Days_Since_Last_Order
    FROM sales
    WHERE `Customer ID` <> 0
    GROUP BY `Customer ID`
) AS customer_recency
GROUP BY
    CASE
        WHEN Days_Since_Last_Order <= 30 THEN '0-30 Days'
        WHEN Days_Since_Last_Order <= 90 THEN '31-90 Days'
        WHEN Days_Since_Last_Order <= 180 THEN '91-180 Days'
        WHEN Days_Since_Last_Order <= 365 THEN '181-365 Days'
        ELSE '365+ Days'
    END
ORDER BY MIN(Days_Since_Last_Order);

# country analysis
SELECT
    Country,
    SUM(Revenue) AS Total_Revenue,
    COUNT(DISTINCT Invoice) AS Total_Orders
FROM sales
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10; 

# revenue per order by country
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

# Top 10 products by revenue
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

# Top 10 products by units sold
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

# average selling price per product
SELECT
    StockCode,
    Description,
    SUM(Revenue) AS Total_Revenue,
    SUM(Quantity) AS Units_Sold,
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