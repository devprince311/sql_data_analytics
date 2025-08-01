SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS noofpostings
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short like '%Analyst%'
GROUP BY
    skills
ORDER BY
    noofpostings DESC
LIMIT 5;

--WHILE LOOKING ONTO THE SKILLS NEEDED FOR ANY ANALYST IT WAS FOUND THAT
--SQL IS THE MOST REQUIRED FOLLOWED BY EXCEL
--3.PYTHON,4.TABLEAU,5.POWERBI
--TABLEAU AND POWERBI HAD SIMILAR POSTINGS