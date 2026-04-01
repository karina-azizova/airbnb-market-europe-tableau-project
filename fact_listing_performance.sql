CREATE OR REPLACE TABLE `grounded-garage-476615-g1.gold.fact_listing_performance` AS
SELECT
  id AS listing_id,
  latitude, 
  longitude,
  
  price AS price_current,
  estimated_occupancy_l365d,
  estimated_revenue_l365d,
  number_of_reviews,
  reviews_per_month,
  
  review_scores_rating,
  review_scores_cleanliness,
  review_scores_location
FROM `grounded-garage-476615-g1.silver.listings`;