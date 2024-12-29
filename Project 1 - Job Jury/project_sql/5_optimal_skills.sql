/*
Question: What are the most in demand AND highest paying skills (optimal) for data analysts?
*/

WITH skills_info AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
)

SELECT
    skill_id,
    skills,
    demand_count,
    avg_salary
FROM
    skills_info
ORDER BY
    demand_count DESC, avg_salary DESC
LIMIT 25;