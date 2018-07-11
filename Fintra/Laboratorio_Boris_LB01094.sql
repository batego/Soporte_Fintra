-- Desmarcamos el negocio para contabilizar nuevamente											-- OK
-- update negocios set fecha_cont = '2018-05-18 11:36:08.355277', periodo = '' where cod_neg = 'LB01094'
-- fecha_cont antes de update: '2018-05-18 11:36:08.355277'		-- '0099-01-01 00:00:00'
-- Periodo antes de update: 201805

-- Insertar Backup de factura (cabecera) de LB01094							
-- Insertar into con.factura select * from tem.btg_lb01094_fac 										-- OK 
select * from con.factura where negasoc = 'LB01094' ORDER BY DOCUMENTO 									-- OK

-- Cambiamos la fecha de contabilizacion y periodo para poder contabilizar
-- update con.factura set fecha_contabilizacion = '2018-05-18 11:36:05.208438', periodo = '201805' where negasoc = 'LB01094'

-- detalle de la factura LB01094	
select * from tem.btg_fac_det_example_LB01094												-- OK


-- Insertar en factura detalle 
-- insert into con.factura_detalle select * from tem.btg_fac_det_example_LB01094							-- OK

--Negocio
select fecha_cont, periodo,VR_NEGOCIO,VR_DESEMBOLSO, TOT_PAGADO, * from negocios where cod_neg = 'LB01094'

--cabecera
SELECT fecha_contabilizacion, * FROM con.factura where negasoc = 'LB01094' order by documento
-- update con.factura set fecha_contabilizacion = '2018-05-18 11:36:05.208438' where negasoc = 'LB01094' order by documento

--Detalle del negocio de ejemplo(cartera)
create table tem.btg_fac_det_example_LB01094 as		-- select * from tem.btg_fac_det_example_LB01094
SELECT * FROM con.factura_detalle where documento in (SELECT documento FROM con.factura where negasoc = 'LB01094') order by documento


SELECT * FROM con.factura where negasoc = 'LB01095' order by documento

--COntabilizacion cabecera de negocio de ejemplo
select * from con.comprobante  where numdoc = 'LB01095'

--COntabilizacion detalle de negocio de ejemplo
select * from con.comprodet  where numdoc = 'LB01095'


select * from documentos_neg_aceptado where cod_neg = 'LB01094' ORDER BY DIAS


-- Fecha Contabilizacion Factura = '2018-05-18 11:36:05.208438'
-- Fecha Contabilizacion Negocio = '2018-05-18 11:36:08.355277'

"'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'"