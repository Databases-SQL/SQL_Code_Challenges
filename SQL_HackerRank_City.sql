-- The CITY table is described as follows:

-- CITY
-- Field         Туре
-------------------------
-- ID            NUMBER
-- NAME          VARCHAR2 ( 17)
-- COUNTRYCODE   VARCHAR2(3)
-- DISTRICT      VARCHAR2 (20)
-- POPULATION    NUMBER


'''
Query all columns for all American cities in the CITY table with populations larger than 100000. 
The CountryCode for America is USA.
'''
Select * From CITY
Where population > 100000
And Countrycode ='USA'

----------------------------------------------------
'''
Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
The CountryCode for America is USA.
'''

SELECT NAME FROM CITY
WHERE POPULATION > 120000
AND COUNTRYCODE = 'USA'

-----------------------------------------------------

'''
Query all columns (attributes) for every row in the CITY table.
'''

SELECT * FROM CITY

------------------------------------------------------

'''
Query all columns for a city in CITY with the ID 1661.
'''
SELECT * FROM CITY
WHERE ID = 1661
------------------------------------------------------ 