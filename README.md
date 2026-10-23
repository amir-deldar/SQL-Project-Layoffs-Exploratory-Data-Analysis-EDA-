# Layoffs Exploratory Data Analysis [EDA] (SQL Project)

An exploratory data analysis of global company layoffs from **March 2020 to March 2023**, written entirely in **MySQL**. The project works through a cleaned layoffs dataset to uncover which companies, industries, locations, and company stages were hit hardest, and how layoffs evolved over time.

---

## Project Overview

This is the second stage of a two-part SQL project. The raw layoffs data was first cleaned (duplicates removed, values standardized, null and blank values handled), producing the table `layoffs_dataset.layoffs_copy2`. This repository covers the **EDA stage**: asking questions of the cleaned data and turning query results into insights.

## 🗂 Repository Structure

```
├── data/
│   └── layoffs_cleaned_(layoffs_copy2).csv
├── eda/
│   └── Layoffs_EDA.sql
└── README.md
```

## Objectives

- Understand the overall scale of layoffs (largest events, highest percentages).
- Identify companies that shut down completely (100% of staff laid off) and how much funding they had raised.
- Rank companies, locations, countries, industries, and company stages by total layoffs.
- Analyze how layoffs changed year over year and month over month.
- Find the top companies by layoffs within each year.
- Track the cumulative (rolling) number of layoffs over time.

## Dataset

| Item | Detail |
|---|---|
| Table | `layoffs_dataset.layoffs_copy2` |
| File | `layoffs_cleaned layoffs_copy2.csv` |
| Rows | 1,000 |
| Columns | 9 |
| Date range | 2020-03-11 to 2023-03-06 |

**Columns**

| Column | Description |
|---|---|
| `company` | Company that conducted the layoff |
| `location` | City / region of the company |
| `industry` | Industry of the company |
| `total_laid_off` | Number of employees laid off |
| `percentage_laid_off` | Share of the workforce laid off (0 to 1) |
| `date` | Date of the layoff announcement |
| `stage` | Funding / company stage (e.g. Series B, Post-IPO) |
| `country` | Country of the company |
| `funds_raised_millions` | Total funding raised, in USD millions |

> **Data source:** *(https://www.kaggle.com/datasets/swaptr/layoffs-2022)*


## Tools and Skills Demonstrated

- **MySQL** (database: `layoffs_dataset`)
- Aggregations: `SUM`, `MAX`, `MIN`, `GROUP BY`, `ORDER BY`, `LIMIT`
- Date functions: `YEAR()`, `SUBSTRING()`
- **Common Table Expressions (CTEs)**, including chained CTEs
- **Window functions**: `DENSE_RANK() OVER (PARTITION BY ...)` and rolling totals with `SUM() OVER (ORDER BY ...)`
- NULL handling and outlier checks

## Methodology

The analysis in [`Layoffs_EDA.sql`](Layoffs_EDA.sql) is organized in three levels:

**1. Basic review**
- Maximum single layoff event
- Highest and lowest `percentage_laid_off`
- Companies with 100% layoffs, sorted by funds raised

**2. Intermediate exploration**
- Largest single-day layoffs vs. cumulative layoffs per company
- Totals by location, country, year, industry, and company stage
- Start and end dates of the dataset

**3. Advanced analysis**
- **Top 3 companies per year** using two CTEs and `DENSE_RANK()`
- **Monthly totals** using `SUBSTRING(date, 1, 7)`
- **Rolling cumulative total** of layoffs using a CTE and a window `SUM()`

## Key Findings

Figures below are calculated from the 1,000-row cleaned file in this repository (193,367 layoffs where `total_laid_off` is recorded).

### 1. Scale of layoffs
- The **largest single layoff event** was **Google (12,000 employees, January 2023)**, followed by **Amazon (10,000, November 2022)**, **Ericsson (8,500, February 2023)**, **Amazon again (8,000, January 2023)**, and **Dell (6,650, February 2023)**.
- `percentage_laid_off` ranges from **1% to 100%**.

### 2. Companies that shut down (100% laid off)
- **61 companies** laid off their entire workforce, mostly startups that closed during the period.
- The best-funded of them show how much capital was lost:

| Company | Industry | Funds raised ($M) |
|---|---|---|
| Britishvolt | Transportation (EV batteries) | 2,400 |
| Deliveroo Australia | Food | 1,700 |
| Katerra | Construction | 1,600 |
| BlockFi | Crypto | 1,000 |

### 3. Cumulative layoffs by company
Top companies by total layoffs across the whole period:

| Rank | Company | Total laid off |
|---|---|---|
| 1 | Amazon | 18,150 |
| 2 | Google | 12,000 |
| 3 | Ericsson | 8,500 |
| 4 | Dell | 6,650 |
| 5 | Booking.com | 4,601 |

### 4. Where layoffs happened
- **SF Bay Area** dominates with **56,226** layoffs, nearly three times second-placed **Seattle (19,876)**, followed by **New York City (17,523)**, **Stockholm (9,982)**, and **Bengaluru (7,931)**.
- By country, the **United States (130,761)** accounts for roughly two thirds of all recorded layoffs, followed by **India (13,292)** and **Sweden (10,124)**.

### 5. Trend over time

| Year | Total laid off |
|---|---|
| 2020 | 36,706 |
| 2021 | 10,005 |
| 2022 | 80,356 |
| 2023 (Jan to early Mar only) | 65,800 |

- Layoffs spiked at the start of the COVID-19 pandemic (April and May 2020), dropped sharply in 2021, then surged from late 2022.
- **January 2023 was the single worst month (39,588 layoffs)**, followed by November 2022 (26,961) and February 2023 (23,865).
- 2023 reached 65,800 layoffs in only about two months of data, far outpacing any full earlier year's monthly pace.

### 6. Top 3 companies per year (window function)

| Year | #1 | #2 | #3 |
|---|---|---|---|
| 2020 | Booking.com (4,375) | Groupon (2,800) | Airbnb (1,900) |
| 2021 | Bytedance (3,600) | Katerra (2,434) | Instacart (1,877) |
| 2022 | Amazon (10,150) | Cisco (4,100) | Carvana (4,000) |
| 2023 | Google (12,000) | Ericsson (8,500) | Amazon (8,000) |

### 7. Industry and company stage
- **Industries:** Retail (30,545), Consumer (20,608), Food (14,045), Hardware (13,394), and Transportation (13,290) lost the most jobs.
- **Stage:** **Post-IPO** companies account for **95,860** layoffs, about half of the total, far ahead of Acquired (14,179) and Series D (12,523). Layoffs were driven mainly by large, established public companies rather than early-stage startups, even though startups were the ones shutting down completely.

## Business Takeaways

- Layoffs were **concentrated**: a handful of large public companies and a few tech hubs (especially the SF Bay Area) drive most of the total.
- The 2022 to 2023 wave was **faster and larger** than the 2020 pandemic shock.
- **Funding is not a guarantee of survival**: several companies shut down completely after raising over $1 billion.


## Future Work

- Build a dashboard (Tableau / Power BI) from the query outputs.
- Extend the analysis with layoffs per funding dollar and layoffs as a share of company size.
- Compare the layoff timeline with external events (interest rate hikes, market indices).
- Replicate the analysis in Python (pandas) for comparison.



**Author: Amir Deldar**

**Contact:**

[LinkedIn](https://www.linkedin.com/in/amirdeldar) · [GitHub](https://github.com/amir-deldar) · Email: <callmedeldar@gmail.com>
