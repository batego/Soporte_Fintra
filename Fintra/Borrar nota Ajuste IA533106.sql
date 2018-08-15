create table tem.ing_nota_ajuste_IA533106 as			--select * from tem.ing_nota_ajuste_IA533106
select * from con.ingreso where num_ingreso = 'IA533106'
-- delete from con.ingreso where num_ingreso = 'IA533106'

create table tem.ingdet_nota_ajuste_IA533106 as			--select * from tem.ingdet_nota_ajuste_IA533106
select * from con.ingreso_detalle  where num_ingreso = 'IA533106'
-- delete from con.ingreso_detalle  where num_ingreso = 'IA533106'

create table tem.comprobant_nota_ajuste_IA533106 as		--select * from tem.comprobant_nota_ajuste_IA533106
select * from con.comprobante where numdoc = 'IA533106'
-- delete from con.comprobante where numdoc = 'IA533106'

create table tem.comprodet_nota_ajuste_IA533106 as		--select * from tem.comprodet_nota_ajuste_IA533106
select * from con.comprodet where numdoc = 'IA533106'
-- delete from con.comprodet where numdoc = 'IA533106'

--consultamos la factura 
select * from con.factura where documento = 'PM13972_1'


select 3487542 - 43385
select 2761525 + 43385
select 6249067.00 - 3487542.00 = 2761525.00

-- Bajamos el saldo de la factura a la que afecta la nota de ajuste
update 
	con.factura 
set 
	valor_abono 		= 3444157,
	valor_saldo 		= 2804910,
	valor_abonome		= 3444157,
	valor_saldome 		= 2804910
where   documento 		= 'PM13972_1'

-- valor nota = 43385.00
select * from con.factura_detalle where documento = ''