/*
Question: What are the most in-demand SKILLS for Data Analysts?
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country IN ('Canada', 'United States')
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Key Findings:
-SQL the most demanded skill by a large marigin
-Excel and Tableu follow the trend
*/