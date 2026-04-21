-- Creates final dataset used for all analyses

USE CropAnalysis;
GO

CREATE OR ALTER VIEW final_data AS
WITH crop_clean AS (
    SELECT 
        UPPER(LTRIM(RTRIM(state))) AS state,
        crop,
        year,
        AVG(yield_bu_per_acre) AS yield_bu_per_acre
    FROM crop_data
    GROUP BY UPPER(LTRIM(RTRIM(state))), crop, year
),
storm_summary AS (
    SELECT 
        UPPER(LTRIM(RTRIM(state))) AS state,
        year,
        COUNT(*) AS total_events,
        SUM(damage_crops_clean) AS total_crop_damage
    FROM storm_data
    GROUP BY UPPER(LTRIM(RTRIM(state))), year
),
analysis_base AS (
    SELECT 
        c.state,
        c.crop,
        c.year,
        c.yield_bu_per_acre,
        COALESCE(s.total_events, 0) AS total_events,
        COALESCE(s.total_crop_damage, 0) AS total_crop_damage
    FROM crop_clean c
    LEFT JOIN storm_summary s
        ON c.state = s.state
        AND c.year = s.year
    WHERE c.year BETWEEN 2014 AND 2020
),
yield_analysis AS (
    SELECT 
        state,
        crop,
        year,
        yield_bu_per_acre, 
        LAG(yield_bu_per_acre) OVER (
            PARTITION BY state, crop
            ORDER BY year
        ) AS prev_yield,
        yield_bu_per_acre - LAG(yield_bu_per_acre) OVER (
            PARTITION BY state, crop
            ORDER BY year
        ) AS yield_change,
        total_events,
        total_crop_damage
    FROM analysis_base
)
SELECT *
FROM yield_analysis
WHERE year >= 2015;