SELECT
  products.name AS product_name,
  ROUND(SUM(order_items.sale_price), 2) AS total_revenue
FROM bigquery-public-data.thelook_ecommerce.order_items AS order_items
JOIN bigquery-public-data.thelook_ecommerce.products AS products
  ON order_items.product_id = products.id
WHERE order_items.status = 'Complete'
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;
