-- The Employee table containing employee data for a company is described as follows:

-- Column           Type
-- -------          ----------
-- employee_id      Integer
-- name             Integer
-- months           String
-- salary           Integer


-----------------------------------------------------------

'''
Write a query that prints a list of employee names 
(i.e.: the name attribute) from the Employee table in alphabetical order.
'''

SELECT NAME
FROM EMPLOYEE
ORDER BY NAME ASC;

-----------------------------------------------------------

'''
Write a query that prints a list of employee names (i.e.: the name attribute) 
for employees in Employee having a salary greater than $2000 per month 
who have been employees for less than 10 months. 
Sort your result by ascending employee_id.
'''

SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000
AND MONTHS < 10
ORDER BY EMPLOYEE_ID;

------------------------------------------------------------
'''
We define an employees total earnings to be their monthly months * salary worked, 
and the maximum total earnings to be the maximum total earnings for 
any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as 
the total number of employees who have maximum total earnings. 
Then print these values as 2 space-separated integers.
'''
SELECT (SALARY * MONTHS) as earnings, count(*)
FROM EMPLOYEE
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;

--OR

SELECT MAX(SALARY * MONTHS) AS max_total_earnings,
       COUNT(*) AS num_employees_with_max_earnings
FROM EMPLOYEE
WHERE SALARY * MONTHS = (SELECT MAX(SALARY * MONTHS) FROM EMPLOYEE);

-------------------------------------------------------------




