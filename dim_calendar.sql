CREATE OR REPLACE TABLE `grounded-garage-476615-g1.gold.dim_calendar` AS
WITH date_range AS (
  SELECT
    date
  FROM UNNEST(GENERATE_DATE_ARRAY('2025-01-01', '2026-12-31', INTERVAL 1 DAY)) AS date
)
SELECT
  date,
  EXTRACT(YEAR FROM date) AS year,
  FORMAT_DATE('%B', date) AS month_name,
  EXTRACT(MONTH FROM date) AS month_number,
  FORMAT_DATE('%A', date) AS day_of_week_name,
  EXTRACT(DAYOFWEEK FROM date) AS day_of_week,
  CASE WHEN EXTRACT(DAYOFWEEK FROM date) IN (1, 7) THEN TRUE ELSE FALSE END AS is_weekend
FROM date_range;