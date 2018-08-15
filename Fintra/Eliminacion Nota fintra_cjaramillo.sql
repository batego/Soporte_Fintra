create table tem.ing_nota_ajuste_IA531067 as			--select * from tem.ing_nota_ajuste_IA531067
select * from con.ingreso where num_ingreso = 'IA531067'
-- delete from con.ingreso where num_ingreso = 'IA531067'

create table tem.ingdet_nota_ajuste_IA531067 as			--select * from tem.ingdet_nota_ajuste_IA531067
select * from con.ingreso_detalle  where num_ingreso = 'IA531067'
-- delete from con.ingreso_detalle  where num_ingreso = 'IA531067'

create table tem.comprobant_nota_ajuste_IA531067 as		--select * from tem.comprobant_nota_ajuste_IA531067
select * from con.comprobante where numdoc = 'IA531067'
-- delete from con.comprobante where numdoc = 'IA531067'

create table tem.comprodet_nota_ajuste_IA531067 as		--select * from tem.comprodet_nota_ajuste_IA531067
-- delete from con.comprodet where numdoc = 'IA531067'

--consultamos la factura 
select * from con.factura where documento = 'PP02191437'

-- Bajamos el saldo de la factura a la que afecta la nota de ajuste
update 
	con.factura 
set 
	valor_abono 		= 0,
	valor_saldo 		= 371000,
	valor_abonome		= 0,
	valor_saldome 		= 371000
where   documento 		= 'PP02191437'


select * from con.factura_detalle where documento = 'PP02191437'