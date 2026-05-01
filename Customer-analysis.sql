SELECT
  users.country AS country,
  COUNT(DISTINCT order_items.order_id) AS total_orders,
  ROUND(SUM(order_items.sale_price), 2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS order_items
JOIN `bigquery-public-data.thelook_ecommerce.users` AS users
  ON order_items.user_id = users.id
WHERE order_items.status = 'Complete'
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;
