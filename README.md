# Data Analyst Portofolio
Hi, I'm Benny Sappetua a senior e-commerce executive, who specialize on online store operation with 4+ years of experience in the e-commerce industry. I was pursuing my career as Senior Store Operations Executive at SIRCLO, one of the leading omnichannel commerce enabler in Indonesia. I worked in the commerce team, managing client’s official brand selling online across various e-commerce platform in Indonesia.

I'm skilled in E-Commerce Data Analysis, Account Management, Maximizing Revenue Through E-Commerce Platform Feature, Allocating & Forecasting Available Stock and Managing Store Operation Team. Now I'm currently pursuing another specialized skills as Data Analyst which I believe will be valuable set of skill in my role as E-Commerce Specialist and now I have now been certified as a Beginner Data Analyst 

In my free time, I enjoy exploring new data analysis technique and new data visualization tools, and I always looking for new opportunities to expand my knowledge and skill set. Wether working on a team or independently, I am driven by the satisfaction of discovering a new angle of insight and story telling from the data I've been analyzed and the thrill of solving complex problems.

This is my CV in a pdf file.

This repository intended to showcase skills, share projects and track my progress in Data Analytic related topics.

## Table of Contents

- About

- Portofolio Projects
  - Python
    - [Analyzing OLIST E-commerce Performance and Problems (Beginner Level Data Analyst)](#Analyzing-OLIST-Ecommerce-Performance-and-Problems).

  - SQL
    - [Chinook Music Player Library Data Exploration](#Chinook-Music-Player-Library-Data-Exploration).
    - [Ecommerce Data Exploratory](#Ecommerce-Data-Exploratory).
    - [Sakila DVD Rental Store Data Exploration and Analysis](#Sakila-DVD-Rental-Store-Data-Exploration-and-Analysis).
    - [Google BigQuery - Thelook Ecommerce](https://console.cloud.google.com/bigquery?sq=440166613534:ed4d78a9441840e190283bcbdbf0cec5)
  
  - Tableau [[link to Tableau Vizzes](https://public.tableau.com/app/profile/benny.sappetua/vizzes)]
 
  - Google Looker Studio [[link to LookerStudio Dashboard](https://lookerstudio.google.com/reporting/0472e6cc-860c-4648-9042-28ceeb4e36a7/page/xzDXE)]


## Portofolio Projects
In this section I will list my data analytics projects along with the goals, description and tools used for each project 

## Analyzing OLIST Ecommerce Performance and Problems
__Code__: [Analyzing OLIST E-commerce Performance and Problems.ipynb](https://github.com/bennysappetua/Data-Analyst-Portofolio/blob/c89762ffdc57cfab3b1ad8b791e73022a4d9a30b/OLIST%20E-commerce%20Data%20Analysis.ipynb)

__Goals__: To analyze OLIST performance throughout the years and the problem it's facing.

__Description__: The project focusing on analyzing data from OLIST E-commerce located in Brazil and the data period is between 2016 - 2018. The main dataset included orders, payments, customers, products, review and geolocation. This project include importing dataset, creating connection between SQL and Python, merging multiple dataset using key connection between dataset framework, dealing with null values and data cleansing, adding important column (ex: transaction time label, adding year, month and day column and adding column for calculating total order value), analyzing customer demographic, analyzing customer's order behaviour, analyzing customer's review and making time series analysis. Each analysis equipped with it's own visualization using matplotlib.

__Skills__: null value identification, data cleansing, data analysis, problem analysis, hypothesis testing to confirm the problem, data visualization

__Tools__: Python, Pandas, Numpy, Seaborn.

__Results__: Using Python as analyzing tools revealed that OLIST E-commerce facing "Single-Transaction Customer" problem, meaning almost all new customers only doing transaction once, resulting in terrible customer retention throughout the years.


     
## Chinook Music Player Library Data Exploration
__Code__: [Chinook Music Player Library Data Exploration.sql](https://github.com/bennysappetua/Data-Analyst-Portofolio/blob/main/Chinook%20Music%20Player%20Library%20Data%20Exploration.sql)

__Description__: Chinook is a music library database that contains database for transaction (InvoiceLine, Invoice, Customer) and playlist information. This project is intended as an introduction for SQL beginners with the following steps: basic selection, using WHERE and HAVING filter, learning the difference between WHERE and HAVING, using ascending/descending filter, limit fuction, aggregate function, JOIN function, UNION, function and CTE.

__Skills__: Filtering, Aggregate function, JOIN Tabel, UNION, CTE

__Tools__: DBeaver

    
## Ecommerce Data Exploratory
__Code__: [Ecommerce Data Exploratory.sql](https://github.com/bennysappetua/Data-Analyst-Portofolio/blob/main/Ecommerce%20Data%20Exploratory.sql)

__Description__: Ecommerce Data Exploratory & Analysis is intended as an assignment for SQL course. This assignment testing my logic to use the basic SQL skills that I've already learned and combined it. For example to determine which employee serving more than 3 customers I must combine JOIN function and HAVING function as filter. First I JOIN customer and employee dataset and using HAVING to filter employee that have total customer more than 3. On the next assignment I also tasked to combine CTE with JOIN. 

__Skills__: Filtering, Aggregate function, JOIN Tabel, CTE

__Tools__: DBeaver

  
## Sakila DVD Rental Store Data Exploration and Analysis
__Code__: [Sakila DVD Rental Store Data Exploration & Analysis.sql](https://github.com/bennysappetua/Data-Analyst-Portofolio/blob/main/Sakila%20DVD%20Rental%20Store%20Data%20Exploration%20%26%20Analysis.sql)

__Description__: Sakila DVD Rental Store Data Exploration & Analysis is the most complete data exploratory and analysis that I've done using SQL. This project is intended for SQL practice that haven't been teached by the mentor and with more advance query such as LOWER for converting string into lower-case, Concatenation operator using '||', using Wildcard, JOIN and CTE.  

__Skills__: Filtering, Aggregate function, String function, Concatenate, JOIN Tabel, CTE

__Tools__: DBeaver
