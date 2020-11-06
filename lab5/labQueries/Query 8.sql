-- Query 8
SELECT TOP(5) WITH TIES Name, sum(Quantity_In_Order) as TotalQty
FROM ORDERS o, PRODUCTS_IN_ORDERS pio, PRODUCTS p
WHERE pio.ORDERSID = o.ID AND pio.PRODUCTSID = p.ID
AND o.Date_time >= '2020-08-01'
AND o.Date_time <= '2020-08-31'
GROUP BY Name
HAVING COUNT(DISTINCT o.USERID) < (SELECT COUNT(DISTINCT ID) FROM users)
ORDER BY SUM(pio.Quantity_In_Order) DESC

