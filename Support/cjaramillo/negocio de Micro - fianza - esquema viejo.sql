--solicitud informacion
--Buenas tardes,
--Boris solicito el favor me regales un negocio de Micro con saldo a la fecha 
--y vencido del viejo esquema que le hayan generado fianza



SELECT documento_relacionado,* 
FROM fin.cxp_doc c
INNER JOIN TEM.negocios_facturacion_old nfo ON (nfo.cod_neg = c.documento_relacionado)
INNER JOIN con.factura f ON (f.negasoc = nfo.cod_neg)
WHERE c.documento ILIKE 'FZ%'
AND f.valor_saldo != 0;

SELECT * FROM CON.FACTURA WHERE negasoc = 'MC07937';
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC07937';
SELECT * FROM TEM.negocios_facturacion_old WHERE cod_neg = 'MC07937';
	  	