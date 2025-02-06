-- Exploratory Data Analysis

-- View all data after cleaning
SELECT * 
FROM layoffs_staging2;

-- Maximum values for layoffs
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Filter records where percentage of layoffs is 100%
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- Sum of layoffs per company
SELECT company, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC;

-- Date range of the dataset
SELECT MIN(date), MAX(date)
FROM layoffs_staging2;

-- Sum of layoffs per industry
SELECT industry, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off DESC;

-- Sum of layoffs per country
SELECT country, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;

-- Sum of layoffs per year
SELECT YEAR(date) AS year, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY year
ORDER BY year DESC;

-- Sum of layoffs per month
SELECT MONTH(date) AS month, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE date IS NOT NULL
GROUP BY month
ORDER BY total_laid_off DESC;

-- Rolling total of layoffs by month (based on date)
WITH rolling_total AS (
    SELECT 
        DATE_FORMAT(date, '%Y-%m') AS month, 
        SUM(total_laid_off) AS total_off
    FROM layoffs_staging2
    WHERE date IS NOT NULL
    GROUP BY month
)
SELECT 
    month, total_off, 
    SUM(total_off) OVER (ORDER BY month) AS rolling_sum
FROM rolling_total
ORDER BY month;

-- Company layoffs by year and ranking top companies by layoffs each year
WITH company_year AS (
    SELECT company, YEAR(date) AS year, SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY company, year
), company_year_rank AS (
    SELECT *, DENSE_RANK() OVER(PARTITION BY year ORDER BY total_laid_off DESC) AS ranking
    FROM company_year
)
SELECT *
FROM company_year_rank
WHERE ranking <= 5;
