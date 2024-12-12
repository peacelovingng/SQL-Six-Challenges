/*1. Ranking, Dense Ranking, and Row Number
Write a query to rank customers based on the total amount they have spent on orders. 
Provide Rank, Dense Rank,  and Row Number for each customer.*/

WITH customers_spending AS (
    SELECT customer_id, customer_name, SUM(order_amount) as total_spent
    FROM customers
    INNER JOIN orders 
    USING(customer_id)
    GROUP BY customer_id, customer_name
)

SELECT customer_name, total_spent,
ROW_NUMBER() OVER(ORDER BY total_spent DESC) AS row_number,
RANK() OVER(ORDER BY total_spent DESC) AS rank,
DENSE_RANK() OVER(ORDER BY total_spent DESC) AS dense_rank 
FROM customers_spending;

/*2. Cumulative Summations
Calculate the cumulative sum of the order amounts for each customer.*/

