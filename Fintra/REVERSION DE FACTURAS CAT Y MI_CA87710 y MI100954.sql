-- empresa asociada ala pagaduria - zona - hferrer


-- REVERSION DE FACTURAS CAT Y MI
CREATE TABLE TEM.FACT_CA87710_MI100954 AS 
select * from con.factura where documento in ('CA87710','MI100954') 
DELETE from con.factura where documento in ('CA87710','MI100954')

CREATE TABLE TEM.FACTDET_CA87710_MI100954 AS 
select * from con.factura_detalle where documento in ('CA87710','MI100954') 
DELETE from con.factura_detalle where documento in ('CA87710','MI100954') 




SELECT * FROM CON.COMPROBANTE WHERE NUMDOC in ('MC08513') 


SELECT * FROM documentos_neg_aceptado where cod_neg = 'MC08513' order by fecha desc
UPDATE documentos_neg_aceptado SET INTERES_CAUSADO = 0, FCH_INTERES_CAUSADO = '', DOCUMENTO_CAT = '' where cod_neg = 'MC08513' AND ITEM = '15' order by fecha desc
