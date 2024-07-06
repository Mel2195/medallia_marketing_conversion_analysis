## SQL Queries

This section contains SQL queries used to calculate the lead to won opportunity conversion rate and the average number of days to conversion by month.

## 1. Lead to Won Opportunity Conversion Rate by Month

Calculates the conversion rate from leads to won opportunities by month.

SELECT 
    DATE_TRUNC('month', TO_DATE(l."Create Date", 'dd-MMM-yy')) AS month,
    COUNT(CASE WHEN o."Stage" = 'Closed Won' THEN 1 END) * 100.0 / COUNT(*) AS conversion_rate
FROM Leads l
LEFT JOIN Opportunities o ON l."Converted Opportunity ID" = o."Converted Opportunity ID"
GROUP BY month
ORDER BY month;

### 2. Average Days to Conversion by Month

Calculates the average number of days to convert a lead to an opportunity by month.

SELECT 
    DATE_TRUNC('month', TO_DATE("Create Date", 'dd-MMM-yy')) AS month,
    AVG(" # Days To Conversion") AS avg_days_to_conversion
FROM Leads
GROUP BY month
ORDER BY month;
