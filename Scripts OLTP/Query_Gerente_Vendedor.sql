USE COMERCIO_OLTP
GO

SELECT V.IDVENDEDOR,
		V.NOME AS GERENTE,
		G.NOME AS VENDEDOR,
		G.IDVENDEDOR
FROM VENDEDOR V 
INNER JOIN VENDEDOR G
ON V.IDVENDEDOR = G.ID_GERENTE
GO