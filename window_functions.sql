--Top 5 Customers using Window Functions

SELECT
    c.name,
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS customer_rank
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id
GROUP BY c.name limit 5;

--Running Revenue

SELECT
    order_date,
    SUM(total_amount) AS daily_revenue,
    SUM(SUM(total_amount))
    OVER(ORDER BY order_date) AS running_revenue
FROM Orders
GROUP BY order_date;

-- Revenue Contribution by Genre

SELECT
    b.genre,
    ROUND(
        100.0 * SUM(o.total_amount) /
        SUM(SUM(o.total_amount)) OVER (),
        2
    ) AS revenue_percent
FROM Orders o
JOIN Books b
ON o.book_id = b.book_id
GROUP BY b.genre;