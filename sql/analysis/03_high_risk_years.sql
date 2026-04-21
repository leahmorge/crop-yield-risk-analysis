-- Years with both high damage and yield decline

SELECT *,
    CASE 
        WHEN yield_change < -40 THEN 'Severe'
        WHEN yield_change < -20 THEN 'Moderate'
        ELSE 'Normal'
    END AS severity
FROM final_data
WHERE yield_change < -20
  AND total_crop_damage > 1000000;