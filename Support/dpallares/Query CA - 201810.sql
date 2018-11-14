select * from con.factura_detalle order by creation_date desc limit 100;


SELECT * from fin.cxp_items_doc WHERE tipo_documento = 'CAT' LIMIT 100

SELECT  f.cod, cd.cuenta,cd.grupo_transaccion, cd.valor_credito, cd.valor_debito, f.fecha_doc,cd.detalle, f.valor AS valor_CA 
FROM ing_fenalco f
INNER JOIN con.comprodet cd ON (f.cod = cd.numdoc)
WHERE f.periodo = '201810' 
AND   f.tipodoc = 'CA';
AND   f.cod = 'CA500068813';


SELECT count(*) FROM ing_fenalco WHERE tipodoc ='CA' AND periodo = '201810';

select * from con.comprodet WHERE numdoc = 'CA500034412';