SELECT
    skills,
    round(AVG(salary_year_avg)) AS avg_salary,
    COUNT(*) AS job_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title LIKE '%Product%Analyst%' and salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 200;


--while skills like react shell express offer the highest salaries
--sql,tableau,python has exponentially high postings with salary above 100k
