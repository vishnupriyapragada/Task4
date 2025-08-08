Project: Flipkart Mobile Data Scraping, Cleaning & SQL Analysis

Overview:

This project demonstrates the end-to-end process of extracting, cleaning, and analyzing e-commerce data from the Flipkart website using Python and MySQL.


Steps Performed:

Web Scraping (Python)

Collected mobile phone data (Title, Price, Rating) from Flipkart using BeautifulSoup and requests.

Stored the scraped data into a CSV file.


Data Cleaning:

Removed unwanted characters and symbols from price and rating.

Added derived columns:

Price Category (Low / Medium / High)

Rating Category (Low / Medium / High)



SQL Operations (MySQL Workbench):

Basic Queries: SELECT, WHERE, ORDER BY, GROUP BY

Joins: INNER JOIN, LEFT JOIN, RIGHT JOIN with a brands table

Subqueries: Finding mobiles above average price

Aggregations: Count, Average, Min, Max, Revenue Calculation

Views: Created a TopRatedMobiles view for mobiles with rating ≥ 4.5

Optimized Query: Filtering mobiles by price range with sorting by rating


Tech Stack:

Python: BeautifulSoup, Pandas

Database: MySQL Workbench

Libraries: requests, pandas, bs4


Outcome:

Extracted clean, structured dataset from Flipkart.

Performed multiple SQL analyses to derive insights on pricing, ratings, and brand performance.
