-- Ticket # 3655 SISTEMA NO MUESTRA SALDOS DEL CLIENTE PADILLA POVEDA MAURA ANDREA CC 1067857831
-- Muy buenas tardes. Cliente mencionado en titulo se busca en cartera y en el modulo de estados de cuenta, pero no muestra valores adeudados, 
-- se necesita, pues el cliente cancelara pero no tenemos como decirle cuanto debe. Por favor verificar el caso, es un cliente con una mora de mas de un año,
-- pero no se ven los valores. Agradezco de antemano la ayuda que me puedan brindar para poder darle la informando al cliente.
 
create table tem.factura_FB00379 as 
select transaccion, 
       documento, 
       negasoc,
       num_doc_fen, 
       nit, 
       creation_date,
       periodo, 
       fecha_factura, 
       fecha_vencimiento, 
       fecha_ultimo_pago, 
       fecha_contabilizacion 
from con.factura
where nit = '1067857831'  and 
      negasoc = 'FB00379' 
order by transaccion, num_doc_fen


-- create table tem.prueba_factura_FB00379 as 
--  select * from tem.factura_FB00379


--select substr(num_doc_fen,7),num_doc_fen from tem.prueba_factura_FB00379 order by transaccion, num_doc_fen


select * from con.factura_detalle where nit = '1067857831'