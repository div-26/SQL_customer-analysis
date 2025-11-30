WITH customer_ltv AS (
SELECT
    customerkey,
    full_name,
    SUM(total_net_revenue) AS total_ltv
FROM vw_cohort_analysis
GROUP BY
    customerkey,
    full_name
),

customer_segments AS (
SELECT
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_ltv) AS ltv_25th_percentile,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_ltv) AS ltv_75th_percentile
FROM customer_ltv
),

segment_values AS (
SELECT
    c.*,
    CASE
        WHEN c.total_ltv < s.ltv_25th_percentile THEN '1 - Low Value '
        WHEN c.total_ltv >= s.ltv_25th_percentile AND c.total_ltv < s.ltv_75th_percentile THEN '2 - Mid Value'
        ELSE '3 - High Value'
    END AS customer_segment
FROM customer_ltv c, customer_segments s
)

SELECT
    customer_segment,
    SUM (total_ltv) AS segment_total_ltv,
    COUNT (customerkey) AS customers_in_segment,
    AVG(total_ltv) AS avg_ltv_per_customer
FROM segment_values
GROUP BY
    customer_segment