-- HR Attrition Analytics - Analysis Queries
-- Dataset: IBM HR Analytics Employee Attrition (Kaggle), 1470 rows
-- Cleaned in Python first (dropped 3 columns that never changed:
-- EmployeeCount, Over18, StandardHours)

USE hr_analytics_project;
GO


-- Q1: Overall attrition rate
SELECT 
    Attrition,
    COUNT(*) AS EmployeeCount,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage
FROM employees
GROUP BY Attrition;


-- Q2: Attrition rate by department and job role
SELECT 
    Department,
    JobRole,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employees
GROUP BY Department, JobRole
ORDER BY AttritionRate DESC;


-- Q3: Income and attrition by job level
SELECT 
    JobLevel,
    COUNT(*) AS TotalEmployees,
    ROUND(AVG(MonthlyIncome), 2) AS AvgMonthlyIncome,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employees
GROUP BY JobLevel
ORDER BY JobLevel;


-- Q4: OverTime vs attrition
SELECT 
    OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employees
GROUP BY OverTime;


-- Q5: Age and tenure, leavers vs stayers
SELECT 
    Attrition,
    ROUND(AVG(Age), 1) AS AvgAge,
    ROUND(AVG(YearsAtCompany), 1) AS AvgYearsAtCompany,
    ROUND(AVG(TotalWorkingYears), 1) AS AvgTotalWorkingYears,
    ROUND(AVG(NumCompaniesWorked), 1) AS AvgCompaniesWorked
FROM employees
GROUP BY Attrition;


-- Q6: Job satisfaction vs attrition
SELECT 
    JobSatisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;
