SELECT * FROM INGRESO where num_ingreso = 'NC037736';
--DELETE FROM INGRESO where num_ingreso = 'NC037736';

SELECT * FROM con.ingreso_detalle where num_ingreso = 'NC037736'; 
--DELETE FROM con.ingreso_detalle where num_ingreso = 'NC037736'; 


select * from comprobante where  numdoc = 'NC037736';
select * from comprodet where  numdoc = 'NC037736';

DELETE from comprodet where  numdoc = 'NC037736';


--Tablas de backup para l nota NC037736
select * from DET_NC037736;
SELECT * FROM CAB_NC037736;
SELECT * FROM CAB_INGDET_NC037736;
SELECT * FROM CAB_ING_NC037736;
