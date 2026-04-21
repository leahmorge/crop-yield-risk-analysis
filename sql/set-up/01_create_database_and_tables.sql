-- Create new database and clean tables

CREATE DATABASE CropAnalysis;
GO

USE CropAnalysis;
GO

CREATE TABLE crop_data (
    year INT,
    state VARCHAR(50),
    state_ansi INT,
    crop VARCHAR(50),
    acres_harvested FLOAT,
    acres_planted FLOAT,
    production_dollars FLOAT,
    production_bu FLOAT,
    yield_bu_per_acre FLOAT
);

CREATE TABLE storm_data (
    state VARCHAR(50),
    year INT,
    month VARCHAR(50),
    event_type VARCHAR(100),
    damage_property VARCHAR(50),
    damage_property_clean FLOAT,
    damage_crops VARCHAR(50),
    damage_crops_clean FLOAT
);

