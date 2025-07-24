With cte as ( 
Select * from Bike_share_1
union --(UNION removes duplicates while UNION ALL combines all rows including duplicates)--
Select * from Bike_share_yr_1)

Select * from cte a
left join cost_table b
on a.yr = b.yr

WITH cte AS (
    SELECT *
    FROM Bike_share_1
    UNION
    SELECT *
    FROM Bike_share_yr_1)
SELECT *
FROM cte
ORDER BY 
  CASE 
    WHEN rider_type = 'casual' THEN 0
    WHEN rider_type = 'registered' THEN 1
    ELSE 2
  END;

With cte as ( 
Select * from Bike_share_1
union 
Select * from Bike_share_yr_1)

Select dteday, season, 
a.yr,weekday, hr,
rider_type,price, riders, COGS,
riders*price as revenue,
riders*price -COGS as profit
from cte a
left join cost_table b
on a.yr = b.yr
Order by
CASE 
    WHEN rider_type = 'casual' THEN 0
    WHEN rider_type = 'registered' THEN 1
    ELSE 2
  END;
