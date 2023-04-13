USE COMERCIO_OLTP
GO

CREATE VIEW V_NOTA_FISCAL AS
SELECT ID_NOTA_FISCAL, SUM(TOTAL) AS SOMA
FROM ITEM_NOTA
GROUP BY ID_NOTA_FISCAL
GO

CREATE VIEW V_CARGA_NF AS
SELECT N.IDNOTA, N.TOTAL AS TOTALNOTA, I.SOMA
FROM NOTA_FISCAL N
INNER JOIN V_NOTA_FISCAL I
ON IDNOTA = ID_NOTA_FISCAL
GO

SELECT * FROM V_CARGA_NF
GO

UPDATE V_CARGA_NF
SET TOTALNOTA = SOMA
GO

SELECT * FROM NOTA_FISCAL
GO