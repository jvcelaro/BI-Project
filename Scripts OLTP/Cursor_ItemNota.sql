USE COMERCIO_OLTP
GO




CREATE PROCEDURE CAD_NOTAS AS

DECLARE

	C_NOTAS CURSOR FOR
	SELECT IDNOTA FROM NOTA_FISCAL
	WHERE IDNOTA NOT IN(SELECT ID_NOTA_FISCAL FROM ITEM_NOTA)

DECLARE

	@IDNOTA INT, @ID_PRODUTO INT, @TOTAL DECIMAL(10,2)

OPEN C_NOTAS

	FETCH NEXT FROM C_NOTAS
	INTO @IDNOTA

WHILE @@FETCH_STATUS = 0
BEGIN

	SET @ID_PRODUTO =
	(SELECT TOP 1 IDPRODUTO FROM PRODUTO ORDER BY NEWID())

	SET @TOTAL =
	(SELECT VALOR FROM PRODUTO WHERE IDPRODUTO = @ID_PRODUTO)

	INSERT INTO ITEM_NOTA(ID_PRODUTO, ID_NOTA_FISCAL, QUANTIDADE, TOTAL)
	VALUES(@ID_PRODUTO, @IDNOTA, 1, @TOTAL)

FETCH NEXT FROM C_NOTAS
INTO @IDNOTA

END

CLOSE C_NOTAS
DEALLOCATE C_NOTAS 
GO