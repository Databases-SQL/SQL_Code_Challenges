-- The STATION table is described as follows:

-- STATION
-- Field   Type
-----------------
-- ID      NUMBER 
-- CITY    VARCHAR2 (21)
-- STATE   VARCHAR2 (2)
-- LAT_N   NUMBER
-- LONG_W  NUMBER

--------------------------------------------------

'''
Query a list of CITY and STATE from the STATION table.
'''

SELECT CITY, STATE 
FROM STATION;

---------------------------------------------------
'''
Query a list of CITY names from STATION for cities that have an even ID number. 
Print the results in any order, but exclude duplicates from the answer.
'''
SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0;

--------------------------------------------------
'''
Find the difference between the total number of CITY entries in the table 
and the number of distinct CITY entries in the table.
'''
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) 
FROM STATION;

--------------------------------------------------
'''
Query the two cities in STATION with the shortest and longest CITY names, 
as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, 
choose the one that comes first when ordered alphabetically.
When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths 3,3,4 and 3. 
The longest name is PQRS, but there are 3 options for shortest named city. 
Choose ABC, because it comes first alphabetically.

Note
You can write two separate queries to get the desired output. 
It need not be a single query.
'''
(SELECT CITY, LENGTH(CITY) AS len
 FROM STATION
 ORDER BY len, CITY
 LIMIT 1)

UNION ALL

(SELECT CITY, LENGTH(CITY) AS len
 FROM STATION
 ORDER BY len DESC, CITY
 LIMIT 1);

 ---------------------------------------------------------

 '''
 Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
 Your result cannot contain duplicates.
 '''

SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTRING(CITY FROM 1 FOR 1)) IN ('A', 'E', 'I', 'O', 'U');

SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiouAEIOU]';
----------------------------------------------------------------------------

'''
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
Your result cannot contain duplicates.
'''

SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(RIGHT(CITY,1) IN ('A', 'E', 'I', 'O', 'U'));

-- USING REGEX
'''
Use the REGEXP operator to match CITY names that end with any vowel (uppercase or lowercase). 
The $ sign represents the end of the string.
'''

SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '[aeiouAEIOU]$';

------------------------------------------------------------------------------

'''
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.
'''

SELECT DISTINCT CITY 
FROM STATION
WHERE LOWER(LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u'))
AND LOWER(RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u'));


--USING REGEX

SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiouAEIOU]'
AND CITY REGEXP '[aeiouAEIOU]$';

--------------------------------------------------------------------------------

'''
Query the list of CITY names from STATION that do not start with vowels. 
Your result cannot contain duplicates.
'''
SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(LEFT(CITY, 1) NOT IN ('A', 'E', 'I', 'O', 'U'));

--USING REGEX
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP ('^[AEIOUaeiou]');

--------------------------------------------------------------------------------
'''
Query the list of CITY names from STATION that do not end with vowels. 
Your result cannot contain duplicates.
'''
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP('[AEIOUaeiou]$')

SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(RIGHT(CITY,1) NOT IN ('A','E','I','O','U'));

---------------------------------------------------------------------------------

'''
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
Your result cannot contain duplicates.
'''

SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(LEFT(CITY,1) NOT IN ('A','E','I','O','U'))
OR UPPER(RIGHT(CITY,1) NOT IN ('A','E','I','O','U'));

--USING REGEX

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP('^[AEIOUaeiou]')
OR CITY NOT REGEXP('[AEIOUaeiou]$');

----------------------------------------------------------------------------------
'''
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
Your result cannot contain duplicates.
'''
SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(LEFT(CITY,1) NOT IN ('A','E','I','O','U'))
AND UPPER(RIGHT(CITY,1) NOT IN ('A','E','I','O','U'));

--USING REGEX

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP('^[AEIOUaeiou]')
AND CITY NOT REGEXP('[AEIOUaeiou]$');
-----------------------------------------------------------------------------------

'''
Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of  decimal places.
The sum of all values in LONG_W rounded to a scale of  decimal places.
'''

SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2)
FROM STATION;

----------------------------------------------------------------------------------
'''
Query the sum of Northern Latitudes (LAT_N) from STATION 
having values greater than  and less than. 
Truncate your answer to  decimal places.
'''

SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE ROUND(LAT_N, 4) > 38.7880
AND ROUND(LAT_N, 4) < 137.2345;

----------------------------------------------------------------------------------
