USE flipkart;
-- =============================
-- 1. Basic SELECT, WHERE, ORDER BY, GROUP BY
-- =============================
-- View all mobiles
SELECT * FROM mobiles;

-- Mobiles with rating above 4
SELECT ï»¿title, price, rating
FROM mobiles
WHERE rating > 4
ORDER BY rating DESC;

-- Average rating by price category
SELECT price_category, AVG(rating) AS avg_rating
FROM mobiles
GROUP BY price_category
ORDER BY avg_rating DESC;

-- =============================
-- 2. Create Brands Table (for join examples)
-- =============================
CREATE TABLE IF NOT EXISTS brands (
    brand VARCHAR(50) PRIMARY KEY,
    country VARCHAR(50)
);

INSERT IGNORE INTO brands (brand, country) VALUES
('Samsung', 'South Korea'),
('Apple', 'USA'),
('Xiaomi', 'China'),
('Realme', 'China'),
('OnePlus', 'China'),
('Motorola', 'USA');

-- =============================
-- 3. JOINS (Without creating new column)
-- =============================

-- INNER JOIN: Only brands present in both tables
SELECT m.ï»¿title, m.price, b.country
FROM mobiles m
INNER JOIN brands b 
    ON SUBSTRING_INDEX(m.ï»¿title, ' ', 1) = b.brand;

-- LEFT JOIN: All mobiles, brand info if found
SELECT m.ï»¿title, m.price, b.country
FROM mobiles m
LEFT JOIN brands b 
    ON SUBSTRING_INDEX(m.ï»¿title, ' ', 1) = b.brand;

-- RIGHT JOIN: All brands, mobiles if found
SELECT m.ï»¿title, m.price, b.country
FROM mobiles m
RIGHT JOIN brands b 
    ON SUBSTRING_INDEX(m.ï»¿title, ' ', 1) = b.brand;

-- =============================
-- 4. SUBQUERIES
-- =============================

-- Mobiles priced above the overall average
SELECT * FROM mobiles
WHERE price > (SELECT AVG(price) FROM mobiles);

-- =============================
-- 4. AGGREGATE FUNCTIONS
-- =============================

-- Summary stats
SELECT 
    COUNT(*) AS total_mobiles,
    AVG(price) AS avg_price,
    MIN(price) AS cheapest_price,
    MAX(price) AS most_expensive_price
FROM mobiles;

-- Total revenue if selling 100 units of each
SELECT SUM(price * 100) AS total_revenue
FROM mobiles;

-- =============================
-- 6. CREATE VIEWS
-- =============================

-- View for top-rated mobiles
CREATE OR REPLACE VIEW TopRatedMobiles AS
SELECT ï»¿title, price, rating
FROM mobiles
WHERE rating >= 4.5
ORDER BY rating DESC;

-- =============================
-- 8. Example of optimized query
-- =============================
SELECT * FROM mobiles
WHERE price BETWEEN 15000 AND 50000
ORDER BY rating DESC;
