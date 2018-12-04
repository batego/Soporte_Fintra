--Arreglar problema de Transoid
--buscar el cliente en el modulo de cuentas por cobrar - consiltas - consulta factura cliente  y poner el cod_cli en el filtro
--revisar las facturas que estan pagadas y coger como referencia el numero de documento eje PP02213550
--restablecer el saldo de las facturas generadas deben ser de igual numero que las planillas eje 3 pp = 3 planillas
--restablecer saldo del ingreso que fue afectado por las pp (restar el valor total de las pp) en la cabecera.
--eliminar del detalle las pp
 


-- desmarcar las planillas (buscar por la R que sale en la visualizacion de la corrida de UT primero y de ese select sacar las pp q estan con el usuario
-- de MMUSKUS);
SELECT cxc_corrida, * FROM etes.manifiesto_carga WHERE planilla IN ('0239842',
'0239840',
'0239841',
'0239846',
'0239847',
'0239851',
'0239852',
'0239854',
'0239856',
'0239855',
'0239848',
'0239857',
'0239997',
'0239999',
'0239998',
'0240009',
'0240010',
'0240008',
'0240016',
'0240018',
'0240014',
'0240022',
'0240019',
'0240025',
'0240169',
'0240168',
'0240170',
'0240175',
'0240174',
'0240178',
'0240179',
'0240177',
'0240180',
'0240171',
'0240176'); 

--RESTABLECER SALDO DE LAS FACTURAS
UPDATE con.factura AS a SET valor_abono =  0 , valor_saldo = b.valor_abono
FROM (SELECT * FROM con.factura 
WHERE documento in ('PP02215328',
'PP02215329',
'PP02215330',
'PP02215331',
'PP02215332',
'PP02215333',
'PP02215334',
'PP02215335',
'PP02215336',
'PP02215337',
'PP02215480',
'PP02215481',
'PP02215533',
'PP02215534',
'PP02215535',
'PP02215536',
'PP02215537',
'PP02215538',
'PP02215539',
'PP02215540',
'PP02215541',
'PP02215542',
'PP02215743',
'PP02215744',
'PP02215785',
'PP02215786',
'PP02215787',
'PP02215788',
'PP02215789',
'PP02215790',
'PP02215791',
'PP02215792',
'PP02215793',
'PP02215797',
'PP02215798') ) AS B WHERE  a.documento =b.documento;


--RESTABLECER SALDO DE LA CABECERA DEL INGRESO
SELECT * FROM con.ingreso WHERE num_ingreso = 'IA536046'; -- select 161746935 - 10496117 = 151250818

-- DELETE PP DEL DETALLE DEL INGRESO
CREATE TABLE tem.ingr_IA536046 AS;
SELECT * FROM con.ingreso_detalle 
--delete from con.ingreso_detalle
WHERE num_ingreso = 'IA536046' AND 
documento in ('PP02215328',
'PP02215329',
'PP02215330',
'PP02215331',
'PP02215332',
'PP02215333',
'PP02215334',
'PP02215335',
'PP02215336',
'PP02215337',
'PP02215480',
'PP02215481',
'PP02215533',
'PP02215534',
'PP02215535',
'PP02215536',
'PP02215537',
'PP02215538',
'PP02215539',
'PP02215540',
'PP02215541',
'PP02215542',
'PP02215743',
'PP02215744',
'PP02215785',
'PP02215786',
'PP02215787',
'PP02215788',
'PP02215789',
'PP02215790',
'PP02215791',
'PP02215792',
'PP02215793',
'PP02215797',
'PP02215798'); 
