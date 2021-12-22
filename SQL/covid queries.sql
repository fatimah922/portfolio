use portfolio ;

-- 1.death percenage for each country for each day
select location,max(total_deaths/total_cases) * 100 as death_percentage
from `covid-death-data`
group by location;
 
 -- 2. percenage of total cases for each conry from highest to lowest 
select location,date,max(total_cases),population,max(total_cases/population) * 100 as infection_rate
from `covid-death-data`
group by location
order by infection_rate desc;

 --  3.percenage of total cases for each continent from highest to lowest 
select continent,sum(total_cases),sum(population),sum(total_cases)/sum(population)*100 as infection_rate
from `covid-death-data`
where continent is not null
group by continent;

-- 4.total cases in world everyday 
select date,sum(total_cases)
from `covid-death-data`
group by date
order by date;

-- 5.rolling number of peole vaccinated 
select dea.location,dea.population,dea.date,vac.new_vaccinations,sum(new_vaccinations) over (partition by location order by location , date) as cf
from `covid-death-data` dea
join `vac-data` vac
	on dea.location = vac.location
	and dea.date = vac.date;

-- 6. percentage of peole who have both vaccine doses 
select location,max(total_vaccinations),population, max((total_vaccinations)/population/2) *100 as fully_vacinated
from `vac-data`
group by location;

-- 7.highst daily tests
select location,max(new_tests)
from `vac-data`
group by location










 



