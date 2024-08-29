select *
from [dbo].[80 cereals];

--TOP 5 CEREALS BY RATING
select top 5
 name, round(rating, 2) as rating
from [dbo].[80 cereals]
order by rating DESC;

--HIGHEST CALORIE CEREALS
select top 5
 name, calories
from [dbo].[80 cereals]
order by calories DESC;

--LOWEST SUGAR LEVEL
select top 5
 name, sugars
from [dbo].[80 cereals]
order by sugars ASC;

--HIGHEST FIBER CONTENT
select top 5
 name, fiber
from [dbo].[80 cereals]
order by fiber DESC;

--MANUFACTURER-WISE CEREAL COUNT
select mfr as Manufacturer, count(*) as count
from [dbo].[80 cereals]
Group by mfr
order by count;

--TYPE-WISE CEREAL COUNT (HOT/COLD)
select type, count(*) as count
from [dbo].[80 cereals]
group by type;

--AVERAGE NUTRITION FACTS
select
  avg(calories) as AVG_CALORIES,
  avg(protein) as AVG_PROTEIN,
  avg(fat) as AVG_FAT,
  avg(sodium) as AVG_SODIUM,
  avg(potass)as AVG_POTASSIUM,
  ROUND(avg(fiber), 2) as AVG_FIBER,
  avg(vitamins)as AVG_VITAMINS,
  ROUND(avg(carbo), 2)as AVG_CARBO,
  avg(sugars)as AVG_SUGARS
from [dbo].[80 cereals]

--TOP RATED CEREALS BY NUTRITION FACTS
select top 10
 name, calories, protein,fat,sugars,potass,carbo,fiber,sodium,vitamins, round(rating,0) Rating
from [dbo].[80 cereals]
order by rating DESC