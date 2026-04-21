-- Count of high-risk years by state

SELECT 
    state,
    severity,
    COUNT(*) AS count
FROM (
    SELECT *,
        CASE 
            WHEN yield_change < -40 THEN 'Severe'
            WHEN yield_change < -20 THEN 'Moderate'
            ELSE 'Normal'
        END AS severity
    FROM final_data
) t
WHERE severity <> 'Normal'
GROUP BY state, severity
ORDER BY state, severity;