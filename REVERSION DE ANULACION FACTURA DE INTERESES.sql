REVERSION DE FACTURAS CAT Y MI
CREATE TABLE TEM.FACT_CA87710_MI100954 AS 
select * from con.factura where documento in ('CA87713') order by num_doc_fen
-- DELETE from con.factura where documento in ('MI100817')

CREATE TABLE TEM.FACTDET_CA87710_MI100954 AS 
select * from con.factura_detalle where documento in ('MI100817') 
-- DELETE from con.factura_detalle where documento in ('CA87710','MI100954') 




SELECT * FROM CON.COMPROBANTE WHERE NUMDOC in ('MC08513') 


SELECT * FROM documentos_neg_aceptado  where cod_neg = 'MC09053' order by fecha desc
-- UPDATE documentos_neg_aceptado SET causar = 'S' where cod_neg = 'MC09053' AND ITEM = '17' order by fecha desc		--'CA87713'