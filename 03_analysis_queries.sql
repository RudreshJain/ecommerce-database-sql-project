USE myshop;
SELECT * FROM customer;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;

-- Revenue by Product
SELECT p.product_name ,SUM(oi.quantity*p.price) AS revenue
FROM order_items oi
JOIN products P ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Top Customers By Spend
SELECT c.name,SUM(p.amount) AS total_spent
 FROM customer c
 JOIN orders o ON c.customer_id = o.customer_id
 JOIN payments p ON o.order_id = p.order_id
 GROUP BY c.name
 ORDER BY total_spent DESC;
 
--  Best Selling Products
SELECT p.product_name, SUM(oi.quantity) AS total_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

-- Cancelled Orders Count
SELECT COUNT(*) AS cancelled_orders
FROM orders
WHERE order_status = 'cancelled';

 
 



