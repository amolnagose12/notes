USE [PRODUCT DATABASE]
GO

/******************  STRING OPERATIONS  **********************/
SELECT * FROM PRODUCTS_DATA
SELECT	EnglishProductName  FROM PRODUCTS_DATA

SELECT  EnglishProductName, REPLACE(EnglishProductName, 'Race', 'Racing') AS REPLACED_Output  FROM PRODUCTS_DATA
SELECT  EnglishProductName, reverse(EnglishProductName) AS reverse_name FROM PRODUCTS_DATA
SELECT  EnglishProductName, LEN(EnglishProductName) AS number_of_characters  FROM PRODUCTS_DATA
SELECT  EnglishProductName, UPPER(EnglishProductName) AS UPPERCASE_NAME  FROM PRODUCTS_DATA
SELECT  EnglishProductName, LOWER(EnglishProductName) AS LOWERCASE_NAME  FROM PRODUCTS_DATA
SELECT ltrim ('  SQLserVer')	-- TO TRUNCATE EXTRA SPACES IN GIVEN STRING OUTPUT. LEFT TO THE VALUE
SELECT Rtrim ('SQLserVer    ')	-- TO TRUNCATE EXTRA SPACES IN GIVEN STRING OUTPUT. RIGHT TO THE VALUE
SELECT LEFT(EnglishProductName,3) AS Name FROM PRODUCTS_DATA
SELECT RIGHT(EnglishProductName,3) AS Name FROM PRODUCTS_DATA
SELECT UPPER(LEFT(EnglishProductName,3)) AS TitleCase FROM PRODUCTS_DATA
SELECT SUBSTRING(EnglishProductName, 5, 20) AS EnglishProductName  FROM PRODUCTS_DATA 

-- STUFF(string, start, length, new_string)
-- Delete 1 character from a string, starting in position 11, and then insert " is fun!" in position 11:
SELECT STUFF('SQL Servers', 11, 1, ' is fun!');
SELECT STUFF('ABCD', 2, 2, ' 23 ');


SELECT REPLICATE('0', 10); -- '0000000000'

SELECT CHARINDEX(' ' , 'Indigo Montoya'); -- 7      (FOR CHARACTER BASED SEARCH)

SELECT PATINDEX('%[A-Z]%', 'abcd123efgh'); -- 1		(FOR ALPHABETIC PATTERN SEARCH)

SELECT PATINDEX('%[0-9]%', 'abcd123efgh'); -- 5		(FOR NUMERIC PATTERN SEARCH)


