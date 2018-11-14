--Arreglar problema de Transoid
--buscar el cliente en el modulo de cuentas por cobrar - consiltas - consulta factura cliente  y poner el cod_cli en el filtro
--revisar las facturas que estan pagadas y coger como referencia el numero de documento eje PP02213550
--restablecer el saldo de las facturas generadas deben ser de igual numero que las planillas eje 3 pp = 3 planillas
--restablecer saldo del ingreso que fue afectado por las pp (restar el valor total de las pp) en la cabecera.
--eliminar del detalle las pp
 

SELECT * FROM con.factura WHERE documento in ('PP02213550','PP02213551','PP02213552');
SELECT * FROM con.factura_detalle WHERE documento in ('PP02213550','PP02213551','PP02213552');

SELECT * FROM con.ingreso WHERE num_ingreso = 'IA535779';
CREATE TABLE tem.ingr_IA535779 as
SELECT * FROM con.ingreso_detalle WHERE num_ingreso = 'IA535779' AND documento IN ('PP02213550','PP02213551','PP02213552');
--delete FROM con.ingreso_detalle WHERE num_ingreso = 'IA535779' AND documento IN ('PP02213550','PP02213551','PP02213552');



SELECT * FROM con.factura WHERE num_ingreso_ultimo_ingreso = 'IA535779' AND documento IN ('PP02213550','PP02213551','PP02213552');

