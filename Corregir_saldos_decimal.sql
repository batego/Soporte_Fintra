select * from con.factura  --where nit = '1042353049'
--update con.factura set valor_abono = 46040.4 ,valor_saldo = 0.00, valor_abonome = 46040.4, valor_saldome= 0.00
where valor_saldo < 1 and valor_saldo > 0
--valor_factura != valor_abono and valor_abono != 0.00  and negasoc != '' 

select valor_factura, valor_saldo , valor_facturame, valor_saldome from con.factura where negasoc in ('FA37196') and descripcion like '%CXC AVAL%'


update con.factura set valor_factura = 64459 , valor_saldo =0, valor_facturame = 64459, valor_saldome = 0
where negasoc = 'FA37196' and descripcion like '%CXC AVAL%'


