--Arreglar problema de Transoid
--buscar el cliente en el modulo de cuentas por cobrar - consiltas - consulta factura cliente  y poner el cod_cli en el filtro
--revisar las facturas que estan pagadas y coger como referencia el numero de documento eje PP02213550
--restablecer el saldo de las facturas generadas deben ser de igual numero que las planillas eje 3 pp = 3 planillas
--restablecer saldo del ingreso que fue afectado por las pp (restar el valor total de las pp) en la cabecera.
--eliminar del detalle las pp
 


-- desmarcar las planillas (buscar por la R que sale en la visualizacion de la corrida de UT primero y de ese select sacar las pp q estan con el usuario
-- de MMUSKUS);
SELECT cxc_corrida, * FROM etes.manifiesto_carga 
--UPDATE etes.manifiesto_carga SET cxc_corrida = ''
WHERE planilla IN ('0239297',       
'0239298',       
'0239299',       
'0239301',       
'0239302',       
'0239305',       
'0239307',       
'0239308',       
'0239309',       
'0239310',       
'0239312',       
'0239313',       
'0239304',       
'0239519',       
'0239521',       
'0239522',       
'0239523',       
'0239525',       
'0239526',       
'0239527',       
'0239528',       
'0239533',       
'0239534',       
'0239520',       
'0239524',       
'0239686',       
'0239693',       
'0239696', 
'0239697',
'0239698',       
'0239699',       
'0239700',        
'0239701',       
'0239702',       
'0239704',       
'0239705',       
'0239695',    
'0239691'); -- cxc_corrida = 'R0037000' AND transaccion != 0 AND  creation_user = 'MMUSKUS' 0239141

--RESTABLECER SALDO DE LAS FACTURAS
 
UPDATE con.factura AS a SET valor_abonome =  0 , valor_saldome = b.valor_abonome
FROM (SELECT * FROM con.factura 
WHERE documento in ('PP02214789', 
'PP02214582', 
'PP02214583', 
'PP02214584', 
'PP02214585', 
'PP02214586', 
'PP02214587', 
'PP02214588', 
'PP02214589', 
'PP02214590', 
'PP02214779', 
'PP02214792', 
'PP02214793', 
'PP02214925', 
'PP02214926', 
'PP02214915', 
'PP02214916', 
'PP02214917', 
'PP02214918', 
'PP02214919', 
'PP02214920', 
'PP02214921', 
'PP02214922', 
'PP02214923', 
'PP02214924', 
'PP02214989', 
'PP02214990', 
'PP02214991', 
'PP02214992', 
'PP02214993', 
'PP02214994', 
'PP02214995', 
'PP02214996', 
'PP02214997', 
'PP02214998', 
'PP02214999') ) AS B WHERE  a.documento =b.documento;

SELECT * FROM con.factura_detalle 
WHERE documento in ('PP02214392','PP02214393','PP02214394','PP02214395','PP02214396','PP02214397','PP02214398','PP02214399','PP02214400','PP02214401');

--RESTABLECER SALDO DE LA CABECERA DEL INGRESO
SELECT * FROM con.ingreso WHERE num_ingreso = 'IA536017'; 

-- DELETE PP DEL DETALLE DEL INGRESO
CREATE TABLE tem.ingr_IA536017 AS
SELECT * FROM con.ingreso_detalle 
--delete from con.ingreso_detalle
WHERE num_ingreso = 'IA536017' AND 
documento in ('PP02214789', 
'PP02214582', 
'PP02214583', 
'PP02214584', 
'PP02214585', 
'PP02214586', 
'PP02214587', 
'PP02214588', 
'PP02214589', 
'PP02214590', 
'PP02214779', 
'PP02214792', 
'PP02214793', 
'PP02214925', 
'PP02214926', 
'PP02214915', 
'PP02214916', 
'PP02214917', 
'PP02214918', 
'PP02214919', 
'PP02214920', 
'PP02214921', 
'PP02214922', 
'PP02214923', 
'PP02214924', 
'PP02214989', 
'PP02214990', 
'PP02214991', 
'PP02214992', 
'PP02214993', 
'PP02214994', 
'PP02214995', 
'PP02214996', 
'PP02214997', 
'PP02214998', 
'PP02214999');
