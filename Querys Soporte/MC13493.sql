---1. CAMBIAR ESTADO DEL NEGOCIO
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'DVALENCIA', estado_neg = 'D'
where cod_neg in  ('MC13493')

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D' 
where cod_neg in ('MC13493')


---.2. INSERTAR TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
		    reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
		VALUES ('', 'FINV',118561 , 'FOR', 'DVALENCIA', NOW(),  'MC13493', 'Negocio desistido por el cliente, segun lo informado por Miguel Lengua (ticket 2848)');


---3. ELIMINAR DOCUMENTOS	

--OPERATIVO
select * from fin.cxp_doc 
where documento_Relacionado in ('MC13493')

select cheque,* from fin.cxp_doc
--delete from fin.cxp_doc 
where documento in ('FZT05093','MP11673')

select * from fin.cxp_items_doc 
--delete from fin.cxp_items_doc 
where documento in ('FZT05093','MP11673')


select * from fin.cxp_doc 
--delete from fin.cxp_doc 
where documento_Relacionado in ('FZT05093','MP11673')

select * from egreso
--delete from egreso
where document_no in ('EG58613')

select * from egresodet
--delete from egresodet
where document_no in ('EG58613')



SELECT * FROM con.factura
--delete from con.factura
where negasoc in ('MC13493')

SELECT * FROM con.factura_detalle
--delete from con.factura_detalle
where numero_remesa = 'MC13493' -- in (select documento from con.factura where negasoc = 'MC12776')

select * from con.factura_Detalle where nit = '32696289'

--CONTABLE

select * from con.comprobante 
--delete from con.comprobante 
where numdoc in ('FZT05093','MP11673','MC13493')

select * from con.comprodet 
--delete from con.comprodet
where numdoc in  ('FZT05093','MP11673','MC13493','EG58613')

select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select documento from con.factura where negasoc = 'MC13493')

select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select documento from con.factura where negasoc = 'MC13493')

---DIFERIDOS
select * from ing_fenalco 
--delete from ing_fenalco 
where codneg in ('MC13493')




