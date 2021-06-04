
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
Select location,population as total_population, max(total_cases) as cases, MAX(total_deaths) as deaths, MAX(total_deaths/population)*100 as death_percentage
From Project_cov_s_wave..Deaths$
where continent is not null
group by location,population
order by death_percentage  desc

--countries total death counts per population
select location, max(cast(total_deaths as int)) as Deaths
from Project_cov_s_wave..Deaths$
where continent is not null
group by location
order by Deaths desc

--continent total death counts
select continent, max(convert(int,total_deaths)) as Deaths
from Project_cov_s_wave..Deaths$
where continent is not null
group by continent
order by Deaths desc

--global numbers dates
Select date,sum(new_cases) as cases,sum(cast(new_deaths as int)) as deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as percentage_deaths
from Project_cov_s_wave..Deaths$
where continent is not null
group by date
order by 1,2


--check
Select *
from Project_cov_s_wave..Deaths$
order by new_cases desc

--global numbers 
Select sum(new_cases) as cases,sum(cast(new_deaths as int)) as deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as percentage_deaths
from Project_cov_s_wave..Deaths$
where continent is not null
--group by date
order by 1,2


-- joining tables
Select *
from Project_cov_s_wave..Deaths$ D
join Project_cov_s_wave..Vaccine$ V
	on D.location = V.location
	and D.date = v.date


--total amount of people in the world vaccinated
Select D.location, max(D.population) as population, 
max(total_cases) as cases,
max(convert(int,V.people_fully_vaccinated)) as vaccinated, 
max(convert(int,V.people_fully_vaccinated))/max(population)*100 as percentage

From Project_cov_s_wave..Deaths$ D
join Project_cov_s_wave..Vaccine$ V
	on D.location = V.location
	and D.date = v.date
	where D.continent is not null --and D.location = 'albania'
	Group by D.location
	order by population desc

--china vacccination checker
Select D.location, max(D.population) as population, 
max(total_cases) as cases,
max(convert(int,V.people_fully_vaccinated)) as vaccinated, 
max(convert(int,V.people_fully_vaccinated))/max(population)*100 as percentage

From Project_cov_s_wave..Deaths$ D
join Project_cov_s_wave..Vaccine$ V
	on D.location = V.location
	and D.date = v.date
	where D.continent is not null and people_fully_vaccinated is null
	Group by D.location
	order by population desc


Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From Deaths$ dea
Join Project_cov_s_wave..Vaccine$ vac
	On dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3




