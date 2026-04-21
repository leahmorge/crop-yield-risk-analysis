-- Agreggate crop data to fix row repeatition

WITH crop_clean AS (
    SELECT 
        state,
        crop,
        year,
        AVG(yield_bu_per_acre) AS yield_bu_per_acre
    FROM crop_data
    GROUP BY state, crop, year
)
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
    ) AS yield_change
FROM crop_clean;