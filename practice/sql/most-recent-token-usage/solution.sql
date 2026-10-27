WITH ranked as (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY owner_id
      ORDER BY last_used DESC
  ) AS rn
  FROM
    api_tokens
)
SELECT * FROM ranked
WHERE rn = 1
ORDER BY owner_id ASC
