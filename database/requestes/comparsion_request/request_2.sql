SELECT p1.ProductName, p1.Price, p1.Description, p2.ProductName, p2.Price, p2.Description
FROM Products p1
JOIN Products p2 ON p1.CategoryID = p2.CategoryID
WHERE p1.ProductID = 3 AND p2.ProductID = 3;

