SELECT tipo_documento, documento, proveedor, descripcion, documento_relacionado, vlr_neto, fecha_documento, periodo
FROM fin.cxp_doc
WHERE documento_relacionado = ?
UNION ALL SELECT tipo_documento, documento, nit, descripcion, negasoc, valor_factura, fecha_factura, periodo
FROM con.factura fac
WHERE negasoc = ?
UNION ALL SELECT e.tipo_documento, document_no, nit, payment_name, cxp.documento, vlr, fecha_cheque, e.periodo
FROM egreso e
INNER JOIN fin.cxp_doc cxp ON
cxp.cheque = e.document_no
WHERE cxp.documento_relacionado = ?
AND cxp.cheque != ''
UNION ALL SELECT ing.tipodoc, ing.cod, ing.nit, 'Diferido ' || ing.cod AS descripcion, ing.codneg, ing.valor, ing.fecha_doc, ing.periodo
FROM ing_fenalco ing
WHERE codneg = ?
ORDER BY tipo_documento, documento;


SELECT * FROM consultas ORDER BY fechacreacion DESC;

select * from  fn_consultar_documentos_negocios(?) as 
(tipo_documento varchar,
documento varchar, 
proveedor varchar, 
descripcion varchar, 
documento_relacionado varchar,
vlr_neto numeric, 
fecha_documento date, 
periodo varchar);

