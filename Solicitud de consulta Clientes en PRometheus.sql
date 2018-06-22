-- Ticket# 3399 description
-- Solicitud de consulta Clientes en PRometheus
-- Se solicita consulta a la base de clientes en Prometheus que tenga la siguientes características:
-- - Linea Educativo
-- - Clientes que se les hizo desembolso entre mayo de 2016 y agosto de 2017 y hoy no tengan deuda con Fintra.


select n.cod_neg, n.estado_neg, n.id_convenio,n.* from negocios n
--inner join con.factura f on (n.cod_neg = f.negasoc)
where id_convenio = '17' and estado_neg = 'T' and f_desem between '2016-05-01'::date and '2017-08-31'::date and 
(select sum(valor_saldo) from con.factura  where negasoc = n.cod_neg) = 0        --and n.cod_neg = 'FA21101'
--group by n.cod_neg,n.estado_neg, n.id_convenio



select sum(valor_saldo)  from con.factura  where negasoc = 'FA21101' group by valor_saldo --order by documento 
select * from con.factura_detalle  where documento in ('FG1618600',
'FG1618601',
'FG1618602',
'FG1618603',
'FG1618604',
'FG1618605',
'FG1618606')

select * from convenios where id_convenio = '58' 	-- 58;'EDUCATIVO FINTRA';'CONSUMO EDUCATIVO'
select * from convenios where id_convenio = '17' 	-- 17;'AVAL POSFECHADO CON REDESCUENTO EDUCACION';'AVAL CON REDESCUENTODE CHEQUES Y PAGARES AVALADOS POR FENALCO ATLANTICO SECTOR EDUCATIVO'
