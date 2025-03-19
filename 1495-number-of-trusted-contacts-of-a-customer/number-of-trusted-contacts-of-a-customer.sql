# Write your MySQL query statement below
# invoice_id | customer_name | price | contacts_cnt | trusted_contacts_cnt

WITH cte AS(
    SELECT DISTINCT c1.customer_id
        , COUNT(DISTINCT c2.contact_email) AS contacts_cnt
        , COUNT(DISTINCT CASE WHEN c3.email IS NOT NULL THEN c2.contact_email END) AS trusted_contacts_cnt
    FROM Customers c1
    LEFT JOIN Contacts c2
    ON c1.customer_id = c2.user_id
    LEFT JOIN Customers c3
    ON c2.contact_name = c3.customer_name
    AND c2.contact_email = c3.email
    GROUP BY 1
)

SELECT DISTINCT i.invoice_id 
            , c1.customer_name
            , i.price
            , c2.contacts_cnt
            , c2.trusted_contacts_cnt
FROM Invoices i
LEFT JOIN Customers c1
ON i.user_id = c1.customer_id
LEFT JOIN cte c2
ON i.user_id = c2.customer_id
ORDER BY 1
;

