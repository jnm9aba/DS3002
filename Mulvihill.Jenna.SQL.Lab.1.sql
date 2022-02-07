# 1. Write a query to get Product name and quantity/unit.  
select northwind.products.product_name, northwind.products.quantity_per_unit FROM northwind.products;
# 2. Write a query to get current Product list (Product ID and name).  
select northwind.products.product_name, northwind.products.id FROM northwind.products
where northwind.products.discontinued=0;
# 3. Write a query to get discontinued Product list (Product ID and name). 
select northwind.products.product_name, northwind.products.id FROM northwind.products
where northwind.products.discontinued !=0;
# 4. Write a query to get most expense and least expensive Product list (name and unit price).  
select  northwind.products.product_name, northwind.products.list_price FROM northwind.products
order by northwind.products.list_price asc limit 1;
select  northwind.products.product_name, northwind.products.list_price FROM northwind.products
order by northwind.products.list_price desc limit 1;
# 5. Write a query to get Product list (id, name, unit price) where current products cost less than $20.  
select northwind.products.product_name, northwind.products.id, northwind.products.list_price FROM northwind.products
where northwind.products.list_price<20 and northwind.products.discontinued=0;
# 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.  
select northwind.products.product_name, northwind.products.id, northwind.products.list_price FROM northwind.products
where northwind.products.list_price<25 and northwind.products.list_price>15;
# 7. Write a query to get Product list (name, unit price) of above average price.  
select northwind.products.product_name, northwind.products.list_price FROM northwind.products
where northwind.products.list_price> (select avg(northwind.products.list_price) FROM northwind.products);
# 8. Write a query to get Product list (name, unit price) of ten most expensive products.  
select northwind.products.product_name, northwind.products.list_price FROM northwind.products
order by northwind.products.list_price desc limit 10;
# 9.  Write a query to count current and discontinued products. 
select count(northwind.products.discontinued) FROM northwind.products
where northwind.products.discontinued=0;
select count(northwind.products.discontinued) FROM northwind.products
where northwind.products.discontinued!=0;
# 10. Write a query to get Product list (name, units on order, units in stock) of stock is less than the quantity on order.
select northwind.products.product_name, northwind.order_details.quantity, northwind.inventory_transactions.quantity
FROM northwind.products
join northwind.order_details on northwind.products.id=northwind.order_details.product_id
join northwind.inventory_transactions on northwind.order_details.product_id=northwind.inventory_transactions.product_id
where  northwind.order_details.quantity>northwind.inventory_transactions.quantity;

# Sources
# Had help from Joe von Storch and Amelia Norman
# https://www.w3schools.com/sql/sql_top.asp
# https://www.w3schools.com/sql/sql_orderby.asp
# https://stackoverflow.com/questions/31979008/sql-two-select-statements-in-one-query
# https://stackoverflow.com/questions/28171474/solution-to-subquery-returns-more-than-1-row-error
# https://www.w3schools.com/sql/sql_join.asp
# https://learnsql.com/blog/how-to-join-two-tables-in-sql/




