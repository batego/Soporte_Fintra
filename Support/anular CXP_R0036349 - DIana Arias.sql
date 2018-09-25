


--------------------- 
--ANular CXC fintra
---------------------

SELECT * FROM con.factura WHERE documento = 'R0036349';
SELECT * FROM con.factura_detalle WHERE documento = 'R0036349';

--Se Se borra contablemente la R0036349
CREATE TABLE tem.R0036349_cab_comp AS	
SELECT * FROM con.comprobante WHERE numdoc = 'R0036349';
--DELETE FROM con.comprobante WHERE numdoc = 'R0036349';

CREATE TABLE tem.R0036349_det_comp AS
SELECT * FROM con.comprodet WHERE numdoc = 'R0036349';
--DELETE FROM con.comprodet WHERE numdoc = 'R0036349';

/*
ANULACION DE INGRESO Y CXP SELECTRIK CORE
SOLICITO ANULAR EL SIGUIENTE INGRESO EN SOELECTRIK CORE 
IC210984 $10.000.000 31/07/18

SOLICITO ANULAR LA SIGUIENTE CXP EN SELECTRIK CORE 
CXP_R0036349 $10.000.000 31/07/18
*/

--Anular ingreso Operativamnete.
select * from con.ingreso where num_ingreso = 'IC210984';
-- update con.ingreso set reg_status = 'A' where num_ingreso = 'IC210984'
select * from con.ingreso_detalle where num_ingreso = 'IC210984'; 
-- update con.ingreso_detalle set reg_status = 'A' where num_ingreso = 'IC210984'

--ANular Ingreso contablemente
select * from con.comprobante  where numdoc = 'IC210984';
-- update con.comprobante set reg_status = 'A' where numdoc = 'IC210984'
select * from con.comprodet where numdoc = 'IC210984'; 
-- update con.comprodet set reg_status = 'A' where numdoc = 'IC210984' 


------------------------ 
--ANular CXC Selectrik
------------------------

--Se borra contablemente la CXP_R0036349
-- Tabla de backup
CREATE TABLE tem.CXP_R0036349_cab_comp AS							--SELECT * FROM tem.CXP_R0036349_cab_comp
SELECT * FROM con.comprobante WHERE numdoc = 'CXP_R0036349';
--delete FROM con.comprobante WHERE numdoc = 'CXP_R0036349';

CREATE TABLE tem.CXP_R0036349_det_comp AS							--select * from tem.CXP_R0036349_det_comp
SELECT * FROM con.comprodet WHERE numdoc = 'CXP_R0036349';
--DELETE FROM con.comprodet WHERE numdoc = 'CXP_R0036349';

--Se Anula Operativamente la CXP_R0036349
-- Tabla de backup
CREATE TABLE tem.CXP_R0036349_cab AS							--SELECT * FROM tem.CXP_R0036349_cab
SELECT * FROM fin.cxp_doc WHERE documento = 'CXP_R0036349';

CREATE TABLE tem.CXP_R0036349_detalle AS						--select * from tem.CXP_R0036349_detalle
SELECT * FROM fin.cxp_items_doc WHERE documento = 'CXP_R0036349';
 