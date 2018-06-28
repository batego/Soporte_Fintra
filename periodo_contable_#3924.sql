-- SOLICITUD CAMBIO PERIODO CONTABLE FINTRA
-- Buenas tardes,
-- Boris por favor cambiar periodo contable de los siguientes documentos:
-- 
-- IA532176 A Enero 2018
-- IA532177 A Marzo 2018
-- IA532178 A Abril 2018


select fecha_contabilizacion, periodo, * from con.ingreso where num_ingreso = 'IA532176'
select * from con.ingreso_detalle  where num_ingreso = 'IA532176'



-- create table tem.per_cont_2018_caro as							--select * from tem.per_cont_2018_caro
select fecha_contabilizacion, periodo,* from con.ingreso 
-- update con.ingreso set fecha_contabilizacion = '2018-04-22 10:43:32', periodo = '201803' 
where num_ingreso in('IA532178')	 

--Nota en el detalle del egreso para esos documentos tenia creation_date = '2018-06-05 07:43:31'
select fecha_contabilizacion, periodo, * from con.ingreso_detalle 	
-- update con.ingreso_detalle set fecha_contabilizacion = '2018-04-22 10:43:32', periodo = '201803' 
where num_ingreso in('IA532178')	


-- create table tem.comprobante_201805_caro as
select * from con.comprobante
-- update con.comprobante set creation_date = '2018-04-22 10:43:32', periodo = '201803'  
where numdoc in ('IA532178')

create table tem.comprodet_201805_caro as		--select * from tem.comprodet_201805_caro		Fecha antes del update: '2018-06-22 10:43:32'
select * from con.comprodet 
-- update con.comprodet set creation_date = '2018-04-22 10:43:32', periodo = '201803' 					
where numdoc in ('IA532178')
