SELECT * FROM products
WHERE (categoryid = COALESCE(1, categoryid))
  AND (productname ILIKE '%' || COALESCE('laptop', '') || '%')
  AND (price BETWEEN COALESCE(500::money, 0::money) AND COALESCE(1500::money, price))
  AND (sku = COALESCE('SKU001', sku));

SELECT p1.productname AS product1_name, p1.price AS product1_price, p1.description AS product1_description,
       p2.productname AS product2_name, p2.price AS product2_price, p2.description AS product2_description
FROM products p1
JOIN products p2 ON p1.categoryid < p2.categoryid
WHERE p1.productid = 4 AND p2.productid = 5;

SELECT p.productname, p.price, d.discountpercentage, d.startdate, d.enddate
FROM products p
JOIN discounts d ON p.productid = d.productid
WHERE d.startdate <= CURRENT_DATE AND d.enddate >= CURRENT_DATE;

SELECT SUM(oi.price * oi.quantity) AS total_amount
FROM orderitems oi
JOIN orders o ON oi.orderid = o.orderid
WHERE o.userid = 1 AND o.orderdate = '2023-10-01';

UPDATE products
SET stockquantity = stockquantity - (
    SELECT SUM(quantity)
    FROM orderitems
    WHERE productid = products.productid AND orderid = 1
)
WHERE productid IN (
    SELECT productid
    FROM orderitems
    WHERE orderid = 1
);

SELECT SUM(oi.price * oi.quantity * (1 - COALESCE(d.discountpercentage, 0) / 100)) AS total_amount,
       dm.methodname AS delivery_method,
       dm.description AS delivery_description
FROM orderitems oi
JOIN orders o ON oi.orderid = o.orderid
LEFT JOIN discounts d ON oi.productid = d.productid AND d.startdate <= CURRENT_DATE AND d.enddate >= CURRENT_DATE
JOIN deliverymethods dm ON o.deliverymethodid = dm.deliverymethodid
WHERE o.userid = 1 AND o.orderid = 1
GROUP BY dm.methodname, dm.description;

SELECT o.orderid, o.orderdate, o.totalamount, oi.productid, oi.quantity, oi.price
FROM orders o
JOIN orderitems oi ON o.orderid = oi.orderid
WHERE o.userid = 1
ORDER BY o.orderdate DESC;

SELECT r.reviewtext, r.reviewdate, u.username, u.usersurname
FROM reviews r
JOIN users u ON r.userid = u.userid
WHERE r.productid = 1 AND r.isapproved = true;

SELECT p.productname, p.sku, p.mainphoto, p.price, oi.quantity
FROM orderitems oi
JOIN products p ON oi.productid = p.productid
JOIN orders o ON oi.orderid = o.orderid
WHERE o.userid = 1 AND o.orderid = 1;

SELECT p.productname, p.price, hp.totalsales
FROM hitproducts hp
JOIN products p ON hp.productid = p.productid
WHERE hp.totalsales = (
    SELECT MAX(totalsales)
    FROM hitproducts
    WHERE categoryid = hp.categoryid
);

SELECT p.productname, p.price, p.description, p.mainphoto, sp.discountpercentage,
       (p.price * (1 - sp.discountpercentage / 100)) AS discounted_price
FROM saleproducts sp
JOIN products p ON sp.productid = p.productid
WHERE sp.startdate <= CURRENT_DATE AND sp.enddate >= CURRENT_DATE;

SELECT p.productname, p.price, p.description, p.mainphoto, pr.promotionname, pr.description
FROM products p
JOIN promotions pr ON p.promotionid = pr.promotionid
WHERE pr.startdate <= CURRENT_DATE AND pr.enddate >= CURRENT_DATE;

SELECT * FROM products
WHERE categoryid = 1 AND stockquantity > 0;
