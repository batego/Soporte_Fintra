

select * from opav.ofertas where id_solicitud = '926740'

select * from cliente where codcli = 'CS32585'	--nit '900794932'



select * from opav.ofertas where id_solicitud = '926323'		--'CS32585' 
update opav.ofertas set id_cliente = 'CS32585' where id_solicitud = '926323'	

SELECT * FROM CON.FACTURA WHERE DOCUMENTO = 'FPA00067'			-- OK '900794932'	--BAD '900843992'
update CON.FACTURA set nit = '900794932', codcli = 'CS32585' WHERE DOCUMENTO = 'FPA00067'	

SELECT * FROM CON.FACTURA_DETALLE WHERE DOCUMENTO = 'FPA00067'
update CON.FACTURA_DETALLE set nit = '900794932' WHERE DOCUMENTO = 'FPA00067'


SELECT * FROM CON.COMPROBANTE WHERE NUMDOC =  'FPA00067'
update CON.COMPROBANTE set tercero = '900794932' WHERE NUMDOC =  'FPA00067'

SELECT * FROM CON.COMPRODET WHERE NUMDOC =  'FPA00067'
update CON.COMPRODET set tercero = '900794932' WHERE NUMDOC =  'FPA00067'

SELECT * FROM opav.sl_anticipos where cod_anticipo = 'ANP00067'
update  opav.sl_anticipos set cod_cli = 'CS32585' where cod_anticipo = 'ANP00067'
	
