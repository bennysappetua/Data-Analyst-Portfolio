# Data Analyst Portofolio
Hi, I'm Benny Sappetua a senior e-commerce executive, who specialize on online store operation with 4+ years of experience in the e-commerce industry. I was pursuing my career as Senior Store Operations Executive at SIRCLO, one of the leading omnichannel commerce enabler in Indonesia. I worked in the commerce team, managing client’s official brand selling online across various e-commerce platform in Indonesia.

I'm skilled in E-Commerce Data Analysis, Account Management, Maximizing Revenue Through E-Commerce Platform Feature, Allocating & Forecasting Available Stock and Managing Store Operation Team. Now I'm currently pursuing another specialized skills as Data Analyst which I believe will be valuable set of skill in my role as E-Commerce Specialist and now I have now been certified as a Beginner Data Analyst 

In my free time, I enjoy exploring new data analysis technique and new data visualization tools, and I always looking for new opportunities to expand my knowledge and skill set. Wether working on a team or independently, I am driven by the satisfaction of discovering a new angle of insight and story telling from the data I've been analyzed and the thrill of solving complex problems.

This is my CV in a [pdf file](https://drive.google.com/file/d/1hT8aEkNN-6k_d9G_M3MGeyxw0LLOPBoG/view?usp=sharing)

This repository intended to showcase skills, share projects and track my progress in Data Analytic related topics.

## Table of Contents

- About

- Portofolio Projects
  - Python
    - [Analyzing OLIST E-commerce Performance and Problems (Beginner Level Data Analyst)](#Analyzing-OLIST-Ecommerce-Performance-and-Problems).
    - [Retail Online Store Data Analysis (Intermediate Level Data Analyst)](#Retail-Online-Store-Data-Analysis).

  - SQL
    - [Chinook Music Player Library Data Exploration](#Chinook-Music-Player-Library-Data-Exploration).
    - [Ecommerce Data Exploratory](#Ecommerce-Data-Exploratory).
    - [Sakila DVD Rental Store Data Exploration and Analysis](#Sakila-DVD-Rental-Store-Data-Exploration-and-Analysis).
    - [Google BigQuery - Thelook Ecommerce](https://console.cloud.google.com/bigquery?sq=440166613534:ed4d78a9441840e190283bcbdbf0cec5)
  
  - Tableau [[link to Tableau Vizzes](https://public.tableau.com/app/profile/benny.sappetua/vizzes)]
 
  - Google Looker Studio
    [[Link 1 PT Tumbuh Bersama Dashboard](https://lookerstudio.google.com/reporting/0472e6cc-860c-4648-9042-28ceeb4e36a7/page/xzDXE)]
    [[Link 2 Online Retail Store Dashboard](https://lookerstudio.google.com/u/0/reporting/586f3766-0165-4fbf-91e5-1d037651434f/page/juIsE)]

  - Microsoft Power BI Desktop
    - [Project 1. Maven Market Dashboard Training(pdf)](https://github.com/bennysappetua/Data-Analyst-Portfolio/blob/main/Maven%20Market%20Dashboard%20Training.pdf)
    - [[Project 1. Maven Market Dashboard Training (download pbix file )](https://github.com/bennysappetua/Data-Analyst-Portfolio/blob/main/Maven%20Market%20Dashboard%20Training.pbix)]

 - [Education](#Education)

 - [Certificates](#Certificates)

 - [Contacts](#Contacts)


## Portofolio Projects
In this section I will list my data analytics projects along with the goals, description and tools used for each project 

## Analyzing OLIST Ecommerce Performance and Problems
__Code__: [Analyzing OLIST E-commerce Performance and Problems.ipynb](https://github.com/bennysappetua/Data-Analyst-Portofolio/blob/c89762ffdc57cfab3b1ad8b791e73022a4d9a30b/OLIST%20E-commerce%20Data%20Analysis.ipynb)

__Goals__: To analyze OLIST performance throughout the years and the problem it's facing.

__Description__: The project focusing on analyzing data from OLIST E-commerce located in Brazil and the data period is between 2016 - 2018. The main dataset included orders, payments, customers, products, review and geolocation. This project include importing dataset, creating connection between SQL and Python, merging multiple dataset using key connection between dataset framework, dealing with null values and data cleansing, adding important column (ex: transaction time label, adding year, month and day column and adding column for calculating total order value), analyzing customer demographic, analyzing customer's order behaviour, analyzing customer's review and making time series analysis. Each analysis equipped with it's own visualization using matplotlib.

__Skills__: null value identification, data cleansing, data analysis, problem analysis, hypothesis testing to confirm the problem, data visualization

__Tools__: Python, Pandas, Numpy, Seaborn.

__Results__: Using Python as analyzing tools revealed that OLIST E-commerce facing "Single-Transaction Customer" problem, meaning almost all new customers only doing transaction once, resulting in terrible customer retention throughout the years.


## Retail Online Store Data Analysis
__Code__: [Retail Online Store Data Analysis](https://github.com/bennysappetua/Data-Analyst-Portfolio/blob/main/Retail%20Store%20Data%20Analysis.ipynb)

__Goals__: To analyze Online Retail Store performance throughout 2019 and make recommendation based on the insights found.

__Description__: Online Retail Store Data Analysis is a project that aims to analyze sales data from an online retail store to uncover valuable insights for strategic decision-making. The analysis focuses on product segmentation to assess category performance, customer segmentation to classify customers based on their transaction recency, frequency and volume score (RFM Analysis), time series analysis to identify sales trends and long-term growth patterns, and seasonality analysis to detect periodic fluctuations for better pricing, promotions, and stock management. By leveraging these methodologies, the project provides data-driven recommendations to enhance operational efficiency and business growth.

I also use a newly learned python library that is ARIMA and Prophet to make revenue forecasting, that can be used as target revenue for the next period/year.  

__Skills__: Null value identification, data cleansing, data analysis, problem analysis, hypothesis testing to confirm the problem, data visualization, data forecasting.

__Tools__: Python, Pandas, Numpy, Seaborn, K-means, ARIMA, Prophet.

__Results__: Using Python for data analysis, I assess the SWOT (Strengths, Weaknesses, Opportunities, and Threats) of the analyzed online retail store. Based on this analysis, I provide strategic recommendations tailored for all periods (Q1–Q4), Q1–Q3, and Q4 to optimize business performance.

     
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


## Education
UNIVERSITAS KATOLIK ATMA JAYA JAKARTA (Sep 2011 - Dec 2017)

## Certificates
Growia Education is an educational center for career development in Indonesia that offer Data Analyst course. This is the Data Analyst certificates that I get from Growia Education:  
- [Growia Education - Beginner Data Analyst Certificate ](https://drive.google.com/file/d/1y1phKCs-LUPmPvgWhe42NXpm_FKHLiqz/view?usp=sharing)
- [Microsoft Power BI Desktop for Business Intelligence ](https://www.udemy.com/certificate/UC-8dc3ceca-8673-4a4b-b50d-cff8c51054b2/)
- [EF SET English Certificate 71/100 (C2 Proficient) ](https://cert.efset.org/en/r1iSVj)

## Contacts
- LinkedIn: https://www.linkedin.com/in/benny-sappetua/
- Email: benny.sappetua@gmail.com
