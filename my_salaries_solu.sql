-- 1	Show all columns and rows in the table.
SELECT 
    *
FROM
    salaries;


-- 2	Show only the EmployeeName and JobTitle columns.
SELECT 
    EmployeeName, JobTitle
FROM
    salaries;


-- 3	Show the number of employees in the table.
SELECT 
    COUNT(EmployeeName)
FROM
    salaries;

-- 4	Show the unique job titles in the table.
SELECT DISTINCT
    JobTitle
FROM
    salaries;

-- 5	Show the job title and overtime pay for all employees with 
-- overtime pay greater than 50000.
SELECT 
    JobTitle, OvertimePay
FROM
    salaries
WHERE
    OvertimePay > 50000;

-- 6	Show the average base pay for all employees.
SELECT 
    EmployeeName, AVG(BasePay) AS avg_basepay
FROM
    salaries
GROUP BY EmployeeName;

-- 7	Show the top 10 highest paid employees.
SELECT 
    EmployeeName, TotalPay
FROM
    salaries
ORDER BY TotalPay DESC
LIMIT 10;

-- 8	Show the average of BasePay, OvertimePay, and OtherPay for each employee:
SELECT 
    EmployeeName,
    ROUND((BasePay + OvertimePay + OtherPay) / 3,
            2)
FROM
    salaries;

-- 9	Show all employees who have the word "Manager" in their job title.
SELECT 
    EmployeeName, JobTitle
FROM
    salaries
WHERE
    JobTitle LIKE '%manager%';

-- 10	Show all employees with a job title not equal to "Manager".
SELECT 
    EmployeeName, JobTitle
FROM
    salaries
WHERE
    JobTitle NOT LIKE '%manager%';

-- 11	Show all employees with a total pay between 50,000 and 75,000.
SELECT 
    Id, EmployeeName, JobTitle, TotalPay
FROM
    salaries
WHERE
    TotalPay BETWEEN 50000 AND 75000;


-- 12	Show all employees with a base pay less than 50,000 
-- or a total pay greater than 100,000.
SELECT 
    Id, EmployeeName, JobTitle
FROM
    salaries
WHERE
    BasePay < 50000 OR TotalPay > 100000;

-- 13	Show all employees with a total pay benefits value 
-- between 125,000 and 150,000 and a job title containing the word "Director".
SELECT 
    Id, EmployeeName, JobTitle, TotalPay
FROM
    salaries
WHERE
    TotalPay BETWEEN 125000 AND 150000
        AND JobTitle LIKE '%Director%';

-- 14	Show all employees ordered by their total pay benefits in descending order.
SELECT 
    Id, EmployeeName, JobTitle, TotalPay
FROM
    salaries
ORDER BY TotalPay DESC;
-- 15	Show all job titles with an average base pay of 
-- at least 100,000 and order them by the average base pay in descending order.
SELECT 
    JobTitle, AVG(BasePay) AS base_avg
FROM
    salaries
GROUP BY JobTitle
HAVING base_avg >= 100000
ORDER BY base_avg DESC;


-- 16	Delete the column note.
ALTER TABLE salaries
DROP COLUMN Notes;

-- 17	Update the base pay of all employees with 
-- the job title containing "Manager" by increasing it by 10%.
UPDATE salaries 
SET 
    Basepay = (Basepay * 1.10)
WHERE
    JobTitle LIKE '%Manager%';

-- 18	Delete all employees who have no OvertimePay.
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    OvertimePay = 0;

DELETE FROM salaries 
WHERE
    OvertimePay = 0;

SELECT * FROM salaries;



