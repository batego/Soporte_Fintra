CREATE TABLE tem.planilla_cxp_0236396 AS      SELECT * FROM tem.planilla_cxp_0236395
SELECT * FROM fin.cxp_doc WHERE documento ='0236396';
--DELETE FROM fin.cxp_doc WHERE documento ='0236396';

CREATE TABLE tem.planilla_cxpit_0236396 AS
SELECT * FROM fin.cxp_items_doc WHERE documento ='0236396';
--DELETE FROM fin.cxp_items_doc WHERE documento ='0236396';

CREATE TABLE tem.planilla_compr_0236396 AS 
SELECT * FROM con.comprobante WHERE numdoc = '0236396' AND periodo = '201810';
--DELETE FROM con.comprobante WHERE numdoc = '0236396' AND periodo = '201810';

CREATE TABLE tem.planilla_compdt_0236396 AS 
SELECT * FROM con.comprodet WHERE numdoc = '0236396' AND periodo = '201810';
--DELETE FROM con.comprodet WHERE numdoc = '0236396' AND periodo = '201810';

CREATE TABLE tem.ventas_eds_0236396 as
SELECT * FROM etes.ventas_eds  WHERE id_manifiesto_carga = '12347';
--delete FROM etes.ventas_eds  WHERE periodo = '201810' AND id_manifiesto_carga = '12215';

CREATE TABLE tem.planilla_mancarg_0236396 AS
SELECT * FROM etes.manifiesto_carga WHERE planilla = '0236396';
--DELETE FROM etes.manifiesto_carga WHERE planilla = '0236396';

CREATE TABLE tem.planilla_mandesc_0236396 AS
SELECT * FROM etes.manifiesto_descuentos WHERE planilla = '0236396';
--DELETE FROM etes.manifiesto_descuentos WHERE planilla = '0236396';



