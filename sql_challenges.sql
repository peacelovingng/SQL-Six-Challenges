WITH customers_spending AS (
    SELECT customer_id, customer_name, SUM(order_amount) as total_spent
    FROM customers
    INNER JOIN orders 
    USING(customer_id)
    GROUP BY customer_id, customer_name
)

SELECT customer_name, total_spent,
ROW_NUMBER() OVER(ORDER BY total_spent DESC) AS row_number
RANK() OVER(ORDER BY total_spent DESC) AS rank
DENSE_RANK() OVER(ORDER BY total_spent DESC) AS dense_rank 
FROM customers_spending;

