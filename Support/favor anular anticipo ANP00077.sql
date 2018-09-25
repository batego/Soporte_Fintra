-- ANular operativo el anticipo
-- anular la factura
-- Eliminar contablemente la factura


SELECT * FROM opav.sl_anticipos where cod_anticipo = 'ANP00077';
SELECT * FROM con.factura WHERE documento = 'FPA00077';
SELECT * FROM con.factura_detalle WHERE documento = 'FPA00077';

CREATE TABLE tem.comp_FPA00077 AS 
SELECT * FROM con.comprobante WHERE numdoc = 'FPA00077';
--DELETE FROM con.comprobante WHERE numdoc = 'FPA00077';

CREATE TABLE tem.compdet_FPA00077 AS
SELECT * FROM con.comprodet WHERE numdoc = 'FPA00077';
--DELETE FROM con.comprodet WHERE numdoc = 'FPA00077';
