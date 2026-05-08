--Over complicating query to prove my knowledge of CTEs and subqueries.
--More concise query shown below.
/*
Final Note: Ideally, I would normalize the demand count and average salary to 
a 0-1 scale using the max values of each metric and then calculate a combined score to truly rank
 the skills, but just for the sake of conciseness I'll leave it out.
*/

WITH top_paying_skills AS (  
    SELECT
        skills,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary_per_skill
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY
        skills_dim.skill_id,
        skills_dim.skills
),

top_demanded_skills AS (
    SELECT
        skills,
        COUNT(skills_dim.skill_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY
        skills_dim.skill_id,
        skills_dim.skills
)

SELECT *

FROM (
    SELECT
        top_paying_skills.skills AS skill,
        demand_count,
        avg_salary_per_skill
        
    FROM top_paying_skills
    INNER JOIN top_demanded_skills
        ON top_paying_skills.skills = top_demanded_skills.skills
    ) AS optimal_skills

WHERE demand_count > 10

ORDER BY 
    avg_salary_per_skill DESC

/*
SELECT
    skills,
    COUNT(skills_dim.skill_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary_per_skill

FROM job_postings_fact

INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True

GROUP BY
    skills_dim.skill_id,
    skills_dim.skills

HAVING 
    COUNT(skills_dim.skill_id) > 10

ORDER BY avg_salary_per_skill DESC
*/