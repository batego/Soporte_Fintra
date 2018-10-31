﻿--cambiamos el nit en la cabecera del ingreso
select * from con.ingreso where num_ingreso = 'IC210985'				-- NIT CLI : ''8901128013''  COD_CLI : ''CL07614'' 	
-- update con.ingreso set nitcli = '830061724' where num_ingreso = 'IC210985'

--cambiamos el nit del cliente 
select * from cliente  where codcli = 'CL07614'		-- nit : ''8901128013''
-- update cliente  set nit = '8901016819' where codcli = 'CL07614'	

select * from con.ingreso_detalle  where num_ingreso = 'IC210985'



select * from con.factura where documento = 'FPA00070' 							-- NIT: '8901016819'           COD_CLI : ''CL07382''
-- update con.factura set nit = '8901128013', codcli = 'CL07614' where documento = 'FPA00070' 		-- NIT: '8901016819'           COD_CLI : ''CL07382''
select * from con.factura_detalle where documento = 'FPA00070' 						-- NIT: '8901016819'	
-- update con.factura_detalle set nit = '8901128013' where documento = 'FPA00070' 			-- NIT: '8901016819'	


select * from con.comprobante where numdoc = 'FPA00070' 						-- TERCERO:  '8901016819'
-- UPDATE con.comprobante SET TERCERO = '8901128013' where numdoc = 'FPA00070' 				-- TERCERO:  '8901016819'
select * from con.comprodet where numdoc = 'FPA00070' 							-- TERCERO : '8901016819'
-- UPDATE con.comprodet  SET TERCERO = '8901128013' where numdoc = 'FPA00070' 				-- TERCERO : '8901016819'