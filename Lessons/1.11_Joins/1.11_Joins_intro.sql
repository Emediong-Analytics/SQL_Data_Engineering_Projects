SELECT *
FROM skills_job_dim
LIMIT 10;

SELECT *
FROM skills_dim
LIMIT 10;

SELECT 
        jpf.job_id, 
        jpf.job_title_short,
        sjd.skill_id,
        sd.skills
FROM job_postings_fact jpf
JOIN skills_job_dim sjd
ON jpf.job_id = sjd.job_id
JOIN skills_dim sd
ON sjd.skill_id = sd.skill_id;


SHOW TABLES;

SELECT *
FROM skills_dim;