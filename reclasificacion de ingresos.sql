--CONTABLE
select * from con.comprobante where numdoc = 'IC289590' limit 100;
select * from con.comprodet where   numdoc = 'IC289590' and transaccion = '32697204'

-- update con.comprodet set cuenta = '11200501' , detalle = 'BANCOLOMBIA CA' where numdoc = 'IC289590' and transaccion = '32697204'



--OPERATIVO
select * from con.ingreso where num_ingreso = 'IC289590'
update con.ingreso set bank_account_no = 'CA' where num_ingreso = 'IC289590'

select * from con.ingreso_detalle where num_ingreso = 'IC289590'


