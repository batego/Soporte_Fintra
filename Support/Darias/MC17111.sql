SELECT * FROM con.factura 
--delete from con.factura 
WHERE negasoc ='MC17111';


SELECT * FROM con.factura_detalle 
--delete from con.factura_detalle
WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc ='MC17111');

-- desmarar el egreso en el campo ref
SELECT tipo_referencia_1,* FROM fin.cxp_doc WHERE documento_relacionado IN('MC17111');
 
 SELECT * FROM egreso WHERE document_no = 'EG63969';    
 SELECT * FROM egresodet WHERE document_no = 'EG63969';
 
 SELECT * FROM con.comprobante WHERE numdoc = 'EG63969';
 SELECT * FROM con.comprodet WHERE numdoc = 'EG63969'; 			--
 
 
 SELECT * FROM ing_fenalco 
 --DELETE FROM ing_fenalco
 WHERE codneg = 'MC17111';
 
 
 Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC17111');
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC17111');

 