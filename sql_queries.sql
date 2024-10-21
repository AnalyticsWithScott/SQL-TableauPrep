-- 1. Sales by Vendor State
-- This query generates a report summarizing the total quantity of 
-- products sold and the total sales amount in dollars, grouped by 
-- vendor and customer state. The WITH ROLLUP feature provides 
-- subtotals at the state level. This view allows businesses to 
-- assess vendor performance across different regions, identifying 
-- key markets.
CREATE VIEW vw_Sales_By_Vendor_State AS
SELECT v.Vendor_Name, c.Cust_State AS Customer_State, 
       SUM(s.Line_QTY) AS Total_Quantity_Sold, 
       SUM(s.Total_Amount) AS Total_Dollar_Amount_Sold
FROM fact_SALES s
JOIN dim_PRODUCT p ON s.Prod_Code = p.Prod_Code
JOIN dim_VENDOR v ON p.Vendor_ID = v.Vendor_ID
JOIN dim_CUSTOMER c ON s.Cust_Code = c.Cust_Code
GROUP BY v.Vendor_Name, c.Cust_State WITH ROLLUP;



-- 2. Orders by Quarter and State
-- This query calculates the total number of orders placed, broken 
-- down by quarter (including year) and customer state. It uses 
-- WITH ROLLUP to add subtotals for each quarter, allowing analysts 
-- to track order trends over time and across regions. It is useful 
-- for identifying seasonal patterns and regional demand fluctuations.
CREATE VIEW vw_Orders_By_Quarter_State AS
SELECT t.Year, t.Quarter, c.Cust_State AS Customer_State, 
       COUNT(*) AS Total_Orders
FROM fact_ORDER o
JOIN dim_CUSTOMER c ON o.Cust_Code = c.Cust_Code
JOIN dim_TIME t ON o.Date_Code = t.Date_Code
GROUP BY t.Year, t.Quarter, c.Cust_State WITH ROLLUP;



-- 3. Orders and Sales by City and State
-- This view aggregates the total number of orders, total quantity 
-- sold, and total sales revenue by customer city and state. It 
-- gives businesses insights into which cities and states generate 
-- the most sales, helping optimize marketing and operational 
-- strategies in those locations.
CREATE VIEW vw_Orders_Sales_By_City_State AS
SELECT c.Cust_City, c.Cust_State,
       SUM(o.Num_Orders) AS Total_Orders,
       SUM(s.Line_QTY) AS Total_Quantity_Sold,
       SUM(s.Total_Amount) AS Total_Dollar_Amount_Sold
FROM fact_ORDER o
JOIN dim_CUSTOMER c ON o.Cust_Code = c.Cust_Code
JOIN fact_SALES s ON o.Cust_Code = s.Cust_Code
GROUP BY c.Cust_City, c.Cust_State WITH ROLLUP;



-- 4. Orders and Sales by Month, Quarter, and Year
-- This query breaks down the total orders, total quantity sold, 
-- and total sales revenue by month, quarter, and year. It 
-- highlights sales trends at different time intervals, making 
-- it useful for time-based performance analysis, such as detecting 
-- seasonality or yearly growth patterns.
CREATE VIEW vw_Orders_Sales_By_Month_Quarter_Year AS
SELECT t.Year, t.Quarter, t.Month,
       COUNT(*) AS Total_Orders,
       SUM(s.Line_QTY) AS Total_Quantity_Sold,
       SUM(s.Total_Amount) AS Total_Dollar_Amount_Sold
FROM fact_ORDER o
JOIN dim_TIME t ON o.Date_Code = t.Date_Code
JOIN fact_SALES s ON o.Cust_Code = s.Cust_Code
GROUP BY t.Year, t.Quarter, t.Month WITH ROLLUP;



-- 5. Orders and Sales by Product
-- This view aggregates order and sales data by product, providing 
-- the total number of orders, total quantity sold, and total 
-- revenue. It also includes the product description and brand ID, 
-- giving detailed insight into product-level performance, helping 
-- businesses to make informed decisions regarding product offerings.
CREATE VIEW vw_Orders_Sales_By_Product AS
SELECT p.Prod_Code, p.Prod_Descript, p.Brand_ID,
       SUM(o.Num_Orders) AS Total_Orders,
       SUM(s.Line_QTY) AS Total_Quantity_Sold,
       SUM(s.Total_Amount) AS Total_Dollar_Amount_Sold
FROM fact_SALES s
JOIN dim_PRODUCT p ON s.Prod_Code = p.Prod_Code
JOIN fact_ORDER o ON s.Cust_Code = o.Cust_Code
GROUP BY p.Prod_Code, p.Prod_Descript, p.Brand_ID;



-- 6. Orders and Sales by Brand
-- This query summarizes orders and sales by brand. It provides the 
-- total number of orders, quantity sold, and total sales revenue 
-- for each brand, enabling businesses to track brand performance 
-- and evaluate customer preferences at the brand level.
CREATE VIEW vw_Orders_Sales_By_Brand AS
SELECT b.Brand_ID, b.Brand_Name,
       SUM(o.Num_Orders) AS Total_Orders,
       SUM(s.Line_QTY) AS Total_Quantity_Sold,
       SUM(s.Total_Amount) AS Total_Dollar_Amount_Sold
FROM fact_ORDER o
JOIN dim_PRODUCT p ON o.Prod_Code = p.Prod_Code
JOIN dim_BRAND b ON p.Brand_ID = b.Brand_ID
JOIN fact_SALES s ON o.Cust_Code = s.Cust_Code
GROUP BY b.Brand_ID, b.Brand_Name;



-- 7. Orders and Sales by Vendor
-- This query calculates total orders, total quantity sold, and total 
-- sales revenue, grouped by vendor. It enables a detailed performance 
-- analysis of vendors, allowing businesses to assess vendor 
-- contribution to overall sales and identify key vendor partnerships.
CREATE VIEW vw_Orders_Sales_By_Vendor AS
SELECT v.Vendor_ID, v.Vendor_Name,
       SUM(o.Num_Orders) AS Total_Orders,
       SUM(s.Line_QTY) AS Total_Quantity_Sold,
       SUM(s.Total_Amount) AS Total_Dollar_Amount_Sold
FROM fact_ORDER o
JOIN dim_PRODUCT p ON o.Prod_Code = p.Prod_Code
JOIN dim_VENDOR v ON p.Vendor_ID = v.Vendor_ID
JOIN fact_SALES s ON o.Cust_Code = s.Cust_Code
GROUP BY v.Vendor_ID;
