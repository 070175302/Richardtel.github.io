--SQL WHERE CLAUSE

SELECT *
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'cut'

--IN & not in operators

--and / or operators

--SQL WILDCARD CHARACTERS
--IN EXCEL - ?,*
--in sql - _, %
\

SELECT *
FROM [dbo].['Workplace Safety Data$']
WHERE Department LIKE '%F%'

SELECT *
FROM [dbo].['Workplace Safety Data$']
WHERE [Injury Location] LIKE 'E%'

SELECT *
FROM [dbo].['Workplace Safety Data$']
WHERE [Injury Location] LIKE '%E__'

SELECT *
FROM [dbo].['Workplace Safety Data$']
WHERE Plant LIKE '%GE%'

--TOP 5

SELECT top(5) *
FROM [dbo].['Workplace Safety Data$']

SELECT top 10 percent *
FROM [dbo].['Workplace Safety Data$']

--SQL ORDER BY CLOSE

SELECT Top *
FROM [dbo].['Workplace Safety Data$']
ORDER BY [Incident Cost] desc

SELECT Top (5)*
FROM [dbo].['Workplace Safety Data$']
ORDER BY [Incident Cost] desc

--aggregate functions SUM, COUNT, MAX, MIN, AVERAGE

SELECT SUM([Incident Cost])
FROM [dbo].['Workplace Safety Data$']

SELECT COUNT([Incident Cost])
FROM [dbo].['Workplace Safety Data$']

SELECT MAX([Incident Cost])
FROM [dbo].['Workplace Safety Data$']

SELECT MIN([Incident Cost])
FROM [dbo].['Workplace Safety Data$']

SELECT MAX([Incident Cost]) AS [Maximum Incident Cost]
FROM [dbo].['Workplace Safety Data$']



CREATE TABLE California_incident AS
									(SELECT *
									FROM [dbo].['Workplace Safety Data$']
									WHERE Plant = 'California'
									)

SELECT * 
INTO California_incident 
FROM [dbo].['Workplace Safety Data$']
WHERE Plant = 'California'

SELECT *
FROM [dbo].[California_incident]

--aggregate function - MAX, MIN, COUNT, SUM,  AVERAGE

SELECT SUM([Incident Cost])
FROM [dbo].[California_incident]

SELECT Plant
FROM [dbo].['Workplace Safety Data$']

SELECT DISTINCT (PLANT)
FROM [dbo].['Workplace Safety Data$']

SELECT PLANT, Gender,
		SUM ([Incident Cost]) AS Total_incident_Cost
FROM [dbo].['Workplace Safety Data$']
GROUP BY Plant, Gender
ORDER BY SUM ([Incident Cost]) 

SELECT  Gender,
		SUM ([Incident Cost]) AS Total_incident_Cost
FROM [dbo].['Workplace Safety Data$']
GROUP BY Gender
ORDER BY SUM ([Incident Cost]) 


CREATE VIEW California2_incident AS
									(SELECT *
									FROM [dbo].['Workplace Safety Data$']
									WHERE Plant = 'California'
									)

SELECT *
FROM [dbo].[California2_incident]

ALTER VIEW [dbo].[California2_incident] AS
(SELECT *
FROM [dbo].['Workplace Safety Data$']
WHERE Plant in ('California','Texas')
)


ALTER VIEW [dbo].[California2_incident] AS
(SELECT *
FROM [dbo].['Workplace Safety Data$']
WHERE Plant in ('California')
)

UPDATE [dbo].['Workplace Safety Data$']
SET Plant = 'California'
WHERE [Days Lost] = '0.5'

SELECT *
FROM [dbo].['Workplace Safety Data$']
WHERE [Days Lost] = '0.5'

---SQL WINDOWS FUNCTIONS, SQL OVER CLAUSE PERTITION BY CLAUSE

SELECT * 
FROM [dbo].['Workplace Safety Data$']

SELECT * 
      ,SUM ([Incident Cost]) OVER ()
FROM [dbo].['Workplace Safety Data$']

SELECT * 
      ,MAX ([Incident Cost]) OVER ()
FROM [dbo].['Workplace Safety Data$']

SELECT * 
      ,SUM ([Incident Cost]) OVER (PARTITION By Plant)
FROM [dbo].['Workplace Safety Data$']

--row number function

SELECT *
,ROW_NUMBER() OVER(PARTITION BY ID ORDER BY id)
FROM [dbo].[Price_list]

SELECT *
FROM [dbo].[Price_list]
WHERE ID = 'ID07354'
