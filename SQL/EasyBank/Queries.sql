-- List of people and their contacts who are 18 or older and making over a certain amount
SELECT first_name, last_name, email, phone
FROM customer
WHERE age >= 18 AND salary > 50000;


-- Compare the number of accounts by branches
SELECT branch_id, COUNT(*) AS account_count
FROM account
GROUP BY branch_id;

-- Average salary difference between people under 30 and people above 40 years old, I didn't use ages above 50 lol.
WITH avg_salaries AS (
    SELECT
        AVG(CASE WHEN age < 30 THEN salary END) AS avg_salary_under_30,
        AVG(CASE WHEN age > 40 THEN salary END) AS avg_salary_above_40
    FROM customer
)
SELECT avg_salary_above_40 - avg_salary_under_30 AS avg_salary_difference
FROM avg_salaries;