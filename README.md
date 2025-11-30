# Sales Analysis


## Overview

This project is a complete end-to-end analysis of customer behavior using SQL. The dataset was provided as part of an online intermediate SQL learning resource, and the goal of the project was to strengthen analytical skills by applying real business-style techniques rather than just practicing syntax.

The project includes original SQL queries, visualizations, business insights, and strategic recommendations. The aim was not only to calculate results, but to interpret them in a business context—simulating real-world decision-making. This also helped reinforce skills in joins, window functions, grouping, and CTE-based analysis.

## Business Questions
The analysis covers three core areas commonly used in real-world analytics:
1. **Customer Segmentation**: Who are our most valuable customers?
2. **Cohort Analysis**: How do different customer groups generate revenue?
3. **Retention Analysis**: Who hasn't purchased recently?

## Analysis approach

### 1. Customer Segmentation
- Divided customers into 3 segments (low, mid, high) based on the total lifetime value (LTV)
- Calculated key metrics: **total number of customers in each segment**, **avg LTV per customer in each segment** and **total revenue from each segment**

**Query**: [1_customer_segmentation.sql](/1_customer_segmentation.sql)

**Visualization**: ![Customer_Segmentation](/images/LTV%20Distribution%20by%20Customer%20Segment.png)

#### **Key Findings:**
1. High-value customers generate nearly two-thirds of total revenue, contributing over $135M in LTV despite being the same size as the low-value segment.
2. Mid-value customers contribute a strong $66M in LTV and represent the largest customer group, making them a stable and dependable revenue source.
3. Low-value customers contribute only $4.3M in LTV, offering minimal financial impact despite having the same customer count as the high-value segment.
4. The difference in average LTV per customer across segments is substantial, with high-value customers spending over $10,960 each, compared to $2,682 for mid-value and only $347 for low-value customers.

#### **Business Insights:**

1. **High-value customers should be the primary focus for retention initiatives**, as they contribute the majority of total LTV.
2. **Mid-value customers present a strong opportunity for growth** through targeted upsell and engagement strategies.
3. **Low-value customers require a different product experience or incentive model**, as their current contribution is minimal.
4. **Marketing efforts should be optimized** toward channels that historically acquire high- and mid-value customers.
5. **Growth strategies should prioritize nurturing mid-value customers and retaining high-value customers**, as low-value customers are not economically impactful without major behavioral or product changes.

### 2. Cohort Analysis
- Tracked revenue and customer count per cohorts
- Cohorts were grouped by first year of purchase
- Analyzed customer retention at a cohort level

**Query**: [2_cohort_analysis.sql](/2_Cohort%20rev_per_customer.sql)

**Visualization**: ![Cohort_Analysis](/images/Average%20Revenue%20per%20Customer%20by%20Cohort%20Year.png)

#### **Key Findings:**
1. **Highest-Value Cohorts (2016–2017):**
Customers acquired in 2016 and 2017 show the strongest average revenue per customer, consistently exceeding 3,000.

2. **Declining Revenue per Customer After 2018:**
Beginning with the 2018 cohort, the average revenue per customer shows a noticeable downward trend. This suggests either a shift in customer behavior, changes in acquisition channels, or differences in product-market fit during later years.

3. **Significant Drop in Recent Cohorts (2020–2024):**
Cohorts from 2020 onward generate substantially lower revenue per customer. The 2024 cohort exhibits the lowest figure in the entire dataset, indicating that recent customers are less engaged or less valuable monetarily.
4. **Volume Growth Does Not Translate to Higher Value:**
Although some years (such as 2018, 2019, and 2022) achieved high total revenue, this was driven primarily by increased customer counts rather than higher individual customer spend. This signals a dependency on volume rather than improvements in customer value.

 **NOTE** : Although net revenue is increasing, this is likely due to a large customer base, which is not reflective of the customer value.

 #### **Business Insights**: 
 - **Customer value consistently declines after 2018**, meaning newer cohorts are less profitable per person.
 - **Recent cohorts (2020–2024) are the weakest**, suggesting acquisition quality has dropped.
 - **Customer retention or monetization strategies likely weakened post-2018**, pointing to a need for improved onboarding, product experience, or pricing strategy.
 - **2024 cohort performance signals an urgent need to reassess marketing channels**, as the newest customers have the lowest spend recorded.

 ### 3. Retention Analysis

- Classified customers as **Active** or **Churned** based on their most recent purchase date.
- A customer is marked as **Churned** if their last order occurred more than 6 months before the maximum order date in the dataset.
- This method allows us to evaluate retention behavior using the natural endpoint of the data rather than the current date.

**Query**: [3_retention_analysis.sql](/3_retention_analysis.sql)

**Visualization**: ![Retention_Analysis](/images/Customer%20Status%20Percentage%20by%20Cohort%20Year.png)

#### **Key Findings:**
1. **Consistently high churn across all cohorts (2015–2023):** In every cohort, roughly 89–92% of customers are classified as churned, with only about 8–11% remaining active.
2. **Retention is relatively flat over time:** There is no strong improving or declining trend across cohorts. Differences in active customer share are small and stay within a narrow band.
3. **Slightly stronger retention in the 2022 cohort:** The 2022 cohort has the highest active share (~10.4%), but the improvement over other cohorts is marginal rather than transformational.
4. **Business growth is driven by acquisition rather than loyalty:** Given the uniformly high churn, revenue is heavily dependent on continuously acquiring new customers instead of building a large base of long-term repeat buyers.


#### **Business Insights & Strategic Recommendations**

1. **Growth is driven by new customers rather than loyalty. This model is fragile and expensive.**
Shift focus toward retention, lifecycle marketing, referrals, and CRM strategies.

2. **Most customers disappear after their initial purchase.**
Improve onboarding, post‑purchase engagement, personalized recommendations, and reorder experience.

3. **Retention is flat across all cohorts, indicating limited product evolution.**
Analyze retention by product category, channel, and acquisition journey. Retire or redesign low‑retention products.

4. **Churn is high but there is no evidence of win‑back strategies.** Implement dormant customer campaigns, replenishment reminders, and personalized offers.

5. **Run controlled retention experiments on newer cohorts and scale successful strategies.**


**Core insight:** The problem is not acquisition. It is the **failure to convert first‑time customers into repeat customers.**

## Tools Used
- PostgreSQL
- VS Code
- GitHub

## Limitations
- Data is limited to yearly cohorts rather than monthly analysis.
- Dataset was provided through an online resource and may not represent real industry complexity.
- No detailed marketing or channel attribution data, which limits retention root-cause analysis.

## Conclusion
This analysis highlights structural churn issues and an over‑dependence on acquisition rather than loyalty. While the business generates strong customer inflow, revenue sustainability depends on improving repeat purchase behavior and retention strategies. Even modest improvements in retention would have a disproportionately positive impact on revenue and long‑term customer value.