USE COMERCIO_OLTP
GO

CREATE VIEW V_RELATORIO AS
SELECT C.NOME, C.SOBRENOME , C.SEXO, N.DATA, N.IDNOTA, P.PRODUTO, N.TOTAL
FROM CLIENTE C
INNER JOIN NOTA_FISCAL N
ON C.IDCLIENTE = N.ID_CLIENTE
INNER JOIN ITEM_NOTA I
ON N.IDNOTA = I.ID_NOTA_FISCAL
INNER JOIN PRODUTO P
ON P.IDPRODUTO = I.ID_PRODUTO
GO

SELECT * FROM V_RELATORIO
GO