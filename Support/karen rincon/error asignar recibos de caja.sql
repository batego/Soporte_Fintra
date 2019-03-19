select * from recibos_caja_id_seq;
select last_value as num_recibo from recibos_caja_id_seq;

CREATE TABLE tem.recibos_caja_karen_20190306 AS 
SELECT * FROM  recibos_caja
--delete from recibos_caja
WHERE num_recibo::NUMERIC BETWEEN 37925 AND 379255 AND id_estado_recibo = 'PEND_POR_ENTREGAR';


SELECT * FROM  recibos_caja WHERE num_recibo = '37991';
SELECT * FROM  recibos_caja WHERE num_recibo::numeric BETWEEN 38001::NUMERIC AND 38010::NUMERIC ORDER BY num_recibo, fecha_entrega;

--INSERT INTO recibos_caja
SELECT * FROM tem.recibos_caja_karen_20190306 WHERE num_recibo::numeric BETWEEN 38001::NUMERIC AND 38010::NUMERIC;

los consecutivos que asigne  fueron:
 37926 - 37936  eduardo romero el 28/02/2019
 37937 - 37950  oliver valbuena el 28/02/2019
 37951 - 37961  jamer arrieta el 28/02/2019
 37962 al 37972 karen rincon el 28/02/2019
 37973 al 37983 karen rincon el 28/02/2019
 37984 al 37990 karen rincon el 28/02/2019 - Ok
 37991 al 37991 ernesto miranda el 28/02/2019
 37992 al 38000 carlos suarez el 28/02/2019
 38001 al 38010 omet linero el 28/02/2019