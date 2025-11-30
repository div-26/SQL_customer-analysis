SELECT
    cohort_year,
    COUNT(DISTINCT customerkey) AS total_customers,
    SUM(total_net_revenue) AS total_revenue,
    SUM(total_net_revenue) / COUNT(DISTINCT customerkey) AS avg_revenue_per_customer
FROM 
    vw_cohort_analysis
WHERE 
    orderdate = first_order_date
GROUP BY
    cohort_year
ORDER BY
    cohort_year