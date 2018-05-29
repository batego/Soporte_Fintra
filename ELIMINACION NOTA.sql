--Notas a Eliminar :NC037460 - NC037735

CREATE TABLE BTERRAZA.NC037735_CAB_ING AS 
SELECT * FROM INGRESO where num_ingreso = 'NC037735';
--DELETE FROM INGRESO where num_ingreso = 'NC037735';


--CREATE TABLE BTERRAZA.NC037735_DET_ING AS 
SELECT * FROM con.ingreso_detalle where num_ingreso = 'NC037735'; 
--DELETE FROM con.ingreso_detalle where num_ingreso = 'NC037735'; 


--CREATE TABLE BTERRAZA.NC037735_CAB_COMP AS 
select * from comprobante where  numdoc = 'NC037735';
--DELETE FROM COMPROBANTE WHERE NUMDOC = 'NC037735'


--CREATE TABLE BTERRAZA.NC037735_DET_COMP AS 
select * from comprodet where  numdoc = 'NC037735';
--DELETE FROM comprodet WHERE NUMDOC = 'NC037735';



