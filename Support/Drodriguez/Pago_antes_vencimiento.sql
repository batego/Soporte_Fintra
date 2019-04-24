SELECT * FROM consultas WHERE descripcion ILIKE '%PAGO_ANTES_VENCIMIENTO%';

--PAGO_ANTES_VENCIMIENTO
SELECT f.nit, 
	   c.nomcli,
	   f.negasoc,
	   f.documento, 
	   f.fecha_vencimiento, 
	   f.fecha_ultimo_pago, 
	   f.valor_factura, 
	   f.valor_abono, 
	   f.valor_saldo, 
	   f.num_doc_fen AS cuota
FROM   con.factura F 
INNER  JOIN negocios N ON (n.cod_neg = f.negasoc)
INNER JOIN cliente C ON (c.nit = f.nit)
WHERE  f.fecha_ultimo_pago < f.fecha_vencimiento 
  AND  f.fecha_ultimo_pago != '0099-01-01' 
  AND  n.estado_neg = 'T' 
  AND  f.reg_status != 'A' 
  AND  REPLACE(substring(f.fecha_vencimiento::date,1,7),'-','') = REPLACE(substring(now()::date,1,7),'-','') 
  AND  f.valor_saldo = 0 
  AND  (SELECT sum(fac.valor_saldo) FROM con.factura fac WHERE fac.negasoc = f.negasoc AND fac.reg_status = '' ) != 0
ORDER BY f.nit, f.negasoc
--GROUP BY f.nit,f.negasoc
--HAVING SUM(F.valor_saldo) != 0





SELECT * FROM con.factura 
WHERE negasoc = 'MC14186'  AND fecha_ultimo_pago < fecha_vencimiento AND fecha_ultimo_pago != '0099-01-01 00:00:00';
GROUP by negasoc, codcli, nit
HAVING sum(valor_saldo) != 0; 


select * from con.factura where negasoc='MC17291';