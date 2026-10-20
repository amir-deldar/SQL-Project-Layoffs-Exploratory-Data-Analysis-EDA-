## Key Findings

- **Timeframe and two distinct waves.** The dataset spans layoff events from
  **March 2020 through March 2023**, with reductions clustered in two periods:
  the initial COVID-19 shock (Q2 2020) and the post-IPO correction
  (Q4 2022 – Q1 2023). The gap between the two waves — roughly mid-2021
  to mid-2022 — shows materially lower monthly totals.

- **January 2023 was the single heaviest month in the dataset.** A cluster of
  Big Tech announcements in the first three weeks drove the peak: Amazon
  (8,000 on Jan 4), Salesforce (8,000 on Jan 4), Microsoft (10,000 on Jan 18),
  Google (12,000 on Jan 20), and SAP (3,000 on Jan 26). No other month in the
  dataset combines this many five-figure single announcements.

- **Largest single-day layoff events.** The five biggest one-day announcements:

  | Company   | Date       | Employees laid off |
  |-----------|------------|--------------------|
  | Google    | 2023-01-20 | 12,000             |
  | Meta      | 2022-11-09 | 11,000             |
  | Amazon    | 2022-11-16 | 10,000             |
  | Microsoft | 2023-01-18 | 10,000             |
  | Ericsson  | 2023-02-24 | 8,500              |

- **Cumulative layoffs by company.** When summed across all events, Amazon
  leads at roughly **18,150**, followed by Google (12,000), Meta (11,000),
  Microsoft (10,000), and Philips (10,000 across two rounds). The pattern
  worth noting: companies that appear once in the dataset tend to appear
  again — repeated rounds are the norm, not the exception, among large firms.

- **Shutdowns despite significant capital raised.** More than **80 companies**
  laid off 100% of their workforce. The largest by reported funding was
  **Britishvolt** (flagged at ~$2,400M in this dataset), followed by
  **Quibi** (~$1,800M). Both cases show funding scale did not translate into
  product or market viability before the shutdown.

- **Funding stage as a risk signal.** Post-IPO companies account for the
  largest *absolute* layoff totals, but the *percentage* of workforce cut is
  higher, on average, among Series B–D companies. In other words: later-stage
  private companies cut less often, but cut deeper when they do.

- **Data quality as a finding in itself.** Three patterns required active
  correction before analysis was reliable: (1) `industry` was blank for a
  subset of records, recoverable via self-join on company name; (2) `Crypto`
  appeared under three label variants; (3) `country` had trailing-period
  inconsistencies (e.g., `United States.`). Without these corrections, any
  industry-level or country-level aggregation would understate totals.