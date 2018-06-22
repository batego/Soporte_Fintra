select ESTADO_NEG, ACTIVIDAD, * from negocios where cod_neg = 'MC14640'	s		--eSTADO DEL NEGOCION ANTES DEL UPDATE 'V';'ANA'
select * from con.factura where negasoc = 'MC14640' 
select * from Fin.cxp_doc where documento_relacionado = 'MC14640'

select * from Negocios_trazabilidad where cod_neg = 'MC14640'

select * from solicitud_aval where

Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios --where actividad = 'DEC' and estado_neg = 'V'
--update negocios set update_user = 'BTERRAZA',actividad = 'DEC', estado_neg = 'V'
where cod_neg in  ('MC14640')