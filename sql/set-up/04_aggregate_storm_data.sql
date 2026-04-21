-- Agreggate storm data for summaries

USE CropAnalysis;
GO

WITH storm_summary AS (
    SELECT 
        UPPER(LTRIM(RTRIM(state))) AS state,
        year,
        COUNT(*) AS total_events,
        SUM(damage_crops_clean) AS total_crop_damage
    FROM storm_data
    GROUP BY UPPER(LTRIM(RTRIM(state))), year
)
SELECT 
    c.year,
    c.state,
    c.crop,
    c.yield_bu_per_acre,
    s.total_events,
    s.total_crop_damage
FROM crop_data c
LEFT JOIN storm_summary s
    ON UPPER(LTRIM(RTRIM(c.state))) = s.state
    AND c.year = s.year
WHERE c.year BETWEEN 2015 AND 2020
ORDER BY c.state, c.year;