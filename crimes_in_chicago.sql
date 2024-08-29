--REMOVE DUPLICATES
select *
into combinedTable from (
		select *
		from [dbo].[2001-2004]
		union
		select *
		from [dbo].[2005-2007]
		union
		select *
		from [dbo].[2008-2011]
		union 
		select *
		from [dbo].[2012-2017]
) as combinedTable;
with duplicate as (select *,
	ROW_NUMBER() over(
	partition by [dbo].[2001-2004].ID, [dbo].[2005-2007].ID. [dbo].[2008-2011].ID, [dbo].[2012-2017].ID
	order by [dbo].[2001-2004].ID) as RN
from combinedTable)
delete from duplicate Where RN>1;

--TOTAL CRIMES PER YEAR
select Year, count(*) as Total_crimes 
from(
        select *
		from [dbo].[2001-2004]
		union
		select *
		from [dbo].[2005-2007]
		union
		select *
		from [dbo].[2008-2011]
		union 
		select *
		from [dbo].[2012-2017]
) as ALL_years
Group by Year
order by Year;

--TOP 5 CRIMES TYPES(PRIMARY TYPE)
select top 5 primary_type, count(*) as Total_crimes
from (
		select *
		from [dbo].[2001-2004]
		union
		select *
		from [dbo].[2005-2007]
		union
		select *
		from [dbo].[2008-2011]
		union 
		select *
		from [dbo].[2012-2017]
) as All_crimes
group by primary_type
order by Total_crimes desc

--CRIMES BY DISTRICT
select District, count(*) as Total_crimes
from (
		select *
		from [dbo].[2001-2004]
		union
		select *
		from [dbo].[2005-2007]
		union
		select *
		from [dbo].[2008-2011]
		union 
		select *
		from [dbo].[2012-2017]
) as All_crimes
group by district
order by Total_crimes desc

--ARREST RATES
select Year, count(*) as Total_crimes, sum(cast(Arrest as int)) as Arrests
from(
		select *
		from [dbo].[2001-2004]
		union
		select *
		from [dbo].[2005-2007]
		union
		select *
		from [dbo].[2008-2011]
		union 
		select *
		from [dbo].[2012-2017]
) as All_crimes
group by year
order by year;

--CRIMES BY COMMUNITY AREA
select Community_Area, count(*) as Total_crimes
from(
		select *
		from [dbo].[2001-2004]
		union
		select *
		from [dbo].[2005-2007]
		union
		select *
		from [dbo].[2008-2011]
		union 
		select *
		from [dbo].[2012-2017]
) as All_crimes
group by Community_Area
order by Total_crimes;

--CRIMES BY LOCATION TYPE
select Location_Description, count(*) as Total_crimes
from(
		select *
		from [dbo].[2001-2004]
		union
		select *
		from [dbo].[2005-2007]
		union
		select *
		from [dbo].[2008-2011]
		union 
		select *
		from [dbo].[2012-2017]
) as All_crimes
group by Location_Description
order by Total_crimes DESC;

--CRIMES BY TIME OF DAY
select DATEPART(hour,date) as Hour, count(*) as Total_crimes
from(
		select *
		from [dbo].[2001-2004]
		union
		select *
		from [dbo].[2005-2007]
		union
		select *
		from [dbo].[2008-2011]
		union 
		select *
		from [dbo].[2012-2017]
) as All_crimes
group by DATEPART(hour,date)
order by hour;

--CRIMES BY DAY OF WEEK
select DATEPART(weekday,date) as Day, count(*) as Total_crimes
from(
		select *
		from [dbo].[2001-2004]
		union
		select *
		from [dbo].[2005-2007]
		union
		select *
		from [dbo].[2008-2011]
		union 
		select *
		from [dbo].[2012-2017]
) as All_crimes
group by DATEPART(weekday,date)
order by Day;

--ARREST RATES BY DISTRICT
select District, sum(cast(Arrest as int)) as Arrests, count(*) as Total_crimes
from(
		select *
		from [dbo].[2001-2004]
		union
		select *
		from [dbo].[2005-2007]
		union
		select *
		from [dbo].[2008-2011]
		union 
		select *
		from [dbo].[2012-2017]
) as All_crimes
group by District
order by Arrests;