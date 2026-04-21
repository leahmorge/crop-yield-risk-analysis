-- Join crop_data and strom_data using state and year columns

USE CropAnalysis;
GO

SELECT 
    c.year,
    c.state,
    c.crop,
    c.yield_bu_per_acre,
    s.event_type,
    s.damage_crops_clean
FROM crop_data c
JOIN storm_data s
    ON c.state = s.state
    AND c.year = s.year;