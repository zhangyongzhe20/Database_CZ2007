CREATE VIEW a1 as (
SELECT p.ID
FROM FEEDBACK f, PRODUCTS_IN_ORDERS pio, PRODUCTS p
WHERE f.PRODUCTS_IN_ORDERSID = pio.ID AND
  pio.PRODUCTSID = p.ID AND
	  f.Rating = 5
	  AND f.Date_time >= '2020-08-01' AND f.Date_time < ='2020-08-31'
GROUP BY p.ID
HAVING COUNT(f.Rating) >= 100
)
GO 
CREATE VIEW A2 AS(
select a1.ID, AVG(CAST(f.Rating AS FLOAT)) AS Average_Rating
FROM FEEDBACK f, PRODUCTS_IN_ORDERS pio, a1 
WHERE f.PRODUCTS_IN_ORDERSID = pio.ID AND
  pio.PRODUCTSID = a1.ID 
GROUP BY a1.ID
)
GO

SELECT Name, Average_rating
FROM A2, PRODUCTS
WHERE PRODUCTS.ID = A2.ID;

