select *
from [dbo].[customer personality]

--Demographic Analysis
--Age distribution:
with Age_groups as (
select
case
   when Year_Birth < 1980 then 'older'
   when Year_Birth >= 1980 AND Year_birth < 1990 then 'middle-aged'
   else 'younger'
end as Age_group
From [dbo].[customer personality]
)
select Age_group,
  COUNT(*) as count
from Age_groups
group by Age_group
order by count;

--Education level distribution:
select Education, count(*) as count
from [dbo].[customer personality]
group by Education;

--Marital status distribution
Select Marital_Status, count(*) as count
from [dbo].[customer personality]
group by Marital_Status;

--INCOME AND SPENDING ANALYSIS
--Income distribution:
with Income_ranges as (
select
case
   when Income < 30000 then 'low'
   when Income >= 30000 AND Income < 60000 then 'medium'
   else 'high'
end as Income_group
From [dbo].[customer personality])
select Income_group,
  count(*) as count
From Income_ranges
group by Income_group
order by count;

--Average spending on products
select
  AVG(MntWines) as AVG_WINE,
  AVG(MntFruits) as AVG_FRUITS,
  AVG(MntMeatProducts) as AVG_MEAT,
  AVG(MntFishProducts) as AVG_FISH,
  AVG(MntSweetProducts) as AVG_SWEET,
  AVG(MntGoldProds) as AVG_GOLD
from [dbo].[customer personality];

--CAMPAIGN RESPONSE ANALYSIS
--Campaign acceptance rates:
select 
   sum(AcceptedCmp1) as cmp1_accepted,
   sum(AcceptedCmp2) as cmp2_accepted,
   sum(AcceptedCmp3) as cmp3_accepted,
   sum(AcceptedCmp4) as cmp4_accepted,
   sum(AcceptedCmp5) as cmp5_accepted
from [dbo].[customer personality];

--response to last campaign:
select 
   Response,
   COUNT(*) as count
from [dbo].[customer personality]
group by Response;

--PURCHASE BEHAVIOUR ANALYSIS
--Number of purchases made with a discount
select
  count (*) as count,
  sum(NumDealsPurchases) as total_discount_purchases
from [dbo].[customer personality];

--Purchase Channels
select 
  sum(NumCatalogPurchases) as Catolgue_Purchases,
  sum(NumStorePurchases) as Store_Purchases,
  sum(NumWebPurchases) as Website_Purchases
from [dbo].[customer personality];

--WEBSITE VISITS
select
  sum(NumWebVisitsMonth) as total_visits
from [dbo].[customer personality];

--COST AND REVENUE ANALYSIS
select
  avg(Z_CostContact) as AVG_COST,
  avg(Z_Revenue) as AVG_REVENUE
from [dbo].[customer personality];