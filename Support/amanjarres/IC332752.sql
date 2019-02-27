select * from con.ingreso where num_ingreso = 'IC332752'; --CORRESPONSALES 	BCO OCCIDENTE
select cuenta,* from con.ingreso_detalle where num_ingreso = 'IC332752';--16252102

SELECT * FROM con.comprobante WHERE numdoc = 'IC332752';
SELECT * FROM con.comprodet WHERE numdoc = 'IC332752';--11050535	CORRESPONSALES  BCO OCCIDENTE
--------------------------------------------------
select * from con.ingreso where num_ingreso in('IC337735','IC332752'); 
select * from con.ingreso_detalle where num_ingreso in('IC337735','IC332752'); --16252102

SELECT * FROM con.comprobante WHERE numdoc = 'IC324780';
SELECT * FROM con.comprodet WHERE numdoc  in('IC337735','IC332752');--11050535	CORRESPONSALES  BCO OCCIDENTE

select * from con.ingreso WHERE branch_code ILIKE '%CORRESPONSALES%';