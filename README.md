# Layoffs Data Cleaning and Exploratory Data Analysis (EDA) Using MySQL

This project focuses on cleaning and performing exploratory data analysis (EDA) on a dataset containing details of global companies' layoffs from 2020 to 2023, sourced from the [Kaggle](https://www.kaggle.com/datasets/swaptr/layoffs-2022) dataset titled "Layoffs 2022". The dataset includes various attributes such as company name, location, industry, and total layoffs, with a total of 2,362 rows, each representing a unique layoff event across different companies and industries globally.

## Objective
The main objectives of this project were:
1. To clean and preprocess the dataset to ensure it is suitable for further analysis.
2. To perform exploratory data analysis (EDA) to uncover insights and patterns in the layoffs data.

## Data Cleaning Process
The first step in this project was to clean the raw dataset. The following cleaning procedures were carried out:

- **Duplicate Removal**: The data was examined for duplicate records, which were removed to ensure that only unique entries remained. The criteria for uniqueness included columns such as company name, location, industry, and layoff details.

- **Standardization of Data**: Certain values in the dataset, such as company names, industries, and countries, were standardized to ensure consistency. For example, variations in the "industry" column like "Crypto" were unified to a standard name, and country names were standardized to a uniform format.

- **Date Formatting**: The date format in the dataset was inconsistent, so it was converted to a proper date format to make time-based analysis possible. This ensured that the date values could be easily used for further analysis.

- **Handling Missing Values**: Some records contained missing values in important columns like the "industry" field. These were addressed by filling in missing values based on information from the same company, ensuring that the data was as complete as possible.

- **Removal of Unnecessary Rows**: Rows with null values in both the "total_laid_off" and "percentage_laid_off" columns were removed, as they did not provide useful information for analysis.

## Exploratory Data Analysis (EDA)
After cleaning the dataset, the next step was to explore the data and derive insights. The following analyses were performed:

- **Maximum Layoffs**: The dataset was analyzed to determine the maximum number of layoffs and the highest percentage of layoffs in a single record. This helped identify the most extreme layoffs in the dataset.

- **Full Layoffs (100%)**: A focused analysis was done on the records where the percentage of layoffs was 100%. This identified companies that had completely laid off their workforce.

- **Total Layoffs per Company**: The total number of layoffs was calculated for each company. This allowed for an understanding of which companies had the largest layoffs overall.

- **Date Range**: The dataset was examined for its date range, helping to determine the span of time covered by the layoffs data.

- **Total Layoffs per Industry**: The data was grouped by industry to determine which sectors experienced the most layoffs.

- **Total Layoffs per Country**: The total number of layoffs was also grouped by country to understand which countries were most impacted by layoffs.

- **Layoffs by Year**: The data was aggregated by year to observe trends over time, including whether layoffs increased or decreased during specific years.

- **Layoffs by Month**: Layoffs were aggregated by month to identify seasonal or cyclical patterns in the data.

- **Rolling Total of Layoffs**: A rolling total of layoffs was calculated by month to observe cumulative trends over time, helping to highlight the long-term impact of layoffs.

- **Top Companies by Year**: The dataset was analyzed to identify the top companies with the largest layoffs each year. This analysis was useful in pinpointing which companies were responsible for the largest layoffs in a given year.

## Data Export
After completing the data cleaning and exploratory analysis, the cleaned dataset was exported into CSV format for further use. Both the original and the cleaned versions of the dataset are available in this repository for reference and further analysis.
