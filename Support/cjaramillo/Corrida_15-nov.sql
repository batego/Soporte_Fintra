--Arreglar problema de Transoid
--buscar el cliente en el modulo de cuentas por cobrar - consiltas - consulta factura cliente  y poner el cod_cli en el filtro
--revisar las facturas que estan pagadas y coger como referencia el numero de documento eje PP02213550
--restablecer el saldo de las facturas generadas deben ser de igual numero que las planillas eje 3 pp = 3 planillas
--restablecer saldo del ingreso que fue afectado por las pp (restar el valor total de las pp) en la cabecera.
--eliminar del detalle las pp
 


-- desmarcar las planillas (buscar por la R que sale en la visualizacion de la corrida de UT primero y de ese select sacar las pp q estan con el usuario
-- de MMUSKUS);
SELECT cxc_corrida, * FROM etes.manifiesto_carga WHERE planilla IN ('0239141')
'0239123',
'0239124',
'0239131',
'0239127',
'0239132',
'0239134',
'0239135',
'0239136',
'0239138'
'0239139'); --0239141

--RESTABLECER SALDO DE LAS FACTURAS
SELECT * FROM con.factura 
WHERE documento in ('PP02214392','PP02214393','PP02214394','PP02214395','PP02214396','PP02214397','PP02214398','PP02214399','PP02214400','PP02214401');

SELECT * FROM con.factura_detalle 
WHERE documento in ('PP02214392','PP02214393','PP02214394','PP02214395','PP02214396','PP02214397','PP02214398','PP02214399','PP02214400','PP02214401');

--RESTABLECER SALDO DE LA CABECERA DEL INGRESO
SELECT * FROM con.ingreso WHERE num_ingreso = 'IA536011'; 

-- DELETE PP DEL DETALLE DEL INGRESO
CREATE TABLE tem.ingr_IA536011 as
SELECT * FROM con.ingreso_detalle 
--delete from con.ingreso_detalle
WHERE num_ingreso = 'IA536011' AND 
documento in ('PP02214392','PP02214393','PP02214394','PP02214395','PP02214396','PP02214397','PP02214398','PP02214399','PP02214400','PP02214401'); ; 
