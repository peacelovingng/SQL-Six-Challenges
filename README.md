# SQL Challenges - Customers with referrals and Orders

This repository contains a collection of SQL queries designed to solve real-world challenges related to tables for customers, orders, and referral systems. The solutions leverage advanced SQL techniques including:

- **Window Functions**
- **Common Table Expressions (CTEs)**
- **Recursive Common Table Expressions (Recursive CTEs)**

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Table Structure](#table-structure)
3. [SQL Challenges](#sql-challenges)
4. [Techniques Used](#techniques-used)
5. [Usage](#usage)
6. [Contributing](#contributing)
7. [License](#license)

---

## Prerequisites

To run these queries, you will need:

- A PostgreSQL-compatible database.
- Tables for `customers`, `orders`, and `referrals`. Sample table structures and data are provided.

## Table Structure

### Customers Table

| Column           | Type        | Description                     |
|------------------|-------------|---------------------------------|
| `customer_id`    | INTEGER     | Unique identifier for customers |
| `customer_name`  | VARCHAR     | Name of the customer            |
| `country`        | VARCHAR     | Country of the customer         |
| `joindate   `    | INTEGER     | Date the customer joined    |
| `referred_by`    | INTEGER     | ID of the referring customer    |

### Orders Table

| Column         | Type        | Description                      |
|----------------|-------------|----------------------------------|
| `order_id`     | INTEGER     | Unique identifier for orders     |
| `customer_id`  | INTEGER     | ID of the customer placing order |
| `order_date`   | DATE        | Date the order was placed        |
| `order_amount` | NUMERIC     | Order amount                     |

---

## SQL Challenges

1. **Ranking, Dense Ranking, and Row Number:**
   - Write a query to rank customers based on the total amount they have spent on orders. Provide Rank, Dense Rank, and Row Number for each customer.

2. **Cumulative Summations:**
   - Calculate the cumulative sum of the order amounts for each customer.

3. **Running Sums:**
   - Calculate the running sum of order amounts across all customers, ordered by date.

4. **Year-over-Year (YoY) Growth:**
   - Calculate the year-over-year growth of total sales amount.

5. **Recursive Queries:**
   - Create a hierarchical representation of customers and their referred customers.

6. **Additional Challenge: Rolling Average:**
   - Calculate the rolling average of order amounts over a 3-order window for each customer.

---

## Techniques Used

### Window Functions

- Used for ranking, aggregating, and analyzing subsets of data.
- Examples:
  ```sql
  SELECT 
      customer_id, 
      COUNT(order_id) OVER (PARTITION BY customer_id) AS total_orders
  FROM orders;
  ```

### Common Table Expressions (CTEs)

- Used to break down complex queries into manageable steps.
- Example:
  ```sql
  WITH total_spent AS (
      SELECT 
          customer_id, 
          SUM(amount) AS total_amount
      FROM orders
      GROUP BY customer_id
  )
  SELECT * FROM total_spent;
  ```

### Recursive CTEs

- Used for hierarchical or recursive data analysis, such as referral chains.
- Example:
  ```sql
  WITH RECURSIVE referral_chain AS (
      SELECT 
          referrer_id, 
          referred_id
      FROM referrals
      WHERE referrer_id = 1
      UNION ALL
      SELECT 
          r.referrer_id, 
          r.referred_id
      FROM referrals r
      INNER JOIN referral_chain rc ON r.referrer_id = rc.referred_id
  )
  SELECT * FROM referral_chain;
  ```

---

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/sql-six-challenges.git
   ```

2. Import the sample data into your PostgreSQL database.

3. Run the provided SQL queries to solve the challenges.

---

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your updates.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
