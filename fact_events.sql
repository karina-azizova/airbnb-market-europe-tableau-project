CREATE OR REPLACE TABLE `grounded-garage-476615-g1.gold.fact_events` AS
SELECT
  Event_ID AS event_id,
  INITCAP(City) AS city_name,
  
  DATE(TIMESTAMP_SECONDS(
    CAST(
      CASE 
        WHEN Start_Date > 10000000000000000 THEN Start_Date / 1000000000 
        WHEN Start_Date > 10000000000000 THEN Start_Date / 1000000
        WHEN Start_Date > 10000000000 THEN Start_Date / 1000
        ELSE Start_Date 
      END AS INT64
    )
  )) AS start_date,

  DATE(TIMESTAMP_SECONDS(
    CAST(
      CASE 
        WHEN End_Date > 10000000000000000 THEN End_Date / 1000000000 
        WHEN End_Date > 10000000000000 THEN End_Date / 1000000
        WHEN End_Date > 10000000000 THEN End_Date / 1000
        ELSE End_Date 
      END AS INT64
    )
  )) AS end_date,
  
  Event_Name AS event_name,
  Category AS category,
  Venue AS venue,
  Attendees_Estimate AS attendees_estimate,
  Foreign_Attendees_Estimate AS foreign_attendees_estimate,
  Latitude AS venue_latitude,
  Longitude AS venue_longitude
FROM `grounded-garage-476615-g1.silver.events`;