CREATE OR REPLACE TABLE `grounded-garage-476615-g1.gold.dim_listing_info` AS
SELECT
  id AS listing_id,
  INITCAP(city) AS city_name, 
  name,
  listing_url,
  description,
  neighbourhood,
  host_id,
  host_name,
  
  DATE(TIMESTAMP_SECONDS(
    CAST(
      CASE 
        WHEN host_since > 10000000000000000 THEN host_since / 1000000000 
        WHEN host_since > 10000000000000 THEN host_since / 1000000
        WHEN host_since > 10000000000 THEN host_since / 1000
        ELSE host_since 
      END AS INT64
    )
  )) AS host_since, 

  latitude,
  longitude,
  property_type,
  room_type,
  accommodates,
  bathrooms_text,
  bedrooms,
  amenities
FROM `grounded-garage-476615-g1.silver.listings`;