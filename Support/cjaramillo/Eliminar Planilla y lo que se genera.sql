--Planilla
CREATE TABLE tem.mani_carga_10179436 AS 
select * from etes.manifiesto_carga 
-- delete from etes.manifiesto_carga
where planilla='10179436';

--DEscuentos
CREATE TABLE tem.mani_desc_10179436 AS 
select * from etes.manifiesto_descuentos 
-- delete from etes.manifiesto_descuentos 
where planilla='10179436';

--Venta
CREATE TABLE tem.ventas_10179436 AS 
select * from etes.ventas_eds 
-- delete from etes.ventas_eds 
where id_manifiesto_carga='12614';



--Egreso: PT01450_1
--Documento Cxp: 10179436

---------------
--Cxp operativo
---------------
CREATE TABLE tem.cxp_doc_10179436 AS 
select * from fin.cxp_doc 
-- delete from fin.cxp_doc
where documento ='10179436';

CREATE TABLE tem.cxp_item_10179436 AS 
SELECT * FROM fin.cxp_items_doc 
-- delete from fin.cxp_items_doc
where documento ='10179436';

--Cxp contable
CREATE TABLE tem.comp_10179436 AS 
select * from con.comprobante 
-- delete from con.comprobante
where numdoc ='10179436';

CREATE TABLE tem.compdet_10179436 AS 
select * from con.comprodet 
-- delete from con.comprodet 
where numdoc ='10179436';

-------------------
--Factura operativa
-------------------
CREATE TABLE tem.factura_PP02216646 as
SELECT * FROM con.factura 
-- delete FROM con.factura 
WHERE referencia_2 = '10179436';

CREATE TABLE tem.factdet_PP02216646 as
SELECT * FROM con.factura_detalle 
--delete FROM con.factura_detalle 
WHERE  documento= 'PP02216646';

--Factura contable
CREATE TABLE tem.compro_PP02216646 as
SELECT * FROM con.comprobante 
--delete FROM con.comprobante 
WHERE numdoc = 'PP02216646';

CREATE TABLE tem.comprodet_PP02216646 as
SELECT * FROM con.comprodet 
--delete FROM con.comprodet 
WHERE numdoc = 'PP02216646';

-------------------
-- egreso operativo
-------------------
CREATE TABLE tem.egreso_PT01450_1 as
SELECT * FROM egreso 
--DELETE FROM egreso 
WHERE document_no = 'PT01450_1';

CREATE TABLE tem.egresodet_PT01450_1 as
SELECT * FROM egresodet 
-- delete FROM egresodet 
WHERE document_no = 'PT01450_1';

-- egreso contable
CREATE TABLE tem.compro_PT01450_1 as
SELECT * FROM con.comprobante 
-- delete FROM con.comprobante 
WHERE numdoc = 'PT01450_1';

CREATE TABLE tem.comprodet_PT01450_1 as
SELECT * FROM con.comprodet 
--delete FROM con.comprodet 
WHERE numdoc = 'PT01450_1';