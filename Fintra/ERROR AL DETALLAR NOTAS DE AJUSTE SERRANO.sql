select * from con.factura where documento = 'PM14010_1' 		--'8002426429'
select * from con.ingreso where num_ingreso in ('IA533156',		--'45488918'
'IA533157',
'IA533158')

update con.ingreso set nitcli = '8002426429' where num_ingreso in ('IA533156','IA533157','IA533158')


select * from cliente where nit = '45488918' and codcli = 'CL31568'


