CREATE DATABASE cardiovascular_project;
USE cardiovascular_project;

CREATE TABLE cardiovascular_risk (
patient_id INT,
age INT,
bmi FLOAT,
systolic_bp INT,
diastolic_bp INT,
cholesterol_mg_dl INT,
resting_heart_rate INT,
smoking_status VARCHAR(20),
daily_steps INT,
physical_activity_hours_per_week FLOAT,
sleep_hours FLOAT,
family_history_disease VARCHAR(20),
diet_quality_score FLOAT,
alcohol_units_per_week FLOAT,
heart_disease_risk_score FLOAT,
risk_category VARCHAR(20)
);
SHOW TABLES;
DESCRIBE cardiovascular_risk;

LOAD DATA LOCAL INFILE 'C:/Users/SHRADHA/OneDrive/Desktop/project 2 cardiovascular risk/cardio_dataset.csv'
INTO TABLE cardiovascular_risk
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(patient_id, age, bmi, systolic_bp, diastolic_bp, cholesterol_mg_dl, resting_heart_rate, smoking_status, daily_steps, physical_activity_hours_per_week, sleep_hours, family_history_disease, diet_quality_score, alcohol_units_per_week, heart_disease_risk_score, risk_category);

SELECT *
FROM cardiovascular_risk
LIMIT 10;

SHOW COLUMNS FROM cardiovascular_risk;

SELECT COUNT(*) 
FROM cardiovascular_risk;

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 
'C:/Users/SHRADHA/OneDrive/Desktop/project 2 cardiovascular risk/cardiovascular_risk_dataset.csv'
INTO TABLE cardiovascular_risk
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(patient_id, age, bmi, systolic_bp, diastolic_bp, cholesterol_mg_dl, resting_heart_rate, smoking_status, daily_steps, physical_activity_hours_per_week, sleep_hours, family_history_disease, diet_quality_score, alcohol_units_per_week, heart_disease_risk_score, risk_category);

SELECT COUNT(*) 
FROM cardiovascular_risk;

SELECT *
FROM cardiovascular_risk
LIMIT 10;
DROP TABLE cardiovascular_risk;

SELECT COUNT(*) 
FROM cardiovascular_risk_dataset;

SELECT *
FROM cardiovascular_risk_dataset;

SELECT risk_category, COUNT(*) AS total_patients    # first querry
FROM cardiovascular_risk_dataset
GROUP BY risk_category;

SELECT COUNT(*) AS total_patients
FROM cardiovascular_risk_dataset;

SELECT 
AVG(age) AS avg_age,
AVG(bmi) AS avg_bmi,
AVG(systolic_bp) AS avg_systolic_bp,
AVG(diastolic_bp) AS avg_diastolic_bp
FROM cardiovascular_risk_dataset;

SELECT smoking_status,
AVG(heart_disease_risk_score) AS avg_risk_score
FROM cardiovascular_risk_dataset
GROUP BY smoking_status;

SELECT 
CASE
WHEN bmi < 18.5 THEN 'Underweight'
WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal'
WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
ELSE 'Obese'
END AS bmi_category,
AVG(heart_disease_risk_score) AS avg_risk
FROM cardiovascular_risk_dataset
GROUP BY bmi_category;

SELECT physical_activity_hours_per_week,
AVG(heart_disease_risk_score) AS avg_risk
FROM cardiovascular_risk_dataset
GROUP BY physical_activity_hours_per_week
ORDER BY physical_activity_hours_per_week;

SELECT sleep_hours,
AVG(heart_disease_risk_score) AS avg_risk
FROM cardiovascular_risk_dataset
GROUP BY sleep_hours
ORDER BY sleep_hours;

SELECT family_history_heart_disease,
AVG(heart_disease_risk_score) AS avg_risk
FROM cardiovascular_risk_dataset
GROUP BY family_history_heart_disease;

SELECT daily_steps,
AVG(heart_disease_risk_score) AS avg_risk
FROM cardiovascular_risk_dataset
GROUP BY daily_steps
ORDER BY daily_steps;



SELECT 
CASE
    WHEN alcohol_units_per_week BETWEEN 0 AND 3 THEN 'Low Alcohol'
    WHEN alcohol_units_per_week BETWEEN 4 AND 6 THEN 'Medium Alcohol'
    WHEN alcohol_units_per_week BETWEEN 7 AND 10 THEN 'High Alcohol'
    ELSE 'Very High Alcohol'
END AS alcohol_category,

AVG(heart_disease_risk_score) AS avg_risk_score,
COUNT(*) AS total_people

FROM cardiovascular_risk_dataset

GROUP BY alcohol_category
ORDER BY avg_risk_score DESC;

SELECT 
CASE
    WHEN alcohol_units_per_week BETWEEN 0 AND 3 THEN 'Low Alcohol'
    WHEN alcohol_units_per_week BETWEEN 4 AND 6 THEN 'Medium Alcohol'
    WHEN alcohol_units_per_week BETWEEN 7 AND 10 THEN 'High Alcohol'
    ELSE 'Very High Alcohol'
END AS alcohol_category,

smoking_status,
AVG(heart_disease_risk_score) AS avg_risk_score,
COUNT(*) AS total_people

FROM cardiovascular_risk_dataset

GROUP BY alcohol_category, smoking_status
ORDER BY avg_risk_score DESC;

SELECT 
patient_id,
age,
bmi,
systolic_bp,
diastolic_bp,
smoking_status,
alcohol_units_per_week,
heart_disease_risk_score,
risk_category

FROM cardiovascular_risk_dataset

ORDER BY heart_disease_risk_score DESC
LIMIT 10;