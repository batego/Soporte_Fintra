--Boris solicito el favor arregalr ingreso operativo y contable IC343967, en el cual:
--
--1. la factura MC1497701 debe cancelar saldo $252.888 y quedar en estado pagada
--2. la factura MC1497702 debe quedar como esta en el ingreso 
--3. Agregar la factura MC1497703 la cual debe quedar abonada en $3.028 y con saldo $252.888
--
--esto debe ser hoy abtes que le apliquen pagos

SELECT * FROM con.ingreso WHERE num_ingreso = 'IC343967';
SELECT * FROM con.ingreso_detalle WHERE num_ingreso = 'IC343967';

select * from con.factura where documento IN ('MC1497701'); -- vlr_abono: 3028.00  vlr_saldo: 252888.00
select * from con.factura_detalle where documento IN ('MC1497701');

select * from con.factura where documento IN ('MC1497702'); -- vlr_abono:   vlr_saldo: 
select * from con.factura where documento IN ('MC1497703'); 

IC343967	1	1065001358	255916.00	255916.00	MC1497701
IC343967	2	1065001358	255916.00	255916.00	MC1497702
IC343967	3	1065001358	4479.00	    4479.00	
IC343967	4	1065001358	12889.00	12889.00

SELECT * FROM con.ingreso_detalle WHERE factura = 'MC1497702';

--Contable
SELECT * FROM con.comprobante WHERE numdoc = 'IC343967';
SELECT * FROM con.comprodet WHERE numdoc = 'IC343967';