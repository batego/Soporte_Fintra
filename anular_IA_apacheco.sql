﻿-- ANULAR 
-- Buenos Dias 
-- Por favor ANULAR las siguientes Notas De Ajuste 
-- IA531533	                    $263518
-- IA531538	                    $382674
-- IA531541	                    $484753
-- IA531544	                    $292970
-- 
-- Del Cliente CL13075 
-- 
-- Y la Nota de Ajuste 
-- IA531535                    $8.265.594,00
-- 
-- Del cliente CL28789


create table tem_btg_Not_ajust_apacheco as
SELECT * FROM con.ingreso where num_ingreso in ('IA531533','IA531538','IA531541','IA531544','IA531535');
-- update con.ingreso set reg_status = 'A' where num_ingreso in ('IA531535');
-- delete FROM con.ingreso where num_ingreso in ('IA531533','IA531538','IA531541','IA531544','IA531535');


create table tem_btg_Not_ajust_apacheco_det_ing as				--select * from tem_btg_Not_ajust_apacheco_det_ing
SELECT * FROM con.ingreso_detalle  where num_ingreso in ('IA531533','IA531538','IA531541','IA531544','IA531535');
-- update con.ingreso_detalle set reg_status = 'A' where num_ingreso in ('IA531533','IA531538','IA531541','IA531544','IA531535');
-- delete FROM con.ingreso_detalle  where num_ingreso in ('IA531533','IA531538','IA531541','IA531544','IA531535');



select * from con.factura where documento in ('R0035897',
'R0035899',
'R0035903',
'R0035905',
'R0035910'
)
-- update con.factura set valor_abono = 0, valor_saldo = 8265594, valor_abonome = 0, valor_saldome = 8265594 where documento in ('R0035899')

select * from con.factura_detalle where documento in ('R0035897')

create table tem_btg_Not_ajust_apacheco_cab_comp as
select * from con.comprobante where  numdoc in ('IA531533','IA531538','IA531541','IA531544','IA531535');
-- update con.comprobante set reg_status = 'A' where  numdoc in ('IA531533','IA531538','IA531541','IA531544','IA531535');
-- delete from con.comprobante where  numdoc in ('IA531533','IA531538','IA531541','IA531544','IA531535');

create table tem_btg_Not_ajust_apacheco_det_comp as
select * from con.comprodet where numdoc in ('IA531533','IA531538','IA531541','IA531544','IA531535');
-- update con.comprodet set reg_status = 'A'  where numdoc in ('IA531533','IA531538','IA531541','IA531544','IA531535');
-- delete from con.comprodet where numdoc in ('IA531533','IA531538','IA531541','IA531544','IA531535');
