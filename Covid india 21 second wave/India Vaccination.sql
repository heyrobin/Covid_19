select * 
from secondwaveindia..cowin_vaccine_data_districtwise$


select * 
from secondwaveindia..state_wise$

select * 
from secondwaveindia..vaccine_doses_statewise$


select sw.Last_Updated_Time,sw.State,sw.confirmed, sw.Recovered, sw.deaths, sw.Active
from secondwaveindia..state_wise$ SW
join secondwaveindia..vaccine_doses_statewise$ VS
on SW.State = VS.State
where not sw.state = 'Total'