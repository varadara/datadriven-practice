WITH ranked AS(
  SELECT 
    job_name,
    started,
    rows_done,
    ROW_NUMBER() OVER (
      PARTITION BY job_name
      ORDER BY started ASC
    ) AS rn
    FROM batch_jobs
)
SELECT
  job_name,
  rows_done
FROM ranked
WHERE rn = 1
