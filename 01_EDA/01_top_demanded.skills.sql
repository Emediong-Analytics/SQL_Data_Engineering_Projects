/*
Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work
*/

SELECT sd.skills,
        COUNT (jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
 GROUP BY sd.skills
 ORDER BY demand_count DESC   
LIMIT 10;

/*
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘


-- Key Insight:
-- SQL and Python are the most in-demand skills for remote Data Engineer 
-- positions, appearing in 29,221 and 28,776 job postings respectively.
-- Cloud platforms are also highly valuable, with AWS (17,823) and Azure
-- (14,143) ranking third and fourth. Spark, Airflow, Snowflake, Databricks,
-- Java, and GCP also show strong demand, highlighting the importance of
-- combining programming, SQL, cloud computing, and modern data engineering
-- technologies when pursuing remote Data Engineer opportunities.

Analytical takeaway: The results suggest that a strong SQL + Python foundation,
combined with cloud and data-engineering technologies,
is central to the remote Data Engineer skill set.
*/







/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data analysts
- Focus on remote job postings
- Why? Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data analysts seeking remote work
*/

SELECT sd.skills,
        COUNT (jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
    AND jpf.job_work_from_home = TRUE
 GROUP BY sd.skills
 ORDER BY demand_count DESC   
LIMIT 10;

/*
Analysis:
SQL is the most in-demand skill for remote Data Analyst positions,
followed by Python and Excel. Tableau and Power BI also show strong
demand, highlighting the importance of data visualization and business
intelligence skills.

Key Takeaway:
Remote Data Analyst roles primarily emphasize SQL, programming,
spreadsheets, and visualization, whereas Data Engineering roles place
greater emphasis on cloud platforms, data infrastructure, and data
pipeline technologies.
*/
/*
┌──────────┬──────────────┐
│  skills  │ demand_count │
│ varchar  │    int64     │
├──────────┼──────────────┤
│ sql      │        15293 │
│ python   │         9973 │
│ excel    │         9274 │
│ tableau  │         8213 │
│ power bi │         5946 │
│ r        │         4714 │
│ sas      │         3430 │
│ looker   │         2153 │
│ go       │         1714 │
│ aws      │         1658 │
└──────────┴──────────────┘


-- Key Insight:
-- SQL is the most in-demand skill for remote Data Analyst positions, appearing
-- in 15,293 job postings, followed by Python (9,973) and Excel (9,274).
-- Tableau (8,213) and Power BI (5,946) also show strong demand, highlighting
-- the importance of data visualization and business intelligence skills.
-- R, SAS, and Looker have moderate demand, while Go and AWS appear less
-- frequently. Overall, the results indicate that remote Data Analyst roles
-- place strong emphasis on SQL, programming, spreadsheets, and visualization
-- tools.
*/

/*
Analysis:
SQL is the most in-demand skill for remote Data Analyst positions, followed
by Python and Excel. Tableau and Power BI also show strong demand, highlighting
the importance of data visualization and business intelligence skills.

Key Takeaway:
Remote Data Analyst roles primarily emphasize SQL, programming, spreadsheets,
and visualization, whereas Data Engineering roles place greater emphasis on
cloud platforms, data infrastructure, and data pipeline technologies.
*/
