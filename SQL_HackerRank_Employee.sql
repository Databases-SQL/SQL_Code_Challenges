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
ORDER BY NAME ASC

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
ORDER BY EMPLOYEE_ID

------------------------------------------------------------

