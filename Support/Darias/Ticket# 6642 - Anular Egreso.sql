-- 3- Egreso
CREATE TABLE tem.EG63192_egr_comp AS 				
select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select document_no from  egresodet where document_no = 'EG63192')

CREATE TABLE tem.EG63192_egr_comprob AS 			
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select document_no from egreso where document_no = 'EG63192')

CREATE TABLE tem.EG63192_egrdt AS 			
select * from egresodet
--delete from egresodet
where document_no in ('EG63192')		

CREATE TABLE tem.EG63192_egr_egre AS  		
select * from egreso
--delete from egreso
where document_no in ('EG63192')


--Eliminar cxp
CREATE TABLE tem.T08530_cxp as
SELECT * FROM fin.cxp_doc WHERE documento = 'T08530';
--delete FROM fin.cxp_doc WHERE documento = 'T08530';

CREATE TABLE tem.T08530_cxpdet as
SELECT * FROM fin.cxp_items_doc WHERE documento = 'T08530';
--delete FROM fin.cxp_items_doc WHERE documento = 'T08530';

CREATE TABLE tem.T08530_comp as
SELECT * FROM con.comprobante where numdoc = 'T08530';
--delete FROM con.comprobante where numdoc = 'T08530';

CREATE TABLE tem.T08530_compdet as
SELECT * FROM con.comprodet where numdoc = 'T08530';
--delete FROM con.comprodet where numdoc = 'T08530';


--Eliminar registro
CREATE TABLE tem.T08530_mov_capt as
select * from movimientos_captaciones where nit  = '7421827'; --no_transaccion = 'T08530';
--delete from movimientos_captaciones where no_transaccion = 'T08530'; 

SELECT * FROM tem.T08530_mov_capt;


