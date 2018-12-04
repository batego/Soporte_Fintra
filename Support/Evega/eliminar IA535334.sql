CREATE TABLE tem.ing_IA535334 AS ;
SELECT * FROM con.ingreso 
--delete from con.ingreso 
WHERE num_ingreso = 'IA535334';

CREATE TABLE tem.ingdt_IA535334 AS;
SELECT * FROM con.ingreso_detalle 
--delete FROM con.ingreso_detalle 
WHERE num_ingreso = 'IA535334';

CREATE TABLE tem.comprobante_IA535334 AS;
SELECT * FROM con.comprobante 
--delete from con.comprobante
WHERE numdoc = 'IA535334';

CREATE TABLE tem.comprodet_IA535334 AS;
SELECT * FROM con.comprodet 
--delete FROM con.comprodet 
WHERE numdoc = 'IA535334';



SELECT * FROM con.factura WHERE documento = 'PM14175_1';
SELECT * FROM con.factura_detalle WHERE documento = 'PM14175_1';

SELECT * FROM con.comprobante WHERE numdoc = 'PM14175_1';
SELECT * FROM con.comprodet WHERE numdoc = 'PM14175_1';