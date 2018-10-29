MC16088

---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC16485');

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC16485');

SELECT * FROM detalle_poliza_negocio WHERE cod_neg = '134317';

134317

CREATE TABLE TEM.MC16088_CXP AS				
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC16485'); 

CREATE TABLE TEM.MC16485_CXP_IT AS			
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where planilla = 'MC16485'     documento in (select documento from fin.cxp_doc where documento_Relacionado in ('MC16485')) 

;
SELECT * FROM fin.cxp_items_doc WHERE planilla = 'MC16485' creation_user = 'JDELAHOZR' AND last_update::date = '2018-10-24'::date ORDER BY creation_date ASC ;
