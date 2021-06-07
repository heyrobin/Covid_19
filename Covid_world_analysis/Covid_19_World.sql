-- creating tables

IF OBJECT_ID('Covid_19_World') IS NOT NULL DROP TABLE Covid_19_World

CREATE TABLE Covid_19_World
(iso_code NVARCHAR(200),
continent  NVARCHAR(200),
location	 NVARCHAR(200),
date	 DATE,
total_cases	FLOAT,
new_cases  FLOAT,
new_cases_smoothed  FLOAT,
total_deaths	FLOAT,
new_deaths	FLOAT,
new_deaths_smoothed	FLOAT,
total_cases_per_million	FLOAT,
new_cases_per_million	FLOAT,
new_cases_smoothed_per_million	FLOAT,
total_deaths_per_million	FLOAT,
new_deaths_per_million	FLOAT,
new_deaths_smoothed_per_million	FLOAT,
total_vaccinations	FLOAT,
people_vaccinated	FLOAT,
people_fully_vaccinated	FLOAT,
new_vaccinations	FLOAT,
new_vaccinations_smoothed	FLOAT,
total_vaccinations_per_hundred	FLOAT,
people_vaccinated_per_hundred	FLOAT,
people_fully_vaccinated_per_hundred	FLOAT,
new_vaccinations_smoothed_per_million	FLOAT,
stringency_index	FLOAT,
population	FLOAT,
population_density	FLOAT,
median_age	FLOAT,
aged_65_older	FLOAT,
aged_70_older	FLOAT,
gdp_per_capita	FLOAT,
extreme_poverty	FLOAT,
cardiovasc_death_rate	FLOAT,
diabetes_prevalence	FLOAT,
female_smokers	FLOAT,
male_smokers	FLOAT,
handwashing_facilities	FLOAT,
hospital_beds_per_thousand	FLOAT,
life_expectancy	FLOAT)

DROP TABLE Covid_19_World


CREATE TABLE Covid_19_World
(iso_code NVARCHAR(200),
continent  NVARCHAR(200),
location	 NVARCHAR(200),
date	 NVARCHAR(200),
total_cases	NVARCHAR(200),
new_cases  NVARCHAR(200),
new_cases_smoothed  NVARCHAR(200),
total_deaths	NVARCHAR(200),
new_deaths	NVARCHAR(200),
new_deaths_smoothed	NVARCHAR(200),
total_cases_per_million	NVARCHAR(200),
new_cases_per_million	NVARCHAR(200),
new_cases_smoothed_per_million	NVARCHAR(200),
total_deaths_per_million	NVARCHAR(200),
new_deaths_per_million	NVARCHAR(200),
new_deaths_smoothed_per_million	NVARCHAR(200),
total_vaccinations	NVARCHAR(200),
people_vaccinated	NVARCHAR(200),
people_fully_vaccinated	NVARCHAR(200),
new_vaccinations	NVARCHAR(200),
new_vaccinations_smoothed	NVARCHAR(200),
total_vaccinations_per_hundred	NVARCHAR(200),
people_vaccinated_per_hundred	NVARCHAR(200),
people_fully_vaccinated_per_hundred	NVARCHAR(200),
new_vaccinations_smoothed_per_million	NVARCHAR(200),
stringency_index	NVARCHAR(200),
population	NVARCHAR(200),
population_density	NVARCHAR(200),
median_age	NVARCHAR(200),
aged_65_older	NVARCHAR(200),
aged_70_older	NVARCHAR(200),
gdp_per_capita	NVARCHAR(200),
extreme_poverty	NVARCHAR(200),
cardiovasc_death_rate	NVARCHAR(200),
diabetes_prevalence	NVARCHAR(200),
female_smokers	NVARCHAR(200),
male_smokers	NVARCHAR(200),
handwashing_facilities	NVARCHAR(200),
hospital_beds_per_thousand	NVARCHAR(200),
life_expectancy	NVARCHAR(200))


SELECT *
From Covid_19_World

BULK INSERT Covid_19_World 
FROM 'E:\Data Analysis Study\Project\Projects_Data_Analysis\Covid_world_analysis\owid-covid-data.csv'
WITH 
(FORMAT='CSV',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n');

--SELECT * FROM Covid_19_World