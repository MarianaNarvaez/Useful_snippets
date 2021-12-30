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

--Get the firs day of the week, millennium, century..
DATE_TRUNC

--Some column, table or schema like:
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME  LIKE '%grupo%Ana%'

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME  LIKE '%grupo%Ana%'

SELECT * FROM INFORMATION_SCHEMA.SCHEMAS WHERE SHEMA_NAME  LIKE '%grupo%Ana%'

