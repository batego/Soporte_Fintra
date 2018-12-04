--Arreglar problema de Transoid
--buscar el cliente en el modulo de cuentas por cobrar - consiltas - consulta factura cliente  y poner el cod_cli en el filtro
--revisar las facturas que estan pagadas y coger como referencia el numero de documento eje PP02213550
--restablecer el saldo de las facturas generadas deben ser de igual numero que las planillas eje 3 pp = 3 planillas
--restablecer saldo del ingreso que fue afectado por las pp (restar el valor total de las pp) en la cabecera.
--eliminar del detalle las pp
--desmarcar las planillas (buscar por la R que sale en la visualizacion de la corrida de UT primero y de ese select sacar las pp q estan con el usuario

SELECT cxc_corrida, * FROM etes.manifiesto_carga WHERE PLANILLA IN ('0240973',
'0240972',
'0241016',
'0240976',
'0241142');


--UPDATE etes.manifiesto_carga SET  cxc_corrida = ''  
WHERE cxc_corrida = 'R0037180' AND creation_user = 'MMUSKUS';

SELECT * FROM con.factura WHERE documento = 'R0037180';

--ANULAR PLANILLA
SELECT * FROM etes.manifiesto_carga WHERE planilla ILIKE  '%240986';
SELECT * FROM ETES.manifiesto_descuentos WHERE planilla ILIKE  '%240986';




-- desmarcar las planillas (buscar por la R que sale en la visualizacion de la corrida de UT primero y de ese select sacar las pp q estan con el usuario
-- de MMUSKUS);
SELECT cxc_corrida, * FROM etes.manifiesto_carga 
-- UPDATE etes.manifiesto_carga SET cxc_corrida = ''
WHERE planilla IN ('0240520',
'0240524',
'0240586',
'0240583',
'0240517',
'0240582',
'0240519',
'0240516',
'0240523',
'0240726',
'0240732',
'0240527',
'0240587',
'0240589',
'0240530',
'0240529',
'0240182',
'0240186',
'0240183',
'0240188',
'0240184',
'0240347',
'0240349',
'0240423',
'0240585',
'0240398',
'0240350',
'0240352',
'0240355',
'0240358',
'0240356',
'0240522',
'0240526',
'0240525',
'0240579',
'0240575',
'0240573',
'0240421',
'0240391',
'0240405',
'0240400',
'0240359',
'0240437',
'0240408',
'0240348',
'0240532',
'0240351'); 

--RESTABLECER SALDO DE LAS FACTURAS
UPDATE con.factura AS a SET valor_abonome =  0 , valor_saldome = b.valor_factura
FROM (SELECT * FROM con.factura 
WHERE documento in ('PP02216286',
'PP02216287',
'PP02216288',
'PP02216289',
'PP02216290',
'PP02216291',
'PP02216292',
'PP02216293',
'PP02216294',
'PP02216295',
'PP02216296',
'PP02216297',
'PP02216298',
'PP02216299',
'PP02216643',
'PP02216644',
'PP02216645',
'PP02216673',
'PP02216674',
'PP02216675',
'PP02216676',
'PP02216677',
'PP02216678',
'PP02216679',
'PP02216680',
'PP02216681',
'PP02216682',
'PP02216683',
'PP02216684',
'PP02216685',
'PP02216686',
'PP02216939',
'PP02216940',
'PP02216941',
'PP02216942',
'PP02216943',
'PP02216944',
'PP02216945',
'PP02216946',
'PP02216947',
'PP02216948',
'PP02216949',
'PP02216950',
'PP02216951',
'PP02216952',
'PP02216953',
'PP02216954',
'PP02216955',
'PP02216956',
'PP02217128',
'PP02217115',
'PP02217116',
'PP02217117',
'PP02217118',
'PP02217119',
'PP02217120',
'PP02217121',
'PP02217122',
'PP02217123',
'PP02217124',
'PP02217125',
'PP02217126',
'PP02217127',
'PP02217288',
'PP02217289',
'PP02217290') ) AS B WHERE  a.documento =b.documento;


--RESTABLECER SALDO DE LA CABECERA DEL INGRESO
SELECT * FROM con.ingreso WHERE num_ingreso = 'IA536192'; -- select 161746935 - 10496117 = 151250818
SELECT * FROM con.ingreso_detalle WHERE num_ingreso = 'IA536192';


--La IA la sacamos del campo num_ingreso_ultimo_ingreso de la tabla factura de la PP
-- DELETE PP DEL DETALLE DEL INGRESO
CREATE TABLE tem.ingr_IA536076 AS
SELECT * FROM con.ingreso_detalle 
--delete from con.ingreso_detalle
WHERE num_ingreso = 'IA536192' AND 
documento in ('PP02216286',
'PP02216287',
'PP02216288',
'PP02216289',
'PP02216290',
'PP02216291',
'PP02216292',
'PP02216293',
'PP02216294',
'PP02216295',
'PP02216296',
'PP02216297',
'PP02216298',
'PP02216299',
'PP02216643',
'PP02216644',
'PP02216645',
'PP02216673',
'PP02216674',
'PP02216675',
'PP02216676',
'PP02216677',
'PP02216678',
'PP02216679',
'PP02216680',
'PP02216681',
'PP02216682',
'PP02216683',
'PP02216684',
'PP02216685',
'PP02216686',
'PP02216939',
'PP02216940',
'PP02216941',
'PP02216942',
'PP02216943',
'PP02216944',
'PP02216945',
'PP02216946',
'PP02216947',
'PP02216948',
'PP02216949',
'PP02216950',
'PP02216951',
'PP02216952',
'PP02216953',
'PP02216954',
'PP02216955',
'PP02216956',
'PP02217128',
'PP02217115',
'PP02217116',
'PP02217117',
'PP02217118',
'PP02217119',
'PP02217120',
'PP02217121',
'PP02217122',
'PP02217123',
'PP02217124',
'PP02217125',
'PP02217126',
'PP02217127',
'PP02217288',
'PP02217289',
'PP02217290'); 
