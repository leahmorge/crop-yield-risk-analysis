-- Identify largest year-over-year yield declines

SELECT TOP 20 *,
    CASE 
        WHEN yield_change < -40 THEN 'Severe'
        WHEN yield_change < -20 THEN 'Moderate'
        ELSE 'Normal'
    END AS severity
FROM final_data
WHERE yield_change IS NOT NULL
ORDER BY yield_change ASC;