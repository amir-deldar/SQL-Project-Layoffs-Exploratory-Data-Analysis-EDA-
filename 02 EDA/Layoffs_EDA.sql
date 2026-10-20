
-- Layoffs Project: Exploratory Data Analysis (EDA)

-- In this section, we will explore the dataset to identify trends, patterns, interesting findings, and potential outliers.
-- Usually, when starting EDA, you have specific questions or goals in mind. For this dataset, we will explore the data and see what insights we can discover.

SELECT *
FROM layoffs_dataset.layoffs_copy2;


-- FIRST, WE ARE GOING TO DO A QUICK AND BASIC REVIEW OF OUR DATA.
 

SELECT MAX(total_laid_off)
FROM layoffs_dataset.layoffs_copy2;


-- Examine the highest and lowest layoff percentages to understand the overall scale of workforce reductions.
SELECT MAX(percentage_laid_off), MIN(percentage_laid_off)
FROM layoffs_dataset.layoffs_copy2
WHERE percentage_laid_off IS NOT NULL;


-- Identify companies that laid off 100% of their workforce.
SELECT *
FROM layoffs_dataset.layoffs_copy2
WHERE percentage_laid_off = 1;

-- Most of these companies appear to be startups that shut down during the period covered by the dataset.


-- Sort by funds raised to see how much investment these companies received before laying off their entire workforce.
SELECT *
FROM layoffs_dataset.layoffs_copy2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- Britishvolt appears to be an electric vehicle company. 
-- Quibi is another notable example: it raised around $2 billion before shutting down, which is a significant loss.


-- NOW WE ARE GOING TO MOVE TO AN UPPER LEVEL AND DO AN ADVANCED EXPLORATION.
-- --------------------------------------------------------------------


-- Companies with the largest single-day layoffs
SELECT company, total_laid_off
FROM layoffs_dataset.layoffs_copy2
ORDER BY 2 DESC
LIMIT 5;

-- These results represent the largest layoffs recorded on a single day, rather than each company's total layoffs across the dataset.


-- Companies with the highest cumulative layoffs
SELECT company, SUM(total_laid_off)
FROM layoffs_dataset.layoffs_copy2
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;


-- Total layoffs grouped by location
SELECT location, SUM(total_laid_off)
FROM layoffs_dataset.layoffs_copy2
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;


-- Total layoffs by country across the period covered by the dataset
SELECT country, SUM(total_laid_off)
FROM layoffs_dataset.layoffs_copy2
GROUP BY country
ORDER BY 2 DESC;


-- Total layoffs by year to examine annual trends
SELECT YEAR(date), SUM(total_laid_off)
FROM layoffs_dataset.layoffs_copy2
WHERE YEAR(date) IS NOT NULL
GROUP BY YEAR(date)
ORDER BY 1 ASC;


-- Total layoffs grouped by industry
SELECT industry, SUM(total_laid_off)
FROM layoffs_dataset.layoffs_copy2
GROUP BY industry
ORDER BY 2 DESC;


-- Total layoffs grouped by company stage
SELECT stage, SUM(total_laid_off)
FROM layoffs_dataset.layoffs_copy2
GROUP BY stage
ORDER BY 2 DESC;

-- Finding the start date of layoffs
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_dataset.layoffs_copy2;
-- As we see the starting date of layoffs is nearly during the COVID-19 pandemic.


-- MORE ADVANCED QUERIES
-- --------------------------------------------------------------------

-- Previously, we identified the companies with the highest overall layoffs.
-- Now, we will examine the top companies by layoffs for each year. This requires a more advanced query using CTEs and window functions.

WITH Company_Year AS
(
    SELECT company,
           YEAR(date) AS years,
           SUM(total_laid_off) AS total_laid_off
    FROM layoffs_dataset.layoffs_copy2
    GROUP BY company, YEAR(date)
),
Company_Year_Rank AS
(
    SELECT company,
           years,
           total_laid_off,
           DENSE_RANK() OVER (
               PARTITION BY years
               ORDER BY total_laid_off DESC
           ) AS ranking
    FROM Company_Year
)
SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;

-- The first CTE calculates the total layoffs for each company per year.
-- The second CTE ranks companies by their yearly layoff totals.
-- Finally, we select the top 3 ranked companies for each year, exclude records with missing years, and sort the results chronologically.
-- This helps us identify which companies had the most layoffs each year.



-- Calculate the total layoffs for each month
SELECT SUBSTRING(date, 1, 7) AS dates,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_dataset.layoffs_copy2
GROUP BY dates
ORDER BY dates ASC;


-- Use a CTE to organize the monthly totals so we can calculate the cumulative number of layoffs over time.
WITH DATE_CTE AS
(
    SELECT SUBSTRING(date, 1, 7) AS dates,
           SUM(total_laid_off) AS total_laid_off
    FROM layoffs_dataset.layoffs_copy2
    GROUP BY dates
)
SELECT dates,
       SUM(total_laid_off) OVER (
           ORDER BY dates ASC
       ) AS rolling_total_layoffs
FROM DATE_CTE
WHERE dates IS NOT NULL
ORDER BY dates ASC;
