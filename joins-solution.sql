# Exercise

For each of the following questions

* Write a comment that specifies which question you are answering. (SQL comments are two dashes, followed by text.)
* Write the SQL query that answers the question, below that comment.


## Example question and answer

```SQL
-- 0. Get all the users
SELECT * FROM customers;```


## Tasks
-- 1. Get all customers and their addresses.
  SELECT * FROM "customers"
  JOIN "addresses" ON "customers".id = "addresses".customer_id;

-- 2. Get all orders and their line items (orders, quantity and product).
  SELECT * FROM "orders"
  JOIN "line_items" ON "orders".id = "line_items".order_id
  JOIN "products" ON "products".id = "line_items".product_id;

-- 3. Which warehouses have cheetos?
  SELECT * FROM "warehouse"
  JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
  JOIN "products" ON "products".id = "warehouse_product".product_id
  WHERE "products".description = 'cheetos';

-- 4. Which warehouses have diet pepsi?
  SELECT "warehouse".warehouse FROM "products"
  JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
  JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
  WHERE "products".description = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
  SELECT "customers".first_name, "customers".last_name, count(*) as "total_order" FROM "customers"
  JOIN "addresses" ON "customers".id = "addresses".customer_id
  JOIN "orders" ON "addresses".id = "orders".address_id
  GROUP BY "customers".id;

-- 6. How many customers do we have?
  SELECT count(*) as "total_customers" FROM "customers";

-- 7. How many products do we carry?
  SELECT count(*) as "total_products" FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
  SELECT "products".description, count(*) as "total_available" FROM "products"
  JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
  WHERE "products".description = 'diet pepsi'


## Stretch
9. How much was the total cost for each order?
10. How much has each customer spent in total?
11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
