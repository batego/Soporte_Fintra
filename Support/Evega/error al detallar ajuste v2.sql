--cambiamos el nit en la cabecera del ingreso
select * from con.ingreso where num_ingreso = 'IA535377';	--8000943862
update con.ingreso set nitcli = '830061724' where num_ingreso = 'IC303385'

--cambiamos el nit del cliente 
select * from cliente  where codcli = 'CL22384'		-- nit : '800094386'
update cliente  set nit = '830061724' where codcli = 'CL30073'	

select * from con.ingreso_detalle  where num_ingreso = 'IA535377'


select * from con.factura where documento = 'PM14212_1' 	-- nit     : '830061724'   Cod_cli : 'CL30073'
select * from con.factura_detalle where documento = 'PM13936_1' 

-- revisar nit del cliente, factura, ingreso

select * from con.factura  where documento = 'PM13936_1'

