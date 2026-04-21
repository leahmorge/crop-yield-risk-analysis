-- Compare damage vs yield correlations

SELECT 
    CASE 
        WHEN total_crop_damage = 0 THEN 'No Damage'
        WHEN total_crop_damage < 1000000 THEN 'Low Damage'
        ELSE 'High Damage'
    END AS damage_level,
    AVG(yield_change) AS avg_yield_change
FROM final_data
WHERE yield_change IS NOT NULL
GROUP BY 
    CASE 
        WHEN total_crop_damage = 0 THEN 'No Damage'
        WHEN total_crop_damage < 1000000 THEN 'Low Damage'
        ELSE 'High Damage'
    END
ORDER BY avg_yield_change;