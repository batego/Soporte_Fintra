CREATE TABLE TEM.FACDET_MC16404 AS
SELECT * FROM CON.factura_detalle 
WHERE DOCUMENTO IN (SELECT DOCUMENTO FROM CON.FACTURA WHERE negasoc = 'MC16404' AND creation_date::DATE = '2018-10-09 17:08:52');

--DELETE FROM CON.factura_detalle 
WHERE DOCUMENTO IN (SELECT DOCUMENTO FROM CON.FACTURA WHERE negasoc = 'MC16404' AND creation_date::DATE = '2018-10-09 17:08:52');

CREATE TABLE TEM.FAC_MC16404 AS
SELECT * FROM CON.FACTURA WHERE negasoc = 'MC16404' AND creation_date::DATE = '2018-10-09 17:08:52';
--DELETE FROM CON.FACTURA WHERE negasoc = 'MC16404' AND creation_date::DATE = '2018-10-09 17:08:52';

SELECT DISTINCT DOCUMENTO FROM TEM.FACDET_MC16404;

CREATE TABLE CONMP_MC16404 AS
SELECT * FROM CON.comprobante WHERE numdoc IN (SELECT DISTINCT DOCUMENTO FROM TEM.FACDET_MC16404);
--DELETE FROM CON.comprobante WHERE numdoc IN (SELECT DISTINCT DOCUMENTO FROM TEM.FACDET_MC16404);

CREATE TABLE CONMPDT_MC16404 AS
SELECT * FROM CON.comproDET WHERE numdoc IN (SELECT DISTINCT DOCUMENTO FROM TEM.FACDET_MC16404);
--DELETE FROM CON.comproDET WHERE numdoc IN (SELECT DISTINCT DOCUMENTO FROM TEM.FACDET_MC16404);



SELECT * FROM con.comprobante WHERE numdoc ilike 'MC1640%' LIMIT 10;
--delete FROM con.comprobante WHERE numdoc = 'MC16404';

SELECT * FROM con.comprodet WHERE numdoc = 'MC16404';
--DELETE FROM con.comprodet WHERE numdoc = 'MC16404';