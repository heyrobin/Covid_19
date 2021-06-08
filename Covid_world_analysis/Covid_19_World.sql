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

--DROP TABLE Covid_19_World

BULK INSERT Covid_19_World 
FROM 'E:\Data Analysis Study\Project\Projects_Data_Analysis\Covid_world_analysis\owid-covid-data.csv'
WITH 
(FORMAT='CSV',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n');



CREATE VIEW COVID_WORLD_EXCEL AS

SELECT continent,location,date,total_cases,new_cases,total_deaths,new_deaths,total_vaccinations,people_vaccinated,people_fully_vaccinated,new_vaccinations,population,median_age,cardiovasc_death_rate,diabetes_prevalence
From Covid_19_World



--SELECT * FROM COVID_WORLD_EXCEL


--DROP VIEW COVID_WORLD_EXCEL


--CREATING A STORE PROCEDURE

CREATE PROCEDURE Covid_19_World_daily AS

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

-- IMPORT DATA
BULK INSERT Covid_19_World 
FROM 'E:\Data Analysis Study\Project\Projects_Data_Analysis\Covid_world_analysis\owid-covid-data.csv'
WITH 
(FORMAT='CSV',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n');

---------------------------exec Covid_19_World_daily

select location,sum(total_cases) as total
from Covid_19_World
--where location = 'argentina'
where continent is  null
group by location
order by total desc

