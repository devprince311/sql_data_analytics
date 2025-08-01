with top_paying_comps as
(
    SELECT
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    name AS company_name
    FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title like '%Product%Analyst' and salary_year_avg IS NOT NULL
    AND job_location='Anywhere'
    ORDER BY
    salary_year_avg DESC
    LIMIT 10
)

select top_paying_comps.* ,skills
from top_paying_comps
inner JOIN skills_job_dim ON top_paying_comps.job_id = skills_job_dim.job_id
inner JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg desc

--THIS DATA WAS TAKEN FROM THE TOP PAYING JOBS IN THE PRODUCT ANALYST ROLE
-- Top Technical Skills from Top Job Listings:    
-- 1. SQL        - appeared 6 times
-- 2. Python     - appeared 5 times
-- 3. R          - appeared 3 times
-- 4. SAS        - appeared 2 times
-- 5. Tableau    - appeared 2 times
-- 6. Excel      - appeared 2 times

--These suggest strong demand for data handling (SQL, Excel), analytics/programming (Python, R, SAS), and visualization tools (Tableau). 