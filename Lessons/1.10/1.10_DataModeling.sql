SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM
    job_postings_fact
LIMIT 10;

SELECT * FROM job_postings_fact;

SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM
    job_postings_fact
WHERE salary_year_avg IS NOT NULL
LIMIT 10;

SELECT * 
FROM company_dim;

SELECT * 
FROM skills_dim;

SELECT * 
FROM information_schema.tables;
PRAGMA show_tables;

