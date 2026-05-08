SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary_per_skill

FROM
    job_postings_fact

LEFT JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True

GROUP BY
    skills_dim.skill_id,
    skills_dim.skills

ORDER BY avg_salary_per_skill DESC

LIMIT 25;

--Top Paying Skills for Remote Data Analyst Roles, Descending Order:
/*
Big Data & ML pays most, using PySpark, Pandas, NumPy, Jupyter
DevOps/Engineering crossover boosts salary, using GitLab, Kubernetes, Airflow
Cloud skills are increasingly valuable, using Databricks, Elasticsearch, GCP
*/
