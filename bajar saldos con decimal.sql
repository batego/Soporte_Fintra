BAJAR SALDOS CON DECIMAL
Favor bajar los siguientes saldos con decimal:
LINEA	CEDULA		NOMBRE CLIENTE				NEGOCIO	CONVENIO	VENCIMIENTO MAYOR	 VALOR 
EDU	22675175	ESCORCIA PIZARRO MARIEVA LUZ		FA38480	17			2- 1 A 30	 $0,08 
EDU	8735196		HERNANDEZ ALVAREZ MILTON JOSE		FA38518	17			1- CORRIENTE	 $0,16 
EDU	22493078	CARRASCAL PERDOMO ANGELA LUZ		FA38566	17			1- CORRIENTE	 $0,20 
EDU	22725670	ANGULO JIMENEZ OMAIRA 			FA37166	17			2- 1 A 30	 $0,20 
EDU	32872325	LONDOÑO JIMENEZ MIRNA ROSA		FA38546	17			1- CORRIENTE	 $0,24 
EDU	32817311	OYOLA CARRILLO PIEDAD CECILIA		FA38525	17			1- CORRIENTE	 $0,24 
EDU	72047040	BENEDETTI ALTAMAR ALFREDO ALBERTO	FA37278	17			2- 1 A 30	 $0,42 
EDU	91426421	GAMARRA CASTILLA LUIS ALFONSO		FA38502	17			1- CORRIENTE	 $0,48 
EDU	1097970460	TOLOZA CARDENAS DIOS ESTEBAN		FA38410	17			2- 1 A 30	 $0,48 
EDU	32754318	TORREGROZA RAMOS GLADYS ROCIO		FA38497	17			2- 1 A 30	 $0,48 
EDU FB	1047458713	HERRERA MORENO ORLANDO DE JESUS		FB05832	31			2- 1 A 30	 $0,48 


select * from con.factura  --where nit = '1042353049'
--update con.factura set valor_abono = 46040.4 ,valor_saldo = 0.00, valor_abonome = 46040.4, valor_saldome= 0.00
where valor_saldo < 1 and valor_saldo > 0
--valor_factura != valor_abono and valor_abono != 0.00  and negasoc != '' 

select valor_factura, valor_saldo , valor_facturame, valor_saldome from con.factura where negasoc in ('FB05832') and descripcion like '%CXC AVAL%'


update con.factura set valor_factura = 109232.00 , valor_saldo =0, valor_facturame = 109232.00, valor_saldome = 0
where negasoc = 'FB05832' and descripcion like '%CXC AVAL%'


