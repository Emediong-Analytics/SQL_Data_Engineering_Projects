/*
Question: What are the most optimal skills for data engineers—balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
    - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.
*/

SELECT sd.skills,
    COUNT (jpf.*) AS demand_count,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
    --MEDIAN(jpf.salary_year_avg) * COUNT (jpf.salary_year_avg) AS optimal_skill
  ROUND(LN(COUNT(*)) * MEDIAN(jpf.salary_year_avg), 0) AS optimal_skill_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
GROUP BY sd.skills
HAVING COUNT (jpf.*) > 100
ORDER BY demand_count DESC, median_salary DESC, optimal_skill_score DESC  
LIMIT 25;



/*
┌────────────┬──────────────┬───────────────┬─────────────────────┐
│   skills   │ demand_count │ median_salary │ optimal_skill_score │
│  varchar   │    int64     │    double     │       double        │
├────────────┼──────────────┼───────────────┼─────────────────────┤
│ sql        │        29221 │      130000.0 │           1336744.0 │
│ python     │        28776 │      135000.0 │           1386085.0 │
│ aws        │        17823 │      137320.0 │           1344125.0 │
│ azure      │        14143 │      128000.0 │           1223293.0 │
│ spark      │        12799 │      140000.0 │           1323997.0 │
│ airflow    │         9996 │      150000.0 │           1381491.0 │
│ snowflake  │         8639 │      135500.0 │           1228178.0 │
│ databricks │         8183 │      132750.0 │           1196053.0 │
│ java       │         7267 │      135000.0 │           1200298.0 │
│ gcp        │         6446 │      136000.0 │           1192885.0 │
│ kafka      │         6415 │      145000.0 │           1271127.0 │
│ scala      │         6304 │      137290.0 │           1201146.0 │
│ redshift   │         5737 │      130000.0 │           1125110.0 │
│ hadoop     │         5447 │      135000.0 │           1161381.0 │
│ pyspark    │         4898 │      140000.0 │           1189522.0 │
│ git        │         4641 │      140000.0 │           1181976.0 │
│ power bi   │         4600 │      120000.0 │           1012057.0 │
│ nosql      │         4514 │      134415.0 │           1131094.0 │
│ tableau    │         4402 │      115000.0 │            964829.0 │
│ docker     │         4316 │      135000.0 │           1129961.0 │
│ kubernetes │         4202 │      150500.0 │           1255669.0 │
│ sql server │         3931 │      120000.0 │            993198.0 │
│ bigquery   │         3523 │      135000.0 │           1102554.0 │
│ mongodb    │         3512 │      135750.0 │           1108255.0 │
│ postgresql │         3360 │      122500.0 │            994663.0 │


Key Insights
-   Python has the highest optimal score (1,386,085),
    combining very high demand with a strong median salary of $135,000.
-   Airflow ranks highly (1,381,491) despite lower demand, 
    due to its higher median salary of $150,000.
-   SQL has the highest demand (29,221 postings) but ranks 
    below Python and Airflow because its median salary is lower at $130,000.
-   AWS and Spark also show a strong balance of demand and salary,
    with median salaries of $137,320 and $140,000, respectively.
-   Kafka and Kubernetes demonstrate that specialized 
    skills can command higher salaries despite lower demand.

Overall: Data Engineers should prioritize SQL and Python 
as foundational skills, then develop specialized skills
 such as AWS, Spark, Airflow, Kafka, and Kubernetes to 
 improve their market value.
*/




/*
Question: What are the most optimal skills for data analysts—balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Analyst positions with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
    - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data analysis careers.
*/
SELECT sd.skills,
    COUNT (jpf.*) AS demand_count,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
    MEDIAN(jpf.salary_year_avg) * COUNT (jpf.salary_year_avg) AS optimal_skill
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
    AND jpf.job_work_from_home = TRUE
GROUP BY sd.skills
HAVING COUNT (jpf.*) > 100
ORDER BY demand_count DESC, median_salary DESC, optimal_skill DESC  
LIMIT 25;



/*──────────┬──────────────┬───────────────┬───────────────┐
│   skills   │ demand_count │ median_salary │ optimal_skill │
│  varchar   │    int64     │    double     │    double     │
├────────────┼──────────────┼───────────────┼───────────────┤
│ sql        │        15293 │       90000.0 │    70470000.0 │
│ python     │         9973 │       90000.0 │    44460000.0 │
│ excel      │         9274 │       83500.0 │    36823500.0 │
│ tableau    │         8213 │       95000.0 │    47975000.0 │
│ power bi   │         5946 │       90000.0 │    26370000.0 │
│ r          │         4714 │       89796.0 │    25951044.0 │
│ sas        │         3430 │       85900.0 │    18898000.0 │
│ looker     │         2153 │       87500.0 │    10237500.0 │
│ go         │         1714 │      102250.0 │     4805750.0 │
│ aws        │         1658 │       74596.0 │     6564448.0 │
│ azure      │         1599 │       86150.0 │     6547400.0 │
│ powerpoint │         1564 │       86500.0 │     8390500.0 │
│ word       │         1484 │       81825.0 │     7527900.0 │
│ snowflake  │         1394 │       89000.0 │     7387000.0 │
│ oracle     │         1296 │      100000.0 │     6200000.0 │
│ sql server │         1102 │      100200.0 │     5811614.5 │
│ sheets     │         1098 │       82500.0 │     4207500.0 │
│ flow       │         1036 │       95000.0 │     4465000.0 │
│ sap        │         1034 │      100000.0 │     1900000.0 │
│ bigquery   │          877 │       83000.0 │     3735000.0 │
│ javascript │          859 │      103250.0 │     2891000.0 │
│ jira       │          798 │      145000.0 │     9135000.0 │
│ databricks │          776 │      110000.0 │     3410000.0 │
│ git        │          710 │       92250.0 │     1845000.0 │
│ pandas     │          685 │       71500.0 │     2431000.0 │
└────────────┴──────────────┴───────────────┴───────────────┘


Key Insights
1.   SQL has the highest demand (15,293 postings) and
     a strong median salary of $90,000, giving it the highest 
     combined score.
2.   Tableau provides a strong balance, with 8,213 postings 
    and the highest median salary ($95,000) among the major
    core analyst tools.
3.   Python and Excel remain highly valuable because of their 
    strong demand, with 9,973 and 9,274 postings, respectively.
4.   Power BI is also highly demanded (5,946 postings) with a $90,000 median salary.
5.   Specialized skills such as Jira, JavaScript, and 
    Databricks show higher salaries but substantially 
    lower demand, making them less optimal overall.

Overall: Data Analysts should prioritize SQL, Python, Excel, 
Tableau, and Power BI as the most practical skills because they 
offer the strongest combination of market demand and salary.
*/