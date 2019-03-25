# 1. Write a query to get Product name and quantity/unit.
SELECT ProductName, QuantityPerUnit
FROM products;

# 2. Write a query to get current Product list (Product ID and name).
SELECT ProductID, ProductName
FROM products
WHERE discontinued = 0
ORDER BY ProductName;

# 3. Write a query to get discontinued Product list (Product ID and name).
SELECT ProductID, ProductName
FROM products
WHERE discontinued = 1
ORDER BY ProductName;

# 4. Write a query to get most expense and least expensive Product list (name and unit price).
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM products)
OR UnitPrice = (SELECT MIN(UnitPrice) FROM products)
ORDER BY UnitPrice DESC;

# 5. Write a query to get Product list (id, name, unit price) where current products cost less than $20.
SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE Discontinued = 0 AND UnitPrice < 20;

# 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.
SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE UnitPrice BETWEEN 15 AND 25;

# 7. Write a query to get Product list (name, unit price) of above average price.
SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM products);

# 8. Write a query to get Product list (name, unit price) of ten most expensive products.
SELECT ProductID, ProductName, UnitPrice
FROM products
ORDER BY UnitPrice DESC
LIMIT 10;

# 9. Write a query to count current and discontinued products.
SELECT COUNT(ProductName)
FROM products
GROUP BY Discontinued;

# 10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order.
SELECT ProductName, UnitsOnOrder, UnitsInStock
FROM products
WHERE Discontinued = 0 AND UnitsOnOrder > UnitsInStock