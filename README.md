# Data Analyst Job Market Analysis
A SQL-based analysis of the data analyst job market, focusing on remote roles. This project explores top-paying jobs, in-demand skills, and the most optimal skills to learn for maximizing both employability and salary.

## Tools Used
- **SQL** (PostgreSQL)
- **VS Code**
- **Git & GitHub**

---

## The Analysis

### 1. Top Paying Data Analyst Jobs
Identifies the top 10 highest-paying remote Data Analyst roles with specified salaries.

[View Query](project_sql/1_top_paying_jobs.sql)

**Results:** Top 10 highest-paying remote Data Analyst roles:

| Company | Job Title | Avg Yearly Salary |
|---------|-----------|-------------------|
| Mantys | Data Analyst | $650,000 |
| Meta | Director of Analytics | $336,500 |
| AT&T | Associate Director - Data Insights | $255,830 |
| Pinterest | Data Analyst, Marketing | $232,423 |
| UCLA Health | Data Analyst (Hybrid/Remote) | $217,000 |
| SmartAsset | Principal Data Analyst (Remote) | $205,000 |
| Inclusively | Director, Data Analyst - HYBRID | $189,309 |
| Motional | Principal Data Analyst, AV Performance Analysis | $189,000 |
| SmartAsset | Principal Data Analyst | $186,000 |
| Patterned Learning AI | Senior Data Analyst | $185,000 |

> Note: The top salary of $650,000 at Mantys is a significant outlier. Most top-paying roles are senior/director level positions ranging from $185,000–$336,500.

---

### 2. Skills for Top Paying Jobs
Using a CTE to find what skills are associated with the top 10 highest-paying remote Data Analyst roles.

[View Query](project_sql/2_top_paying_job_skills.sql)

**Results:** Based on the top 10 highest-paying job postings:
- SQL — 8 appearances
- Python — 7 appearances
- Tableau — 6 appearances
- Other notable skills: R, Snowflake, Pandas, Excel

---

### 3. Most In-Demand Skills
Finds the top 5 most frequently requested skills in remote Data Analyst job postings.

[View Query](project_sql/3_top_demanded_skills.sql)

**Results:** Top 5 most demanded skills for remote Data Analyst roles:
| Rank | Skill |
|------|-------|
| 1 | SQL |
| 2 | Excel |
| 3 | Python |
| 4 | Tableau |
| 5 | Power BI |

---

### 4. Top Paying Skills
Finds the average salary associated with each skill for remote Data Analyst roles.

[View Query](project_sql/4_top_paying_skills.sql)

**Results:**
- **Big Data & ML** pays the most — PySpark, Pandas, NumPy, Jupyter
- **DevOps/Engineering crossover** boosts salary — GitLab, Kubernetes, Airflow
- **Cloud skills** are increasingly valuable — Databricks, Elasticsearch, GCP

---

### 5. Most Optimal Skills to Learn
Combines demand and salary data to identify skills that are both highly sought after and well compensated. Only includes skills with more than 10 job postings to ensure statistical relevance.

> Note: A more rigorous approach would normalize both demand count and average salary to a 0–1 scale using their respective max values, then compute a weighted combined score. This is left out here for conciseness but would be the ideal next step.

[View Query](project_sql/5_optimal_skills.sql)

**Results:** Top optimal skills balancing demand and salary:

| Skill | Demand Count | Avg Salary |
|-------|-------------|------------|
| Python | 236 | $101,397 |
| Tableau | 230 | $99,288 |
| SQL | 398 | $97,237 |
| Power BI | 110 | $97,431 |
| Excel | 256 | $87,288 |
| Snowflake | 37 | $112,948 |
| Azure | 34 | $111,225 |
| AWS | 32 | $108,317 |
| Looker | 49 | $103,795 |
| Oracle | 37 | $104,534 |

> Note: SAS appeared multiple times in the raw results as a duplicate — this would be worth investigating in the data. SQL has the highest demand (398) while Snowflake offers the best salary-to-demand balance among cloud tools.

---

## Key Takeaways
- **SQL, Python, and Tableau** dominate both demand and top-paying job requirements
- **Big data and ML skills** (PySpark, Pandas) command the highest salaries
- **Cloud proficiency** (AWS, Azure, GCP) is increasingly valuable and well compensated
- For someone entering the field, **SQL + Python + Tableau** represents the highest ROI skill set

