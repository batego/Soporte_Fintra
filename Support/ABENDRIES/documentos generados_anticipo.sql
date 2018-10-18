CREATE TABLE tem.planilla_cxp_228704 AS 
SELECT * FROM fin.cxp_doc WHERE documento ='228704';
--DELETE FROM fin.cxp_doc WHERE documento ='228704';

CREATE TABLE tem.planilla_cxpit_228704 AS 
SELECT * FROM fin.cxp_items_doc WHERE documento ='228704';
--DELETE FROM fin.cxp_items_doc WHERE documento ='228704';

CREATE TABLE tem.planilla_compr_228704 AS 
SELECT * FROM con.comprobante WHERE numdoc = '228704' AND periodo = '201810';
--DELETE FROM con.comprobante WHERE numdoc = '228704' AND periodo = '201810';

CREATE TABLE tem.planilla_compdt_228704 AS 
SELECT * FROM con.comprodet WHERE numdoc = '228704' AND periodo = '201810';
--DELETE FROM con.comprodet WHERE numdoc = '228704' AND periodo = '201810';

CREATE TABLE tem.planilla_mancarg_228704 AS 
SELECT * FROM etes.manifiesto_carga WHERE planilla = '228704';
--DELETE FROM etes.manifiesto_carga WHERE planilla = '228704';

CREATE TABLE tem.planilla_mandesc_228704 AS 
SELECT * FROM etes.manifiesto_descuentos WHERE planilla = '228704';
--DELETE FROM etes.manifiesto_descuentos WHERE planilla = '228704';
