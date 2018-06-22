select * from cliente where nit = '1047433668' limit 100
update cliente set nomcli = 'OSORIO MARTINEZ RAFAEL DAVID' where nit = '1047433668'

select * from nit where cedula = '1047433668' 
update nit set nombre1 = 'RAFAEL',
	       nombre2 = 'DAVID',
	       apellido1 = 'OSORIO',
	       apellido2 = 'MARTINEZ'	
 where cedula = '1047433668' 
