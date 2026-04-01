CREATE OR REPLACE TABLE `grounded-garage-476615-g1.gold.dim_city` AS
SELECT DISTINCT INITCAP(city_name) as city_name
FROM (
  SELECT city as city_name FROM `grounded-garage-476615-g1.silver.listings`
  UNION ALL
  SELECT city as city_name FROM `grounded-garage-476615-g1.silver.pricing`
)
WHERE city_name IS NOT NULL;

CREATE OR REPLACE TABLE `grounded-garage-476615-g1.gold.dim_city` AS
WITH all_locations AS (
  SELECT 
    INITCAP(city) AS city_name,
    latitude,
    longitude
  FROM `grounded-garage-476615-g1.silver.listings`
  WHERE latitude IS NOT NULL AND longitude IS NOT NULL

  UNION ALL

  SELECT 
    INITCAP(city) AS city_name,
    lat AS latitude,
    lng AS longitude
  FROM `grounded-garage-476615-g1.silver.pricing`
  WHERE lat IS NOT NULL AND lng IS NOT NULL
)

SELECT
  city_name,
  AVG(latitude) AS city_latitude,
  AVG(longitude) AS city_longitude
FROM all_locations
GROUP BY 1;