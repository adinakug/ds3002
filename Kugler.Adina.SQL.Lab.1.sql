# 1. Write a query to get Product name and quantity/unit.
SELECT northwind.products.product_name, northwind.products.quantity_per_unit 
FROM northwind.products;
# 2. Write a query to get current Product list (Product ID and name). 
SELECT northwind.products.id, northwind.products.product_name 
FROM northwind.products;
# 3. Write a query to get discontinued Product list (Product ID and name). 
SELECT northwind.products.id, northwind.products.product_name 
FROM northwind.products
WHERE northwind.products.discontinued = 1;
# 4. Write a query to get most expense and least expensive Product list (name and unit price).
Select max(northwind.products.product_name), 
max(northwind.order_details.unit_price), 
min(northwind.products.product_name),
min(northwind.order_details.unit_price)
FROM northwind.products
INNER JOIN northwind.order_details 
ON northwind.products.id = northwind.order_details.product_id;
# 5. Write a query to get Product list (id, name, unit price) where current products cost less than $20.  
SELECT northwind.products.id, northwind.products.product_name, northwind.order_details.unit_price 
FROM northwind.products
INNER JOIN northwind.order_details 
ON northwind.products.id = northwind.order_details.product_id
WHERE northwind.order_details.unit_price < 20.0000;
# 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.  
SELECT northwind.products.id, northwind.products.product_name, northwind.order_details.unit_price 
FROM northwind.products
INNER JOIN northwind.order_details 
ON northwind.products.id = northwind.order_details.product_id
WHERE northwind.order_details.unit_price < 25 AND northwind.order_details.unit_price > 15;
# 7. Write a query to get Product list (name, unit price) of above average price. 
SELECT northwind.products.product_name, northwind.order_details.unit_price 
FROM northwind.products 
INNER JOIN northwind.order_details 
ON northwind.products.id = northwind.order_details.product_id
WHERE northwind.order_details.unit_price > (SELECT avg(northwind.order_details.unit_price) 
    FROM northwind.order_details);
# 8. Write a query to get Product list (name, unit price) of ten most expensive products.  
SELECT northwind.products.product_name, northwind.order_details.unit_price
FROM northwind.products 
INNER JOIN northwind.order_details 
ON northwind.products.id = northwind.order_details.product_id
ORDER BY northwind.order_details.unit_price desc limit 10;
# 9. Write a query to count current and discontinued products. 
SELECT count(northwind.products.product_name)
FROM northwind.products
GROUP BY northwind.products.discontinued;
# 10. Write a query to get Product list (name, units on order, units in stock) of stock is less than the quantity on order.  
SELECT northwind.products.product_name, northwind.order_details.quantity AS units_order, northwind.inventory_transactions.quantity AS unit_stock
FROM ((northwind.products 
INNER JOIN northwind.order_details ON northwind.products.id = northwind.order_details.product_id)
INNER JOIN northwind.inventory_transactions ON northwind.products.id = northwind.inventory_transactions.id)
WHERE northwind.order_details.quantity > northwind.inventory_transactions.quantity;
