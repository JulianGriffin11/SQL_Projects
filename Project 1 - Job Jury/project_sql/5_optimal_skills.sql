/*
Question: What are the most in demand AND highest paying SKILLS (optimal) for Data Analysts?
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
        job_country IN ('Canada', 'United States') AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
)

SELECT
    skills,
    demand_count,
    avg_salary
FROM
    skills_info
ORDER BY
    demand_count DESC, avg_salary DESC
LIMIT 25;

/*
Top 5 Skills:
1. SQL
2. Excel 
3. Python 
4. Tableu
5. R 

Of these 5 skills, Python pays the most (indicated through salary).
*/