/* 
Question: What are the top paying data analyst jobs?
*/

SELECT
    job_id AS ID,
    job_title AS Title,
    job_location AS Location,
    job_country AS Country,
    job_schedule_type AS Schedule,
    ROUND(salary_year_avg, 0) AS Average_Salary,
    job_posted_date:: DATE AS Posted_Date,
    CURRENT_DATE - job_posted_date:: DATE AS Posting_Age_in_Days, -- calculates how old the job posting is
    name AS Company_Name
FROM
    job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    job_title_short = 'Data Analyst' AND
    job_country IN ('Canada', 'United States') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;