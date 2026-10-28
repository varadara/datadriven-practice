SELECT
  u.user_id,
  u.username,
  (SELECT 
    SUM(total_amount)
   FROM
     transactions t
   WHERE t.user_id = u.user_id
  ) AS lifetime_spend
FROM
  users u
ORDER BY lifetime_spend DESC NULLS LAST
LIMIT 10
