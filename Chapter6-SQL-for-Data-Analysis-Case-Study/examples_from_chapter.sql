SELECT p.product_id, p.product_name, p.description, p.product_price, p.discounted_price
FROM products p
JOIN product_categories c ON p.category_id_fk = c.category_id
WHERE c.category_name = 'Clothing';

SELECT COUNT(*) AS 'Number of Customers' FROM customers;

SELECT payment_method_id_fk, COUNT(*) AS Times_Used
FROM orders 
GROUP BY payment_method_id_fk 
ORDER BY Times_Used DESC
LIMIT 5;

SELECT o.payment_method_id_fk, p.payment_method_name, COUNT(*) AS Times_Used
FROM orders o 
JOIN payment_methods p 
ON o.payment_method_id_fk = p.payment_method_id 
GROUP BY o.payment_method_id_fk, p.payment_method_name 
ORDER BY Times_Used DESC 
LIMIT 5;


SELECT p.product_id, p.product_name, COUNT(o.orders_id) as number_of_orders, COUNT(DISTINCT o.customer_id_fk) as unique_customers, AVG(pr.rating) as average_rating
FROM products p
JOIN orders o ON p.product_id = o.product_id_fk
JOIN product_reviews pr ON p.product_id = pr.product_id_fk
WHERE p.category_id_fk = (SELECT category_id FROM product_categories WHERE category_name = 'Clothing')
GROUP BY p.product_id, p.product_name
ORDER BY number_of_orders DESC, average_rating DESC;

SELECT product_id_fk, AVG(rating) AS Average_Rating
FROM product_reviews 
GROUP BY product_id_fk
ORDER BY Average_Rating DESC
LIMIT 10;

SELECT product_id_fk, AVG(rating) AS average_rating, GROUP_CONCAT(review SEPARATOR '|| ') AS reviews
FROM product_reviews
GROUP BY product_id_fk
HAVING AVG(rating) > 4
ORDER BY average_rating DESC;

SELECT p.product_id, p.product_name,
SUM(o.quantity) as total_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id_fk
WHERE p.product_id IN (2,4,8,10,11,13,14,16,18,20,21,25,28,32,33,35,36,38,40,59,69,15)
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC;

#8,14,18,20,28,32,33,59,69 not included in results above

SELECT p.product_id, p.product_name, o.total_sold, r.average_rating
FROM products p 
JOIN (
  SELECT o.product_id_fk, SUM(o.quantity) AS total_sold
  FROM orders o
  WHERE o.product_id_fk IN (
    SELECT product_id 
    FROM products 
    WHERE product_id IN  (2,4,10,11,13,15,16,21,25,35,36,38,40)
  )
  GROUP BY o.product_id_fk
)
AS o on p.product_id= o.product_id_fk
JOIN (
  SELECT product_id_fk, 
  AVG(rating) AS average_rating 
  FROM product_reviews
  GROUP BY product_id_fk
)
AS r ON p.product_id= r.product_id_fk 
ORDER BY o.total_sold DESC;

SELECT p.product_id, p.product_name, o.total_sold, r.average_rating
FROM products p 
JOIN (
  SELECT o.product_id_fk, SUM(o.quantity) AS total_sold
  FROM orders o
  WHERE o.product_id_fk IN (
    SELECT product_id 
    FROM products 
  )
  GROUP BY o.product_id_fk
)
AS o on p.product_id= o.product_id_fk
JOIN (
  SELECT product_id_fk, 
  AVG(rating) AS average_rating 
  FROM product_reviews
  GROUP BY product_id_fk
)
AS r ON p.product_id= r.product_id_fk 
ORDER BY o.total_sold DESC;

SELECT ROUND(
  (
    SELECT COUNT(DISTINCT product_id_fk) 
    FROM product_reviews
  ) 
  / COUNT(*) 
  * 100, 2
) as percentage_prods_with_reviews
FROM products;

SELECT p.product_id, p.product_name,
SUM(o.quantity) as total_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id_fk
WHERE p.is_on_discount = TRUE
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC;

SELECT p.product_id, p.product_name, p.discounted_price,
SUM(o.quantity) as total_sold,
SUM(o.quantity * p.discounted_price) as total_revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id_fk
WHERE p.is_on_discount = TRUE
GROUP BY p.product_id, p.product_name, p.discounted_price
ORDER BY total_sold DESC, total_revenue DESC;

SELECT p.product_id, p.product_name, p.product_price,
SUM(o.quantity) as total_sold,
SUM(o.quantity * p.product_price) as total_revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id_fk
WHERE p.is_on_discount = FALSE
GROUP BY p.product_id, p.product_name, p.discounted_price
ORDER BY total_sold DESC, total_revenue DESC;

SELECT customer_id_fk, CONCAT(c.first_name, ' ', c.last_name) AS CustomerName, SUM(total_cost) as total_spent 
FROM orders o
JOIN customers c 
ON o.customer_id_fk = c.customer_id 
GROUP BY customer_id_fk
HAVING total_spent >= 5000 
ORDER BY total_spent DESC; 

SELECT p.product_id, p.product_name, p.description, p.product_price, p.discounted_price, SUM(o.quantity) AS sales
FROM products p
JOIN product_categories c ON p.category_id_fk = c.category_id
JOIN orders o ON p.product_id = o.product_id_fk
WHERE c.category_name = 'Clothing'
GROUP BY p.product_id, p.product_name, p.description, p.product_price, p.discounted_price
ORDER BY sales DESC;

SELECT p.product_name, p.product_id, c.category_id, c.category_name, SUM(o.total_cost) AS Total_Revenue, SUM(o.quantity) AS Total_Sales
FROM products p
JOIN product_categories c ON p.category_id_fk = c.category_id
JOIN orders o ON p.product_id = o.product_id_fk
GROUP BY p.product_name, p.product_id, c.category_id, c.category_name
ORDER BY Total_Revenue DESC, Total_Sales DESC
LIMIT 5;

WITH country_product_sales AS (
  SELECT s.country, p.product_name, SUM(o.quantity) AS total_quantity
  FROM orders o
  JOIN shipping_information s ON s.orders_id_fk = o.orders_id
  JOIN products p ON p.product_id = o.product_id_fk
  GROUP BY s.country, p.product_name
)
SELECT cps.country, cps.product_name, cps.total_quantity
FROM country_product_sales cps
RIGHT JOIN (
  SELECT s.country, MAX(cps.total_quantity) AS max_quantity
  FROM country_product_sales cps
  JOIN shipping_information s ON s.country = cps.country
  GROUP BY s.country
) AS max_qty ON cps.country = max_qty.country AND cps.total_quantity = max_qty.max_quantity
ORDER BY cps.country;

SELECT AVG(
  DATEDIFF(actual_delivery, expected_delivery)
) AS Late_Delivery_Days
FROM shipping_information;

SELECT YEAR(order_date) as year, MONTH(order_date) as month, SUM(total_cost) as monthly_sales 
FROM orders 
WHERE order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR) 
GROUP BY year, month
ORDER BY year DESC, month DESC;

SELECT customer_id FROM customers
WHERE customer_id NOT IN 
  (
     SELECT DISTINCT customer_id_fk 
     FROM orders 
     WHERE order_date > DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
  );

SELECT (
  SELECT SUM(total_cost)
  FROM orders 
  WHERE order_date BETWEEN 
  DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH) 
  AND CURRENT_DATE) 
* 6 AS 'Projected Revenue of Next 6 Months';