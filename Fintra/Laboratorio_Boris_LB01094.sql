-- Desmarcamos el negocio para contabilizar nuevamente											-- OK
-- update negocios set fecha_cont = '0099-01-01 00:00:00', periodo = '' where cod_neg = 'LB01094'
-- fecha_cont antes de update: '2018-05-18 11:36:08.355277'		-- '0099-01-01 00:00:00'
-- Periodo antes de update: 201805

-- Insertar Backup de factura (cabecera) de LB01094							
-- Insertar into con.factura select * from tem.btg_lb01094_fac 										-- OK 
select * from con.factura where negasoc = 'LB01094' ORDER BY DOCUMENTO 									-- OK
select documento, sum(valor_unitario) from con.factura_detalle where documento in (select documento from con.factura where negasoc = 'LB01094')  group by documento
select  * from con.comprobante where numdoc in (select documento from con.factura where negasoc = 'LB01094') order by numdoc
select  numdoc, sum(valor_debito), sum(valor_credito) from con.comprodet where numdoc in (select documento from con.factura where negasoc = 'LB01094') group  by numdoc
select * from con.comprobante where numdoc in ('LB01094','LB01095')
select * from con.comprodet where numdoc in ('LB01094','LB01095')
select * from negocios where cod_neg in ('LB01094','LB01095')

-- Cambiamos la fecha de contabilizacion y periodo para poder contabilizar
-- update con.factura set fecha_contabilizacion = '2018-05-18 11:36:05.208438', periodo = '201805' where negasoc = 'LB01094'

-- detalle de la factura LB01094	
select * from tem.btg_fac_det_example_LB01094												-- OK


-- Insertar en factura detalle 
-- insert into con.factura_detalle select * from tem.btg_fac_det_example_LB01094							-- OK
3000000.0
--Negocio
select fecha_cont, periodo,VR_NEGOCIO,VR_DESEMBOLSO, TOT_PAGADO, * from negocios where cod_neg = 'LB01094'	4291838.70

select * from con.comprobante where grupo_transaccion = '11156522'
SELECT * FROM CLIENTE WHERE NIT = '1129537415'
--cabecera
SELECT sum(valor_factura)  FROM con.factura where negasoc = 'LB01094' order by documento 	4291841.00
-- update con.factura set fecha_contabilizacion = '2018-05-18 11:36:05.208438' where negasoc = 'LB01094' order by documento

--Detalle del negocio de ejemplo(cartera)
create table tem.btg_fac_det_example_LB01094 as		-- select * from tem.btg_fac_det_example_LB01094
SELECT * FROM con.factura_detalle where documento in (SELECT documento FROM con.factura where negasoc = 'LB01094') order by documento


-- SELECT * FROM con.factura where negasoc = 'LB01094' order by documento

--COntabilizacion cabecera de negocio de ejemplo
select * from con.comprobante  where numdoc IN ('LB01094')

--COntabilizacion detalle de negocio de ejemplo
select * from con.comprodet  where numdoc IN ('LB01094')
-- update con.comprodet set transaccion = '29798247'  where numdoc IN ('LB01094')	AND VALOR_CREDITO != 0	--16042310

-- select * from con.comprodet where numdoc ilike 'LB%' AND TIPODOC = 'NEG'  ORDER BY CREATION_DATE ASC LIMIT 1000
-- SELECT * FROM CON.COMPRODET WHERE TRANSACCION = '27283551'

-- select * from documentos_neg_aceptado where cod_neg = 'LB01094' ORDER BY DIAS


-- Fecha Contabilizacion Factura = '2018-05-18 11:36:05.208438'
-- Fecha Contabilizacion Negocio = '2018-05-18 11:36:08.355277'

-- "'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'"
-- 
-- 
-- SELECT neg.*, 
--             GET_NOMBC(cod_cli) AS NOMB,
--             (SELECT COALESCE(sum(cuota_manejo),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as cuota_manejo,
--             (SELECT COALESCE(round(sum(remesa)),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as vlr_remesa,
--             (SELECT COALESCE(round(sum(interes)),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as interes_corriente, 
--             (SELECT COALESCE(round(sum(cat)),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as vlr_cat  
--             FROM negocios neg
--             INNER JOIN convenios con ON con.id_convenio = neg.id_convenio AND con.tipo != 'Multiservicio'
--             WHERE fecha_negocio < now() -- AND estado_neg IN ('T')
--             AND (CASE WHEN substring(cod_neg,1,2)='MC' THEN estado_neg IN ('T') ELSE estado_neg IN ('A','T') END )
--            -- AND fecha_cont = '0099-01-01 00:00:00'
--             AND dist='FINV' 
--             AND cod_neg in ('LB01094','LB01168')
-- 
--           select * from negocios where id_convenio = '38' and periodo = '201807' and estado_neg = 'T'