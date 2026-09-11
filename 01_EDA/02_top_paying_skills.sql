/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/
SELECT sd.skills,
    COUNT (jpf.*) AS demand_count,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
GROUP BY sd.skills
HAVING COUNT (jpf.*) > 100
ORDER BY median_salary DESC   
LIMIT 25;


/*

┌────────────┬──────────────┬───────────────┐
│   skills   │ demand_count │ median_salary │
│  varchar   │    int64     │    double     │
├────────────┼──────────────┼───────────────┤
│ rust       │          232 │      210000.0 │
│ terraform  │         3248 │      184000.0 │
│ golang     │          912 │      184000.0 │
│ spring     │          364 │      175500.0 │
│ neo4j      │          277 │      170000.0 │
│ gdpr       │          582 │      169616.0 │
│ zoom       │          127 │      168438.0 │
│ graphql    │          445 │      167500.0 │
│ mongo      │          265 │      162250.0 │
│ fastapi    │          204 │      157500.0 │
│ django     │          265 │      155000.0 │
│ bitbucket  │          478 │      155000.0 │
│ crystal    │          129 │      154224.0 │
│ atlassian  │          249 │      151500.0 │
│ c          │          444 │      151500.0 │
│ typescript │          388 │      151000.0 │
│ kubernetes │         4202 │      150500.0 │
│ node       │          179 │      150000.0 │
│ ruby       │          736 │      150000.0 │
│ airflow    │         9996 │      150000.0 │
│ css        │          262 │      150000.0 │
│ redis      │          605 │      149000.0 │
│ vmware     │          136 │      148798.0 │
│ ansible    │          475 │      148798.0 │
│ jupyter    │          400 │      147500.0 │
└────────────┴──────────────┴───────────────┘


KEY FINDINGS

1. Rust has the highest median salary at approximately $210,000,
   but appears in only 232 job postings.

2. Terraform has a median salary of approximately $184,000
   and appears in 3,248 postings, making it one of the strongest
   combinations of salary and demand.

3. Golang also has a median salary of approximately $184,000,
   with 912 postings.

4. Kubernetes appears in 4,202 postings with a median salary
   of approximately $150,500.

5. Airflow has the highest demand among the listed skills,
   appearing in 9,996 postings, with a median salary of
   approximately $150,000.

CONCLUSION:
The highest-paying skill is not necessarily the most valuable
skill to learn. Skills such as Terraform, Kubernetes, and Airflow
provide a stronger combination of compensation and market demand.
*/






/*
Question: Which skills are associated with the highest-paying
remote Data Analyst job postings, and how frequently are those
skills requested?

- Calculate the median salary for each skill required in
  Data Analyst positions.
- Focus on remote positions with specified salaries.
- Include skill frequency to identify both salary and demand.
- Why? This helps identify which skills are associated with
  higher compensation while also showing how commonly they
  are requested, providing a more complete picture for
  prioritizing skill development.*/

SELECT sd.skills,
    COUNT (jpf.*) AS demand_count,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
    AND jpf.job_work_from_home = TRUE
GROUP BY sd.skills
HAVING COUNT (jpf.*) > 100
ORDER BY median_salary DESC   
LIMIT 25;


/*


#Analytical Observations:
"Although TypeScript recorded the highest median salary at $445,000, 
its relatively low demand count of 132 postings suggests that this 
result may represent a specialized subset of Data Analyst roles. 
Therefore, salary should be evaluated alongside skill frequency 
rather than used as the sole indicator of skill value."


┌──────────────┬──────────────┬───────────────┐
│    skills    │ demand_count │ median_salary │
│   varchar    │    int64     │    double     │
├──────────────┼──────────────┼───────────────┤
│ typescript   │          132 │      445000.0 │
│ perl         │          115 │      158000.0 │
│ pyspark      │          273 │      153026.0 │
│ kafka        │          141 │      145538.0 │
│ zoom         │          217 │      145000.0 │
│ jira         │          798 │      145000.0 │
│ scala        │          252 │      135000.0 │
│ shell        │          145 │      117300.0 │
│ airflow      │          552 │      114250.0 │
│ c            │          373 │      112850.0 │
│ linux        │          282 │      112500.0 │
│ ssis         │          444 │      110000.0 │
│ dax          │          544 │      110000.0 │
│ databricks   │          776 │      110000.0 │
│ hadoop       │          474 │      107500.0 │
│ db2          │          114 │      106850.0 │
│ t-sql        │          204 │      106500.0 │
│ php          │          136 │      105000.0 │
│ scikit-learn │          132 │      103500.0 │
│ javascript   │          859 │      103250.0 │
│ unix         │          106 │      103000.0 │
│ spark        │          639 │      102500.0 │
│ go           │         1714 │      102250.0 │
│ confluence   │          300 │      101500.0 │
│ sql server   │         1102 │      100200.0 │
└──────────────┴──────────────┴───────────────┘


KEY FINDINGS
============================================================

1. TYPESCRIPT
   TypeScript has the highest median salary at approximately
   $445,000, but appears in only 132 job postings.

2. PERL
   Perl has a median salary of approximately $158,000 and
   appears in 115 postings.

3. PYSPARK
   PySpark has a median salary of approximately $153,026
   and appears in 273 postings.

4. KAFKA
   Kafka has a median salary of approximately $145,538
   and appears in 141 postings.

5. JIRA
   Jira has a median salary of approximately $145,000
   and appears in 798 postings.

6. SQL SERVER
   SQL Server appears in 1,102 postings with a median salary
   of approximately $100,200.

7. JAVASCRIPT
   JavaScript appears in 859 postings with a median salary
   of approximately $103,250.

8. GO
   Go has one of the highest demand counts in the results,
   appearing in 1,714 postings, with a median salary of
   approximately $102,250.


============================================================
CONCLUSION
============================================================

The results show that the highest-paying skills are not
necessarily the most frequently requested skills.

TypeScript has the highest median salary in this analysis,
but its relatively low demand suggests that the result should
not be interpreted as TypeScript being the most important skill
for Data Analysts.

Skills such as Go, SQL Server, JavaScript, Databricks, Jira,
and DAX demonstrate a stronger combination of market demand
and compensation.

Therefore, Data Analysts should consider both salary potential
and employer demand when deciding which technical skills to
develop.
*/

/*Recommendation:
Data Analysts should prioritize core analytical skills 
such as SQL, Excel, Python, Power BI/Tableau, and data visualization. 
Although specialized technologies such as PySpark, Kafka, Databricks, 
and TypeScript appear in some Data Analyst postings, their presence 
may reflect the growing overlap between Data Analytics, 
Analytics Engineering, and Data Engineering. 
These skills should therefore be considered as specialization 
options rather than essential Data Analyst competencies.*/
