SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short like '%Analyst%'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

-- High-Paying Skills :
-- 'pandas' has the highest average salary at $146,476, though it's only in 13 postings — suggesting it’s highly valued when required.
-- 'databricks' also ranks high at $134,043, seen in 19 postings.

-- High Demand & Good Salary:
-- 'snowflake' appears in 64 postings (most frequent) with a strong average salary of $115,597 — making it a highly marketable skill.
-- 'go' is in 43 postings, averaging $115,607 — not typically a core data analyst skill, but valued where used.

