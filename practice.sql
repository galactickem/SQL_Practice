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


-------

-- GetOrderByStatus
DELIMITER $$
CREATE PROCEDURE GetOrderByStatus(
IN orderStatus varchar(25),
OUT total INT)
BEGIN
SELECT count(orderNumber)
INTO total
FROM orders
WHERE status = orderStatus;
END $$
CALL GetOrderByStatus('Shipped', @total);
SELECT @total;
------

DELIMITER $$
CREATE PROCEDURE GetClientByCountry(IN countryParam VARCHAR(25))
BEGIN
SELECT
customers.customerName AS customerName,
CONCAT(customers.contactLastName, ' ', customers.contactFirstName) AS
contactName,
CONCAT(employees.lastName, ' ', employees.firstName) AS salesRepName,
employees.email AS salesRepEmail,
customers.creditLimit AS creditLimit
FROM
customers
INNER JOIN employees ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE
c.country = countryParam;
END $$
DELIMITER ;