ETL and Data Warehouse Project

Overview

This project showcases my ETL (Extract, Transform, Load) skills using Tableau Prep and SQL data warehousing techniques. The project focuses on building a data warehouse to track order and sales statistics for a fictional company called “Large.” The purpose of the warehouse is to provide detailed business insights across multiple dimensions such as time, location, product, and vendor. The repository includes the full project with SQL queries, data transformation steps, and data warehouse design documentation.

Key Objectives

	•	Data Warehouse Design: Create a star or snowflake schema to facilitate reporting on orders and sales across time and location dimensions.
	•	ETL Process: Use Tableau Prep to clean and transform data from a CSV file and merge it with existing database data.
	•	SQL Queries & Views: Develop SQL queries that provide useful reports and insights into sales performance, vendor activity, and customer location analysis.

Project Breakdown

1. Schema Design

	•	Designed a snowflake schema to support efficient storage and analysis, with normalized dimension tables for vendors, customers, products, and time.
	•	Created separate fact tables for orders and sales to allow for focused analysis of business processes.

2. ETL Process using Tableau Prep

	•	Data Cleaning: Cleaned the vendor data (lgvendor.csv) to standardize state names, merge area codes and phone numbers, and prepare it for loading.
	•	Data Integration: Integrated the cleaned data with operational data from the existing database and loaded the results into the new data warehouse (LargeDW).

3. SQL Queries and Views

	•	Key SQL Views: A variety of views were created to provide meaningful insights, including:
	•	Sales by Vendor and State: Reporting on total quantity sold and dollar sales by vendor and customer state.
	•	Orders by Quarter and State: Displaying the total number of orders by quarter and customer location.
	•	Sales and Orders by City, State, and Time: Breakdowns of sales and orders by multiple dimensions, including product, vendor, and brand.

How to Navigate the Repository

	1.	SQL Queries:
	•	All SQL queries used to create the views are provided in a sql_queries.sql file (you can upload these queries directly as .sql files).
	•	The queries are well-documented, making it easy to understand the logic behind each report.
	•	Screenshots of query outputs are included in the output_screenshots folder for easy visualization of results.
	2.	PDF Documentation:
	•	A PDF file with detailed SQL queries and descriptions is available for download in the repository.
