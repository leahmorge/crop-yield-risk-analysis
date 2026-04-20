# Crop Yield Risk Analysis (SQL Project)

## Overview
This project analyzes U.S. crop yield data alongside storm event data to identify patterns, anomalies, and potential risk factors affecting agricultural production.

Using SQL Server (T-SQL), I integrated multi-source datasets, cleaned and structured the data, and performed analytical queries to evaluate relationships between weather events and crop yield fluctuations.

---

## Objectives
- Identify significant yield declines across states and crops
- Analyze the relationship between storm damage and yield changes
- Detect high-risk years and regions
- Evaluate variability and stability in crop production

---

## Tools & Skills Demonstrated
- SQL Server (T-SQL)
- Data cleaning and transformation
- Aggregation and joins
- Window functions (LAG)
- CTEs (Common Table Expressions)
- Risk classification and anomaly detection

---

## Data Sources

- Crop Data: USDA National Agricultural Statistics Service (NASS)  
- Storm Data: NOAA Storm Events Database  

The crop dataset spans multiple decades, while storm event data was available for 2015–2020. The analysis was limited to overlapping years to ensure consistency. Data was cleaned and aggregated to the state–crop–year level prior to analysis.

---

## Key Analyses

### 1. Biggest Yield Drops
Identified the largest year-over-year declines in crop yield using window functions.

### 2. High-Risk Years
Filtered for years with both significant yield drops and serious storm-related damage.

### 3. Risk by State
Counted how often each state experienced major yield declines.

### 4. Risk by Crop
Compared vulnerability across crop types.

### 5. Damage vs Yield Relationship
Analyzed the relationship between storm-related crop damage and yield changes by grouping damage levels and comparing average yield shifts. This helped evaluate whether higher levels of reported damage were associated with greater declines in crop productivity.

---

## Key Findings
- Several states experienced repeated yield volatility over the study period.
- High storm damage often aligned with yield declines, though not universally.
- Some states showed consistent stability, indicating regional resilience.
- Not all yield drops were explained by storm data, suggesting additional contributing factors.

---

## Data Notes
- Crop data ranged from 1950–2025, but analysis was limited to 2015–2020 to match storm data availability.
- Missing values were preserved to avoid introducing bias.
- Data was aggregated to the state–crop–year level for consistency.

---

## Limitations

- Storm data coverage was limited to 2015–2020
- Not all yield declines correspond to recorded storm damage
- Additional environmental or economic factors may influence yield variability

---

## How to Run
1. Use SQL Server / SSMS
2. Run the pipeline script to create the analysis dataset (view)
3. Execute analysis queries in the `sql/` folder

---

## Author
Leah Morgenstern
