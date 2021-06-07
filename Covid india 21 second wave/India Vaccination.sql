select * 
from secondwaveindia..cowin_vaccine_data_districtwise$


select * 
from secondwaveindia..state_wise$

select * 
from secondwaveindia..vaccine_doses_statewise$

Select population 
from secondwaveindia..StatesPopulation


select sw.Last_Updated_Time,sw.State,sw.confirmed, sw.Recovered, sw.deaths, sw.Active
from secondwaveindia..state_wise$ SW
join secondwaveindia..vaccine_doses_statewise$ VS
on SW.State = VS.State
where not sw.state = 'Total'


select State,State_Code,max(convert(int,16/01/2021))
from secondwaveindia..cowin_vaccine_data_districtwise$
Group by State,State_Code


select sw.Last_Updated_Time,sw.State,sp.population, sw.Confirmed,sw.Active,sw.Recovered,sw.Deaths,(Recovered/population)*100 as Re_per
from secondwaveindia..state_wise$ sw
join secondwaveindia..StatesPopulation sp
on sw.State = sp.State
where not sw.State = 'Total'
order by Re_per desc