USE COMERCIO_OLTP
GO

SELECT C.NOME, C.SOBRENOME, C.SEXO, N.DATA, N.IDNOTA, PRODUTO, N.TOTAL
FROM CLIENTE C
INNER JOIN NOTA_FISCAL N
ON C.IDCLIENTE = N.ID_CLIENTE
INNER JOIN ITEM_NOTA i
on N.IDNOTA = I.ID_NOTA_FISCAL
INNER JOIN PRODUTO P
ON P.IDPRODUTO = I.ID_PRODUTO
ORDER BY 5
GO
