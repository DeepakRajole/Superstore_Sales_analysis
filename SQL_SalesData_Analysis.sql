--Overall view of superstore sales dataset --
SELECT
COUNT(order_id) AS Total_oreders,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sold,
AVG(profit) AS Avg_profit,
AVG(discount) AS Total_discount,
COUNT(DISTINCT country) AS Total_countries,
COUNT(DISTINCT product_name) AS Total_products,
COUNT(DISTINCT category) AS Total_categories,
COUNT(DISTINCT sub_category) AS Total_subcategories,
COUNT(DISTINCT year) AS Total_years
FROM dbo.[SuperStoreOrders Dataset]

--Sales Performance Analysis:
--Identify the top-selling products and categories.
SELECT TOP 10
product_name,
category,
SUM(sales) AS Toatl_sales,
SUM(quantity) AS Total_quantity_sold
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY product_name,category
ORDER BY 
SUM(sales) DESC

--Analyze sales trends over the years and highlight any significant pattern
SELECT 
year,
SUM(sales) AS Total_sales
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY year
ORDER BY SUM(sales) DESC


--Customer Segmentation
-- Segment customers based on their purchasing behavior
SELECT
segment,
COUNT(DISTINCT customer_name) AS Toatl_customers,
SUM(sales) AS Total_sales
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY segment
ORDER BY SUM(sales) DESC
--Implications
--We can understand which segments contribute most to the sales



--Shipping and Order Management:
--Evaluate the efficiency of different shipping modes
SELECT
ship_mode,
AVG(DATEDIFF(DAY, TRY_CAST(order_date AS DATE), TRY_CAST(ship_date AS DATE))) AS Avg_time_gape
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY ship_mode

--Analyze shipping costs and their impact on overall profitability
SELECT
ship_mode,
AVG(shipping_cost) AS Avg_shipping_cost,
AVG(profit) AS Avg_profit
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY ship_mode
ORDER BY AVG(profit)
--implications
--We can assess order processing times and identify areas for improvement



--Profitability and Cost Analysis:
--Analyze profit margins for different product categories and sub-categories.
SELECT
product_name,
category,
sub_category,
AVG(profit) AS Avg_profit,
AVG(discount) AS Avg_dicount
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY 
product_name,
category,
sub_category
ORDER BY AVG(profit) DESC
--Implications
--We can evaluate the impact of discounts on overall profitability.
--We can identify products or regions that may require cost optimization.



--Global Sales/Product Quantity Overview:
--Analyze the distribution of sales across different countries
SELECT
country,
SUM(sales) AS Total_sales,
SUM(quantity)  AS Total_quantity
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY country
ORDER BY SUM(sales) DESC
--implictions
--Identify the most sold products in each country.



--State Level Category Exploration:
--Understand the most used product categories
SELECT 
product_name,
category,
SUM(quantity) AS Total_quantity_sold
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY 
product_name,
category
ORDER BY SUM(quantity) DESC



--Regional Sub-Category Analysis:
--Analyzing the popularity of sub-categories in different regions
SELECT
region,
sub_category,
SUM(quantity) AS Total_quantity_sold
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY region, sub_category
ORDER BY SUM(quantity) DESC
