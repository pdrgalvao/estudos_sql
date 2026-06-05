USE shop;



SELECT
    *
FROM
    customers
    JOIN orders ON orders.customer_id = customers.id;



SELECT
    first_name,
    last_name,
    SUM(amount) AS total_spent
FROM
    customers
    JOIN orders ON orders.customer_id = customers.id
GROUP BY
    first_name,
    last_name
ORDER BY
    total_spent;




SELECT
    first_name,
    last_name,
    order_date,
    amount
FROM
    customers
    LEFT JOIN orders ON orders.customer_id = customers.id;



SELECT
    first_name,
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM
    customers
    LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY
    first_name,
    last_name;



ALTER TABLE
    orders DROP FOREIGN KEY orders_ibfk_1;

ALTER TABLE
    orders
ADD
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE;



