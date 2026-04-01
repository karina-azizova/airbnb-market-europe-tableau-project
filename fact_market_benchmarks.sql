CREATE OR REPLACE TABLE `grounded-garage-476615-g1.gold.fact_market_benchmarks` AS
SELECT
  INITCAP(city) AS city_name,
  room_type,
  day_type, 
  
  AVG(realSum) AS avg_market_price,
  AVG(guest_satisfaction_overall) AS avg_guest_satisfaction,
  COUNT(*) AS sample_size
FROM `grounded-garage-476615-g1.silver.pricing`
GROUP BY 1, 2, 3;