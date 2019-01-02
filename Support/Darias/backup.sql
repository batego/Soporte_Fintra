SELECT * FROM fin.cxp_doc 
WHERE documento_relacionado IN ('MC17491','MC17545','MC17570','MC17574','MC17580','MC17568','MC17519') AND descripcion ILIKE '%CXP A EFECTY EFECTY%';

SELECT * FROM fin.cxp_items_doc 
WHERE documento IN ('CXP000006251',
'CXP000006250',
'CXP000006249',
'CXP000006248',
'CXP000006247',
'CXP000006246',
'CXP000006245');


SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC17519';


--borrar cartera y diferidos
MC17570
MC17574
MC17580
MC17568
MC17519


DELETE FROM ing_fenalco WHERE codneg IN ('MC17570',
'MC17574',
'MC17580',
'MC17568',
'MC17519');

CREATE TABLE tem.darias_facdet AS;
SELECT * FROM con.factura WHERE negasoc IN ('MC17570',
'MC17574',
'MC17580',
'MC17568',
'MC17519');

CREATE TABLE tem.darias_fac AS;
SELECT * FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc IN ('MC17570',
'MC17574',
'MC17580',
'MC17568',
'MC17519'));

CREATE TABLE tem.darias_com AS;
SELECT * FROM con.comprobante WHERE numdoc IN ('MC17570',
'MC17574',
'MC17580',
'MC17568',
'MC17519');

CREATE TABLE tem.darias_det AS;
SELECT * FROM con.comprodet WHERE numdoc IN ('MC17570',
'MC17574',
'MC17580',
'MC17568',
'MC17519');