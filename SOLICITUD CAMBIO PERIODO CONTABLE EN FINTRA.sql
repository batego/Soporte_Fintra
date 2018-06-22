﻿-- SOLICITUD CAMBIO PERIODO CONTABLE EN FINTRA
-- Buenas tardes,Boris solicito el favor de cambiar periodo contable se los siguientes documentos a Mayo 2018, 
-- por favor tener en cuenta que son de TSP logiticay una planilla puede tener varios anticipos por eso te relaciono valor y 
-- orden de servicio: Adjunte el archivo.
-- 
-- Cualquir duda por favor preguntale a Daniela TSP es delicado

select * from fin.cxp_doc where cheque = 'TR204819_23' 		---set creation_date = '2018-05-05 07:43:31', periodo = '201805'

--Backup cxp Carolina
select * from tem.cxp_2018_caro



update fin.cxp_doc set fecha_contabilizacion = '2018-05-05 07:43:31', periodo = '201805'  where 
cheque in('TR204819_15_1','TR204819_15_2','TR204819_16_1','TR204819_18_1','TR204819_19_1','TR204819_19_2')

create table tem.per_cont_2018_caro as							--select * from tem.per_cont_2018_caro
update egreso set fecha_contabilizacion = '2018-05-05 07:43:31', periodo = '201805' 
where document_no in('TR204819_15_1','TR204819_15_2','TR204819_16_1','TR204819_18_1','TR204819_19_1','TR204819_19_2')	 order by document_no

--Nota en el detalle del egreso para esos documentos tenia creation_date = '2018-06-05 07:43:31'	
update egresodet set creation_date = '2018-05-05 07:43:31' 
where document_no in('TR204819_15_1','TR204819_15_2','TR204819_16_1','TR204819_18_1','TR204819_19_1','TR204819_19_2')	


create table tem.comprobante_201805_caro as
update con.comprobante set creation_date = '2018-05-05 07:43:31', periodo = '201805' 
where numdoc in ('TR204819_15_1','TR204819_15_2','TR204819_16_1','TR204819_18_1','TR204819_19_1','TR204819_19_2')

create table tem.comprodet_201805_caro as		--select * from tem.comprodet_201805_caro
update con.comprodet set creation_date = '2018-05-05 07:43:31', periodo = '201805' 
where numdoc in ('TR204819_15_1','TR204819_15_2','TR204819_16_1','TR204819_18_1','TR204819_19_1','TR204819_19_2')
