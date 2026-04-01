CREATE OR REPLACE TABLE `grounded-garage-476615-g1.gold.fact_reviews_sentiment` AS
SELECT
  CAST(s.listing_id AS INT64) AS listing_id,
  CAST(s.date AS INT64) AS date,
  r.review_id,
  CAST(s.sentiment_score AS FLOAT64) AS sentiment_score,
  CAST(s.sentiment_category AS STRING) AS sentiment_category,
  CAST(s.praise_tags AS STRING) AS praise_tags,
  CAST(s.complaint_tags AS STRING) AS complaint_tags

FROM `grounded-garage-476615-g1.silver.review_sentiment` s
LEFT JOIN `grounded-garage-476615-g1.silver.reviews` r
  ON s.listing_id = r.listing_id
  AND DATE(TIMESTAMP_SECONDS(CAST(
    CASE 
      WHEN s.date > 10000000000000000 THEN s.date / 1000000000 
      WHEN s.date > 10000000000000 THEN s.date / 1000000
      WHEN s.date > 10000000000 THEN s.date / 1000
      ELSE s.date 
    END AS INT64
  ))) = r.date;