# Layoffs EDA: Key Findings & Business Insights

---

## 1. Dataset at a Glance

| Metric | Value |
|---|---|
| Records | 1,000 |
| Total employees laid off (non-null rows) | 193,367 |
| Largest single layoff event | 12,000 (Google, 20 Jan 2023) |
| Layoff % range | 1% – 100% |
| Missing `total_laid_off` | 184 rows (18%) |
| Missing `percentage_laid_off` | 212 rows (21%) |
| Missing `funds_raised_millions` | 89 rows (9%) |

---

## 2. Companies That Laid Off 100% of Staff

- **61 companies** laid off their entire workforce, which the analyst reads as mostly startups that shut down.
- Many sit in early or unknown funding stages: Unknown (20), Seed (13), Series B (10), Series A (6), plus 6 that were Acquired.
- By industry they are spread out: Retail (7), Food (7), Finance (6), Healthcare (5), Transportation (5).

**Largest shutdowns by funding raised**

| Company | Industry | Funds raised ($M) | Laid off | Date |
|---|---|---|---|---|
| Britishvolt | Transportation (EV batteries) | 2,400 | 206 | 2023-01-17 |
| Deliveroo Australia | Food | 1,700 | 120 | 2022-11-15 |
| Katerra | Construction | 1,600 | 2,434 | 2021-06-01 |
| BlockFi | Crypto | 1,000 | n/a | 2022-11-28 |
| Aura Financial | Finance | 584 | n/a | 2021-01-11 |

**Insight:** Heavy funding did not protect a company. Britishvolt, Deliveroo Australia and Katerra each shut down after raising $1.6B or more. Capital raised is not a reliable proxy for business viability.


---

## 3. Who Laid Off the Most

**Largest single-day events**

| Rank | Company | Laid off | Date |
|---|---|---|---|
| 1 | Google | 12,000 | 2023-01-20 |
| 2 | Amazon | 10,000 | 2022-11-16 |
| 3 | Ericsson | 8,500 | 2023-02-24 |
| 4 | Amazon | 8,000 | 2023-01-04 |
| 5 | Dell | 6,650 | 2023-02-06 |

**Highest cumulative layoffs per company**

| Rank | Company | Total |
|---|---|---|
| 1 | Amazon | 18,150 |
| 2 | Google | 12,000 |
| 3 | Ericsson | 8,500 |
| 4 | Dell | 6,650 |
| 5 | Booking.com | 4,601 |
| 6 | Cisco | 4,100 |
| 7 | Byju's | 4,000 |
| 7 | Carvana | 4,000 |
| 9 | Better.com | 3,900 |
| 9 | IBM | 3,900 |

**Insight:** Layoffs are concentrated in a handful of large, mature tech companies. Amazon appears twice in the top 5 events and leads on cumulative total, so single-day ranking and cumulative ranking tell different stories.

**Top 3 companies per year**

| Year | #1 | #2 | #3 |
|---|---|---|---|
| 2020 | Booking.com (4,375) | Groupon (2,800) | Airbnb (1,900) |
| 2021 | Bytedance (3,600) | Katerra (2,434) | Instacart (1,877) |
| 2022 | Amazon (10,150) | Cisco (4,100) | Carvana (4,000) |
| 2023* | Google (12,000) | Ericsson (8,500) | Amazon (8,000) |

*2023 covers Jan–early Mar only.

---

## 4. Time Trends

| Year | Total laid off |
|---|---|
| 2020 | 36,706 |
| 2021 | 10,005 |
| 2022 | 80,356 |
| 2023 (to 6 Mar) | 65,800 |

- **2020 spike:** Layoffs begin around the start of the COVID-19 pandemic. April and May 2020 are the peak months (11,193 and 10,472).
- **2021 lull:** Layoffs fall by about 73% as the economy recovered.
- **2022 surge:** Layoffs rise about 8x over 2021.
- **2023 pace:** About 65,800 layoffs in roughly 2 months, already 82% of 2022's full-year total.
- **Peak months:** Jan 2023 (39,588), Nov 2022 (26,961), Feb 2023 (23,865).
- **Rolling total:** Cumulative layoffs reach about 192,900 by March 2023, with a steep climb from Nov 2022 onward.

**Insight:** There are two distinct waves: a short COVID shock in 2020 and a larger, sustained tech-driven wave starting late 2022. The 2023 wave is the more severe one by run rate.

---

## 5. Where Layoffs Happened

**Top locations**

| Location | Total |
|---|---|
| SF Bay Area | 56,226 |
| Seattle | 19,876 |
| New York City | 17,523 |
| Stockholm | 9,982 |
| Bengaluru | 7,931 |
| Austin | 7,769 |
| Singapore | 5,550 |
| Chicago | 5,200 |
| Phoenix | 5,067 |
| Amsterdam | 4,765 |

**Top countries**

| Country | Total |
|---|---|
| United States | 130,761 |
| India | 13,292 |
| Sweden | 10,124 |
| Brazil | 5,647 |
| Singapore | 5,550 |
| Netherlands | 4,765 |
| United Kingdom | 3,671 |
| China | 3,425 |

**Insight:** The US accounts for about 68% of all layoffs, and the SF Bay Area alone for about 29%. The impact is geographically concentrated in tech hubs (SF, Seattle, NYC), with notable secondary hubs in India, Sweden and Singapore.

---

## 6. Which Industries and Company Stages Were Hit

**Top industries**

| Industry | Total |
|---|---|
| Retail | 30,545 |
| Consumer | 20,608 |
| Food | 14,045 |
| Hardware | 13,394 |
| Transportation | 13,290 |
| Other | 13,159 |
| Finance | 12,045 |
| Travel | 9,638 |

**By stage**

| Stage | Total |
|---|---|
| Post-IPO | 95,860 |
| Unknown | 29,808 |
| Acquired | 14,179 |
| Series D | 12,523 |
| Series C | 9,749 |
| Series B | 7,531 |
| Private Equity | 7,119 |
| Series E | 5,843 |

**Insights:**
- **Post-IPO companies account for about 50% of all layoffs** (95,860 of 193,367). This is driven by large public firms such as Amazon, Google, Ericsson and Dell.
- Retail, Consumer and Food lead by volume, which reflects both pandemic-era demand swings and large headcounts in those sectors.
- Early-stage companies lay off fewer people in absolute terms but are far more likely to shut down entirely.

---

## 7. Business Takeaways

1. **Scale vs. severity are different risks.** Big public companies cut the most people, while startups are the ones that disappear (100% layoffs).
2. **Funding is not a safety net.** Several $1B+ funded companies collapsed completely.
3. **The downturn is accelerating.** Early 2023 is on pace to exceed 2022, and layoffs began clustering from Nov 2022.
4. **Geographic exposure matters.** Roughly two-thirds of layoffs are in the US and nearly 30% in the SF Bay Area, so regional labor markets in tech hubs bear a disproportionate share.
5. **Post-IPO and late-stage firms are now the main source of cuts**, a sign of correcting over-hiring in the post-COVID boom rather than only early-stage failure.

---

## 8. Data Quality Caveats

- 18% of rows lack `total_laid_off` and 21% lack `percentage_laid_off`, so totals understate reality.
- Company names with multiple events (e.g. Amazon) must be aggregated, which is why cumulative and single-event rankings differ.
- The `Unknown` stage bucket (29,808) is large enough to blur stage-level conclusions.
- 2023 is a partial year (through 6 Mar), so year-over-year comparisons for 2023 are not like-for-like.
- This CSV has 1,000 rows and omits some companies referenced in the SQL comments (e.g. Quibi), so full-dataset figures may differ.
