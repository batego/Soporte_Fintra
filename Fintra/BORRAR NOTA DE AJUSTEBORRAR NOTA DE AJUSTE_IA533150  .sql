create table tem.ing_nota_ajuste_IA533150 as			--select * from tem.ing_nota_ajuste_IA533150
select * from con.ingreso where num_ingreso = 'IA533150'
delete from con.ingreso where num_ingreso = 'IA533150'

create table tem.ingdet_nota_ajuste_IA533150 as			--select * from tem.ingdet_nota_ajuste_IA533150
select * from con.ingreso_detalle  where num_ingreso = 'IA533150'
delete from con.ingreso_detalle  where num_ingreso = 'IA533150'


select * from con.comprobante where numdoc = 'IA533150'
select * from con.comprodet where numdoc = 'IA533150'

--consultamos la factura 
select * from con.factura where documento = 'PM14035_1'

-- Bajamos el saldo de la factura a la que afecta la nota de ajuste
update 
	con.factura 
set 
	valor_abono 		= 0,
	valor_saldo 		= 1093349,
	valor_abonome		= 0,
	valor_saldome 		= 1093349
where   documento 		= 'PM14035_1'


select * from con.factura_detalle where documento = 'PM14035_1'
