# HR Attrition Analytics

**Quick summary:** analyzed 1,470 employees to figure out why people
leave. Overall attrition is 16.12%, but overtime is the biggest
factor by far (30.5% attrition vs 10.4% for those without it), and
entry-level roles carry most of the risk — Sales Representative
alone has a 39.8% attrition rate.

Looked at why employees leave a company, using Python, SQL Server,
and Power BI together. Wanted a project that used Python alongside
SQL and Power BI, and a dataset outside of e-commerce/sales, so I
went with employee attrition.

Dataset: [IBM HR Analytics Employee Attrition Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)
on Kaggle. 1,470 employees, 35 columns covering things like age,
department, income, job satisfaction, overtime, and tenure, with a
Yes/No attrition column as the target.

## What I did

Loaded the CSV into a Jupyter notebook with pandas, checked the
shape and data types, and found three columns that never changed
for any employee (EmployeeCount, Over18, StandardHours) — dropped
those since they had no analytical value. No missing values or
duplicates otherwise, so cleaning was quick. That notebook is
[HR_Attrition_EDA.ipynb](./notebook/HR_Attrition_EDA.ipynb).

Did an initial pass in Python using groupby, value_counts, and
crosstab to get a first read on the data before moving to SQL. Then
loaded the cleaned data into SQL Server — table setup is in
[schema.sql](./sql/schema.sql) — and wrote the deeper analysis
queries — aggregations, CASE WHEN for conditional counts, a window
function for the overall attrition percentage. Queries are in
[hr_analysis_queries.sql](./sql/hr_analysis_queries.sql).
Doing a first pass in Python and then rebuilding the main numbers
in SQL worked out as a decent double-check on my own work — a
couple of numbers didn't match at first until I found a rounding
difference between the two.

Built a 3-page Power BI dashboard on top of the SQL table:
- **Overview** — attrition rate, average income, attrition by
  department and job role
- **Job & Salary Analysis** — income vs attrition by job level, full
  role breakdown table
- **Work-Life Factors** — overtime vs no-overtime attrition, job
  satisfaction, age vs tenure scatter plot

Screenshots are in `/screenshots`.

## What I found

Full notes in [business_insights.md](./business_insights.md).
Main things:

- Overall attrition is 16.12%
- Overtime is the strongest signal in the data — employees working
  overtime leave almost 3x more often (30.5% vs 10.4%)
- Attrition is concentrated in entry-level roles, not spread evenly.
  Sales Representative has the highest attrition of any role
  (39.8%), and Job Level 1 (lowest tier) is both the biggest group
  in the company and has the highest attrition, on the lowest pay
- People who left earned about 30% less and had less tenure, but had
  worked at roughly the same number of past companies as people who
  stayed — so it's not that they're serial job-hoppers, something
  about these specific roles seems to push people out
- Job satisfaction follows the expected pattern (lower satisfaction,
  higher attrition), but it never drops to zero even at the top
  satisfaction level

## Limitations

This is a single static dataset, not tracked over time, so it shows
a snapshot rather than trends. A few things worth keeping in mind:

- The HR department only has 63 employees, so its attrition numbers
  swing a lot with just a couple of departures — I'd treat that one
  with more caution than Sales or R&D
- Everything here is correlation, not proof of cause. Overtime
  correlates strongly with attrition, but the dataset can't tell me
  *why* — it could be that overtime itself pushes people to leave,
  or it could run the other way (employees already planning to
  leave get assigned less desirable overtime-heavy shifts), or some
  third factor (like being in a demanding role) could be driving
  both

## How to run this

1. Download the dataset from Kaggle
2. Run [HR_Attrition_EDA.ipynb](./notebook/HR_Attrition_EDA.ipynb) to clean
   the data and export `HR_Attrition_Cleaned.csv`
3. Run [schema.sql](./sql/schema.sql) to create and load the
   `employees` table in SQL Server
4. Run the queries in `sql/hr_analysis_queries.sql` if you want to
   reproduce the SQL-side analysis
5. Open the Power BI file and connect it to your SQL Server instance
