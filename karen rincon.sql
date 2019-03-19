
select * from recibos_caja_id_seq;
select last_value as num_recibo from recibos_caja_id_seq;

CREATE TABLE tem.recibos_caja_karen_20181120 AS; 
SELECT * FROM  recibos_caja
--delete from recibos_caja
WHERE num_recibo::NUMERIC BETWEEN 33951 AND 339960;


SELECT * FROM  recibos_caja WHERE num_recibo = 33950;


