select * from opav.sl_anticipos where num_factura = 'FPA00064'

select * from con.factura where documento = 'FPA00064'
-- update con.factura set codcli = 'CL26948', nit = '800187291' where documento = 'FPA00064'
select * from con.factura_detalle  where documento = 'FPA00064'
-- update con.factura_detalle set nit = '800187291' where documento = 'FPA00064'

select tercero from con.comprobante where numdoc = 'FPA00064' 
-- update con.comprobante set tercero = '800187291' where numdoc = 'FPA00064' 

select tercero from con.comprodet where numdoc = 'FPA00064' 
-- update con.comprodet set tercero = '800187291' where numdoc = 'FPA00064' 



select * from nit where cedula = '9001157085'

'800187291';'';'H.M. INGENIERIA S.A.S.'		-- 'CL26948'
'9001157085';'';'ICONO INGENIERIA Y CONSTRUCCION LTDA'  --'CL26328'

select * from opav.ofertas where id_solicitud = '926740'

select * from cliente where codcli = 'CL26948'
'CL26328'
