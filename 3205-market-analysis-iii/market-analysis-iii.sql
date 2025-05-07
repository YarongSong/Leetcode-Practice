# Write your MySQL query statement below

-- seller_id | num_items
-- Order: seller_id ASC
-- All top sellers

-- 1) for each order: get the item brand, the seller's fav brand
-- 2) each seller in the orders table, aggregation of num_items (unique)
-- 3) rank num_items to find the top sellers

WITH order_seller AS(
    SELECT a.order_id, a.seller_id, c.item_id, b.favorite_brand, c.item_brand
    FROM Orders a
    JOIN Users b
    ON a.seller_id = b.seller_id
    JOIN Items c
    ON a.item_id = c.item_id
), seller AS(
    SELECT seller_id, COUNT(DISTINCT item_id) AS num_items
    FROM order_seller
    WHERE favorite_brand <> item_brand
    GROUP BY seller_id
)

SELECT seller_id, num_items
FROM(
    SELECT seller_id, num_items, RANK() OVER(ORDER BY num_items DESC) AS RNK
    FROM seller
) R
WHERE RNK = 1
ORDER BY 1
;