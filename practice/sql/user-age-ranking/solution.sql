WITH ranked AS (
  SELECT
    user_id,
    DENSE_RANK() OVER(
      -- PARTITION BY age_bucket
      ORDER BY age_bucket DESC NULLS LAST
    ) AS rk
  FROM users
)
SELECT
  user_id,
  rk
FROM ranked
