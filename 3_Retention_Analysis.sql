WITH last_orders AS ( 
    SELECT 
        customerkey,
        full_name,
        orderdate,
        ROW_NUMBER() OVER (PARTITION BY customerkey ORDER BY orderdate DESC) AS order_rank,
        first_order_date,
        cohort_year
    FROM vw_cohort_analysis
),

max_date AS (
    SELECT 
        MAX(orderdate) AS max_order_date
    FROM sales
),
churned_customers AS (
/* Run this CTE to see which customers are classified as churned or active based on their last order date */
SELECT
    last_orders.customerkey,
    last_orders.full_name,
    last_orders.first_order_date,
    last_orders.orderdate AS last_order_date,
    cohort_year,
    CASE WHEN
            last_orders.orderdate < max_date.max_order_date - INTERVAL '6 months'
        THEN 
            'Churned Customer'

--If we want to include a condition for customers whose first order date is within the last 6 months, we can add another WHEN clause.
        /*
        WHEN 
            first_order_date > max_date.max_order_date - INTERVAL '6 months'
        THEN
            'Not enough data'
        */

        ELSE
            'Active Customer'
    END AS customer_status

FROM
    last_orders

CROSS JOIN max_date

WHERE
    order_rank = 1
    AND first_order_date <= max_date.max_order_date - INTERVAL '6 months' --Excluding customers with first order date within last 6 months
)

SELECT
    cohort_year,
    customer_status,
    COUNT(customerkey) AS customer_count,
    SUM(COUNT(customerkey)) OVER (PARTITION BY cohort_year) AS total_customers,
    ROUND((COUNT(customerkey) / SUM(COUNT(customerkey)) OVER (PARTITION BY cohort_year)) * 100, 2) AS status_percentage
FROM
    churned_customers
GROUP BY
    cohort_year,
    customer_status
