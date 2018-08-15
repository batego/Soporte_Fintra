-- se le cambio el nit del cliente en la cabecera del ingreso

select * from con.ingreso where num_ingreso in ('IA533125',
'IA533126',
'IA533127',
'IA533128',
'IA533129',
'IA533130',
'IA533131',
'IA533132',
'IA533133')

update con.ingreso set nitcli = '830061724' where num_ingreso in ('IA533125',
'IA533126',
'IA533127',
'IA533128',
'IA533129',
'IA533130',
'IA533131',
'IA533132',
'IA533133')

