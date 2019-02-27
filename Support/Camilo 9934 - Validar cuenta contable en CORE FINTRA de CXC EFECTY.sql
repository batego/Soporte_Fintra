SELECT * FROM con.factura WHERE documento IN ('R0037658');R0037435;
SELECT * FROM con.factura_detalle WHERE documento IN ('R0037658');


SELECT * FROM con.comprobante WHERE numdoc IN ('R0037658') 

SELECT creation_date,
* FROM CON.comproDET WHERE  numdoc ILIKE 'R%' AND periodo = '201902' AND cuenta = '13109601'; --13109601
