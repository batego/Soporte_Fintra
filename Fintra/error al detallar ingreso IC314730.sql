
SELECT * FROM con.ingreso WHERE num_ingreso = 'IC314730'; --45488918    cod_cli : CL31568
SELECT * FROM con.ingreso_detalle WHERE num_ingreso = 'IC314730'; --45488918    cod_cli : CL31568
SELECT * FROM con.factura WHERE documento = 'PM14010_1';  --8002426429	cod_cli : CL31568
SELECT * FROM con.factura_detalle WHERE documento = 'PM14010_1'; 

select * from cliente  where codcli = 'CL31568';