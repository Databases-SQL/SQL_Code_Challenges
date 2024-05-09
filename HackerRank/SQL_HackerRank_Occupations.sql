-- The OCCUPATIONS table is described as follows:

-- OCCUPATIONS 
-- Column           Type
---------------------------
-- Name             String
-- Occupation       String

-- Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

-------------------------------------------------------------------------------------------------------------

'''
Generate the following two result sets:

1. Query an alphabetically ordered list of all names in OCCUPATIONS, 
immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

2. Query the number of ocurrences of each occupation in OCCUPATIONS. 
  Sort the occurrences in ascending order, and output them in the following format: There are a total of [occupation_count] [occupation]s.
  Where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. 
  If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

'''

Select concat(Name,'(', left(Occupation,1),')')
From OCCUPATIONS
Order by Name;

Select concat('There are a total of ', count(Occupation) ,' ' , Lower(Occupation),'s.') 
From OCCUPATIONS 
Group by occupation 
Order by count(Name), Occupation

--------------------------------------------------------------------------------------------------------------------------------------------------

'''
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.
'''

SELECT 
    MAX(CASE WHEN Occupation='Doctor' THEN Name END) AS d,
    MAX(CASE WHEN Occupation='Professor' THEN Name END) AS p,
    MAX(CASE WHEN Occupation='Singer' THEN Name END) AS s,
    MAX(CASE WHEN Occupation='Actor' THEN Name END) AS a
FROM (
        SELECT *, 
        ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS row_num
        FROM Occupations) as T
GROUP BY row_num
ORDER BY row_num

------------------------------------------------------------------------------------------------------------------------------------------------
