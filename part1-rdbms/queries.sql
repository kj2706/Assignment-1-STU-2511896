SELECT c.customer_name,
SUM(p.price * oi.quantity) AS total_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE c.city='Mumbai'
GROUP BY c.customer_name;
Q2
-- Q2: Top 3 products by quantity sold

SELECT p.product_name,
SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 3;
Q3
-- Q3: Sales reps and unique customers

SELECT sales_rep,
COUNT(DISTINCT customer_id) AS customer_count
FROM orders
GROUP BY sales_rep;
Q4
-- Q4: Orders where value > 10000

SELECT o.order_id,
SUM(p.price * oi.quantity) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING total_value > 10000
ORDER BY total_value DESC;
Q5
-- Q5: Products never ordered

SELECT product_name
FROM products
WHERE product_id NOT IN
(SELECT product_id FROM order_items);

