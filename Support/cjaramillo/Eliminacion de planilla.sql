

SELECT * FROM fin.cxp_doc  LIMIT 10 WHERE documento ='0238344';
--DELETE FROM fin.cxp_doc WHERE documento ='0236395';

SELECT * FROM fin.cxp_items_doc WHERE documento ='0238344';
--DELETE FROM fin.cxp_items_doc WHERE documento ='0236395';


SELECT * FROM con.comprobante WHERE numdoc = '0238344' AND periodo = '201810';
--DELETE FROM con.comprobante WHERE numdoc = '0236395' AND periodo = '201810';

SELECT * FROM con.comprodet WHERE numdoc = '0238344' AND periodo = '201810';
--DELETE FROM con.comprodet WHERE numdoc = '0236395' AND periodo = '201810';


SELECT * FROM etes.ventas_eds ORDER BY periodo desc WHERE  id_manifiesto_carga IN ('12752','12753','12755');
--delete FROM etes.ventas_eds  WHERE periodo = '201810' AND id_manifiesto_carga = '12215';

CREATE TABLE tem.btg_2 AS 								--insert into etes.manifiesto_carga SELECT * FROM tem.btg_2
SELECT * FROM etes.manifiesto_carga WHERE planilla IN ('0238344','0238345','0238347');
--DELETE FROM etes.manifiesto_carga WHERE planilla IN ('0238344','0238345','0238347');

CREATE TABLE tem.btg_ AS 								--insert into etes.manifiesto_descuentos SELECT * FROM tem.btg_
SELECT * FROM etes.manifiesto_descuentos WHERE planilla IN ('0238344','0238345','0238347');
--DELETE FROM etes.manifiesto_descuentos WHERE planilla IN ('0238344','0238345','0238347');


SELECT * FROM fin.cxp_items_doc WHERE documento ILIKE 'EDS000037%';
SELECT * FROM fin.cxp_doc WHERE documento ='EDS0000375';

SELECT * FROM con.comprobante WHERE numdoc ilike 'EDS000037%';
SELECT * FROM con.comprodet WHERE numdoc = 'EDS0000375';

SELECT * FROM con.factura ORDER BY creation_date DESC LIMIT 100;
SELECT * FROM con.factura WHERE documento = 'PP0238344';





