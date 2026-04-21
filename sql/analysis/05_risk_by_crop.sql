-- Compare crop vulnerability

SELECT 
    crop,
    COUNT(CASE WHEN yield_change < -20 THEN 1 END) AS high_risk_years,
    AVG(yield_change) AS avg_yield_change
FROM final_data
GROUP BY crop
ORDER BY high_risk_years DESC;