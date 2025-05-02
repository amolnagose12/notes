/*
JSON (JavaScript Object Notation) is a lightweight data-interchange format. 
Based on a subset of the JavaScript Programming Language. Available from SQL Server 2016.

PURPOSE OF JSON:
	1. EASY DATA TRANSFER ON INTERNET
	2. SECURED DATA STORAGE
*/


DROP TABLE IF EXISTS SheepCountingWords 
  CREATE TABLE SheepCountingWords
    (
    Number INT NOT NULL,
    Word VARCHAR(40) NOT NULL
    );
  GO


  
/*
json input data:
 [
  { "number": 11,  "word": "Yan-a-dik" }, 
  { "number": 12,  "word": "Tan-a-dik" }, 
  { "number": 13,  "word": "Tethera-dik"}, 
  { "number": 14,  "word": "Pethera-dik"}, 
  { "number": 15,  "word": "Bumfit"}, 
  { "number": 16,  "word": "Yan-a-bumtit"}, 
  { "number": 17,  "word": "Tan-a-bumfit"}, 
  { "number": 18,  "word": "Tethera-bumfit"}, 
  { "number": 19,  "word": "Pethera-bumfit"},
  { "number": 20,  "word": "Figgot"}
 ] 
  */

  
  SELECT  Number, Word
      FROM
      OpenJson(
				'[
				{"number": 11,  "word": "Yan-a-dik"}, 
				{"number": 12,  "word": "Tan-a-dik"}, 
				{"number": 13,  "word": "Tethera-dik"}, 
				{"number": 14,  "word": "Pethera-dik"}, 
				{"number": 15,  "word": "Bumfit"}, 
				{"number": 16,  "word": "Yan-a-bumtit"}, 
				{"number": 17,  "word": "Tan-a-bumfit"}, 
				{"number": 18,  "word": "Tethera-bumfit"}, 
				{"number": 19,  "word": "Pethera-bumfit"}, 
				{"number": 20,  "word": "Figgot"}
				] '
			) WITH (Number INT '$.number', Word VARCHAR(30) '$.word')




  
  insert into SheepCountingWords (Number, Word)
  SELECT  Number, Word
      FROM
      OpenJson(
				'[
				{"number": 11,  "word": "Yan-a-dik"}, 
				{"number": 12,  "word": "Tan-a-dik"}, 
				{"number": 13,  "word": "Tethera-dik"}, 
				{"number": 14,  "word": "Pethera-dik"}, 
				{"number": 15,  "word": "Bumfit"}, 
				{"number": 16,  "word": "Yan-a-bumtit"}, 
				{"number": 17,  "word": "Tan-a-bumfit"}, 
				{"number": 18,  "word": "Tethera-bumfit"}, 
				{"number": 19,  "word": "Pethera-bumfit"}, 
				{"number": 20,  "word": "Figgot"}
				] '
			) WITH (Number INT '$.number', Word VARCHAR(30) '$.word')


select * from SheepCountingWords

select * from SheepCountingWords FOR XML AUTO			-- HORIZONTAL, TAG NAME = TABLE NAME
select * from SheepCountingWords FOR XML PATH			-- VERTICAL, TAG NAME = "ROW"
select * from SheepCountingWords FOR XML RAW			-- HORIZONTAL, TAG NAME = "ROW"

-- JSON	:	 FOR EASY DATA TRANSFER OVER INTERNET AND B/W TWO CLOUD PLATFORMS
-- XML	:	 FOR EASY DATA INTEGRATION INTO WEB BASED APPLICATIONS AND MOBILE APPS



-- YOU WERE GIVE AN PDF or AN IMAGE FILE. YOU NEED STORE THIS FILE CONTENT INTO SQL SERVER?
CREATE TABLE tblStore
(
id int identity,
content varbinary(max)			-- THIS COLUMN CAN STORE UPTO 2 GB DATA PER VALUE. 
)

EXEC SP_SPACEUSED 'tblStore'

-- BLOB : BINARY LARGE OBJECT DATA
INSERT INTO tblStore(content) 
	SELECT bulkcolumn FROM OPENROWSET(BULK 'D:\SQL SERVER DATA TYPES.docx', SINGLE_BLOB) 
	AS SubQuery	-- THIS IS FOR CORRELATION = CORRELATED SUB QUERY.  SUCH SUB QUERIES WITH SPEICFIC ALIAS.

INSERT INTO tblStore(content) 
			SELECT bulkcolumn FROM OPENROWSET(BULK 'E:\MSBI-Training.pdf', SINGLE_BLOB) 
			AS SubQuery

EXEC SP_SPACEUSED 'tblStore'
SELECT * FROM tblStore					-- How to see the correct data [CAST(), CONVERT()]

select * from tblStore FOR JSON AUTO	-- TO CONVERT SQL TABLE TO JSON FORMAT






