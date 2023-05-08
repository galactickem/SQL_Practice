-- DVD Rental practice
SELECT * FROM payment;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id NOT IN (184, 87, 477)
GROUP BY customer_id;

SELECT store_id,COUNT(*) FROM customer
GROUP BY store_id
HAVING COUNT(*) > 300;

------------

SELECT * from customer WHERE customer_id = NULL;


----

DELIMITER $$
CREATE PROCEDURE GetCustomers()
BEGIN
SELECT
customerName,
city,
state,
postalCode,
country
FROM customers
ORDER BY customerName;
END $$
DELIMITER ;
SELECT * FROM customers;
CALL GetCustomers();
-- GetTotalOrder()
DELIMITER $$
CREATE PROCEDURE GetTotalOrder()
BEGIN
DECLARE totalOrder INT DEFAULT 0,
SELECT count(*) INTO GetTotalOrder
FROM orders;
SELECT totalOrder;
END $$
CALL GetTotalOrder();
