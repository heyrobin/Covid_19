
Select * 
from Project_cov_s_wave..Deaths$
order by 3,4


Select * 
from Project_cov_s_wave..Vaccine$
order by 3,4

Select distinct(date),location,population, total_cases, (total_cases/population)*100 as infected_population_percentage  
from Project_cov_s_wave..Deaths$
where location like 'india%'

--total cases vs total deaths
Select distinct(date),location,population, total_cases, new_cases,total_deaths, (total_deaths/total_cases)*100 as total_death_perc
from Project_cov_s_wave..Deaths$
where location like '%india%'
order by 2,1

--countries with highest infection rate with population (percentage)
Select location,population as total_population, max(total_cases) as cases,MAX(total_cases/population)*100 as percentage_cases
From Project_cov_s_wave..Deaths$
where continent is not null
group by location,population
order by percentage_cases desc

--countries with highest death counts(percentage)
Select location,population as total_population, max(total_cases) as cases,MAX(total_deaths/population)*100 as percentage_deaths
From Project_cov_s_wave..Deaths$
where continent is not null
group by location,population
order by percentage_deaths desc