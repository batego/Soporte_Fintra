select * from con.ingreso where num_ingreso = 'IC306033'		--'13050941'
-- update  con.ingreso set branch_code = 'BANCOLOMBIA', bank_account_no = 'CA' where num_ingreso = 'IC306033'
select * from con.ingreso_detalle where num_ingreso = 'IC306033'

select * from con.comprobante where numdoc = 'IC306033'
select * from con.comprodet where numdoc = 'IC306033'
-- update con.comprodet set cuenta = '11200501' , detalle = 'BANCOLOMBIA CA' where numdoc = 'IC306033' and transaccion = '33255973'

select * from con.ingreso where branch_code = 'BANCOLOMBIA' and bank_account_no = 'CA' limit 10	branch_code : 'BANCOLOMBIA' bank_account_no :'CA'
