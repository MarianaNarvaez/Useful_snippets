-- Why did the job fail:
select * 
from SSISDB.internal.operation_messages 
where message_type=120 
and operation_id= 194449


-- Insert column names:
IF OBJECT_ID('tempdb..#ColumNames') IS NOT NULL
 DROP TABLE #ColumNames

	SELECT COLUMN_NAME,0 estado 
	INTO #ColumNames
	FROM (SELECT COLUMN_NAME, 0 estado 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Rep' AND  ( DATA_TYPE = 'varchar' OR DATA_TYPE = 'nvarchar')) as col


-- Which exists in sql with:
SELECT * 
FROM SYSOBJECTS S
INNER JOIN SYSCOMMENTS SC ON S.id=SC.id
WHERE SC.text LIKE '%tb_POS_PLANILLA_ENCABEZADO%'
AND S.xtype IN ('P','FN','V')
ORDER BY 2

--Who is running:
exec Sp_who
exec sp_who3
exec sp_whoisactive

--See table columns
exec Sp_columns [TblDPaquetes]

--See object explorer by folders
F7

--Some column, table or schema like:
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME  LIKE '%grupo%Ana%'

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME  LIKE '%grupo%Ana%'

SELECT * FROM INFORMATION_SCHEMA.SCHEMAS WHERE SHEMA_NAME  LIKE '%grupo%Ana%'


-- CTE example: 
;with cte as (
SELECT t1.PACKAGEOBJID
		,t1.STATEOBJID
		,t1.STATENAME
		,t1.ENVOBJID
		,t1.STARTEXECDTIME AS STARTEXECDTIME
		,(case when t1.STATENAME = 'Finalizado' then t1.STARTEXECDTIME else LEAD (t1.STARTEXECDTIME) OVER (ORDER BY t1.STARTEXECDTIME)  end) AS ENDEXECDTIME
		,t1.USROBJID 
		--,ROW_NUMBER() OVER(PARTITION BY t1.PACKAGEOBJID ORDER BY T1.STARTEXECDTIME ) AS RWNUM2
		FROM (
SELECT 	 X.PACKAGEOBJID
		,X.STATEOBJID
		,X.STATENAME
		,X.ENVOBJID
		,X.EXECDTIME AS STARTEXECDTIME
		,X.USROBJID
		,ROW_NUMBER() OVER(PARTITION BY  X.PACKAGEOBJID, X.STATENAME
		ORDER BY X.EXECDTIME ASC) AS RWNUM
		,X.ACTION	
FROM  X.X X WHERE PACKAGEOBJID = 8557 
) AS T1
WHERE T1.RWNUM = 1)

select * from cte

-- COALESCE example: 
COALESCE((CONVERT(VARCHAR(8),dateadd(second,creation_date,'19691231 19:00:00'),112))