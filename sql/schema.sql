-- HR Attrition Analytics - Database Setup
-- Creates the database and table, then loads the cleaned CSV
-- (the CSV comes from running HR_Attrition_EDA.ipynb first)

CREATE DATABASE hr_analytics_project;
GO

USE hr_analytics_project;
GO

CREATE TABLE employees (
    Age INT,
    Attrition VARCHAR(5),
    BusinessTravel VARCHAR(30),
    DailyRate INT,
    Department VARCHAR(30),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(30),
    EmployeeNumber INT,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(30),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(15),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    OverTime VARCHAR(5),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);
GO

-- Load the cleaned CSV (adjust the path to wherever you saved it
-- after running the notebook)
BULK INSERT employees
FROM 'C:\path\to\HR_Attrition_Cleaned.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- Quick check that everything loaded
SELECT COUNT(*) AS TotalRows FROM employees;
-- Should be 1470
