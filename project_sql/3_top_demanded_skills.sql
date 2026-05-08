SELECT 
    skills,
    COUNT(skills_dim.skill_id) AS skill_count

FROM
    job_postings_fact

LEFT JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id

LEFT JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_work_from_home = True
    AND job_title_short = 'Data Analyst'

GROUP BY
    skills_dim.skill_id,
    skills_dim.skills

ORDER BY skill_count DESC

LIMIT 5;


--TOP 5 Most Demanded Skills for Remote Data Analyst Roles, Descending Order:
/*
SQL
Excel
Python
Tableau
Power Bi
*/