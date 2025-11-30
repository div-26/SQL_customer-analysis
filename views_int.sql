CREATE VIEW vw_cohort_analysis AS
WITH customer_revenue AS (    
    SELECT
        s.customerkey,
        s.orderdate,
        SUM(s.quantity * s.netprice / s.exchangerate) AS total_net_revenue,
        COUNT(s.orderkey) AS total_orders,
        c.country,
        c.age,
        c.givenname,
        c.surname
    FROM
        sales s
    LEFT JOIN
        customer c ON c.customerkey = s.customerkey
    GROUP BY
        c.customerkey,
        s.customerkey,
        s.orderdate,
        c.country,
        c.age,
        c.givenname,
        c.surname
)

SELECT
    customerkey,
    orderdate,
    total_net_revenue,
    total_orders,
    country,
    age,
    CONCAT(TRIM(givenname), ' ', TRIM(surname)) AS full_name,
    MIN(cr.orderdate) OVER (PARTITION BY cr.customerkey) AS first_order_date,
    EXTRACT(YEAR FROM MIN(cr.orderdate) OVER (PARTITION BY cr.customerkey)) AS cohort_year
FROM
    customer_revenue cr;
