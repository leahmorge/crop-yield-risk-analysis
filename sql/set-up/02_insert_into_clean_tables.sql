-- Import csv files and insert into clean tables

USE CropAnalysis;
GO

INSERT INTO crop_data (
    year,
    state,
    state_ansi,
    crop,
    acres_harvested,
    acres_planted,
    production_dollars,
    production_bu,
    yield_bu_per_acre
)
SELECT 
    year,
    state,
    state_ansi,
    crop,
    acres_harvested,
    acres_planted,
    production_dollars,
    production_bu,
    yield_buperacre
FROM raw_crop_import;



INSERT INTO storm_data (
    state,
    year,
    month,
    event_type,
    damage_property,
    damage_property_clean,
    damage_crops,
    damage_crops_clean
)
SELECT 
    state,
    year,
    month,
    event_type,
    damage_property,
    damage_property_clean,
    damage_crops,
    damage_crops_clean
FROM raw_storm_import;