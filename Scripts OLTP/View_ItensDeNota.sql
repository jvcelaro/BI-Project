USE COMERCIO_OLTP
GO

CREATE VIEW V_ITEM_NOTA AS
SELECT ID_NOTA_FISCAL AS 'NOTA FISCAL',
	PRODUTO,
	VALOR,
	QUANTIDADE,
	TOTAL AS 'TOTAL DO ITEM'
FROM PRODUTO
INNER JOIN ITEM_NOTA
ON IDPRODUTO = ID_PRODUTO
GO

SELECT * FROM V_ITEM_NOTA
ORDER BY 1
GO