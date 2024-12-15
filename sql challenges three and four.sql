/*3. Running Sums
Calculate the running sum of order amounts across all customers, ordered by date.*/

WITH customers_data AS (
    SELECT c.customer_id, c.customer_name, o.order_date, o.order_amount
    FROM customers c
    INNER JOIN orders o
    USING(customer_id)
)

SELECT customer_id, customer_name,
       order_date, order_amount,
       SUM(order_amount)
       OVER(ORDER BY order_date)
       AS running_sum
FROM customers_data;

/*4. Year-over-Year (YoY) Growth
Calculate the year-over-year growth of total sales amount.*/

WITH yearly_revenue AS (
    SELECT EXTRACT(YEAR FROM order_date) as year, 
           COUNT(*) AS total_orders,
           SUM(order_amount) AS current_year_revenue
    FROM orders 
    GROUP BY year
)

SELECT year, total_orders, current_year_revenue,
       LAG(current_year_revenue, 1) 
       OVER(ORDER BY year) as previous_year_revenue,
       (current_year_revenue - LAG(current_year_revenue, 1) 
       OVER(ORDER BY year)) AS growth
FROM yearly_revenue;

