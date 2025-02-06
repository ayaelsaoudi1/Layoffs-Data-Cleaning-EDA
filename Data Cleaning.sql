-- Data cleaning

-- data source: https://www.kaggle.com/datasets/swaptr/layoffs-2022

SELECT *
FROM layoffs;

-- Creating a staging table for data cleaning

CREATE TABLE layoffs_staging 
LIKE layoffs;

INSERT INTO layoffs_staging
SELECT * FROM layoffs; 



-- 1. Remove duplicates 

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO layoffs_staging2
SELECT *, ROW_NUMBER() 
OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) 
AS row_num
FROM layoffs_staging;

DELETE FROM layoffs_staging2
WHERE row_num > 1;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;



-- 2. Standardizing data 

UPDATE layoffs_staging2
SET company = TRIM(company);

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET country = 'United States'
WHERE country LIKE 'United States%';

DESCRIBE layoffs_staging2;

-- Converting Date Format
UPDATE layoffs_staging2
SET date = str_to_date(date, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
modify COLUMN date DATE;



-- 3. Handling NULL Values

SELECT * FROM layoffs_staging2
WHERE industry IS NULL OR industry LIKE '';

UPDATE layoffs_staging2 AS T1
JOIN layoffs_staging2 AS T2
	ON T1.company = T2.company
AND T1.industry IS NULL OR T1.industry = ''
AND T2.industry IS NOT NULL
SET T1.industry = T2.industry;



-- 4. Removing Unnecessary Rows and Columns

DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * FROM layoffs_staging2;