select * from consultas where descripcion='clientes_1ra_cuota';

SELECT n.id_convenio,
	   c.nombre,
	   n.cod_neg, 
       n.cod_cli, 
       get_nombc(n.cod_cli),
       fac.documento,
       fac.fecha_vencimiento, 
       fac.num_doc_fen as Cuota, 
       fac.valor_factura, 
       fac.valor_abono, 
       fac.valor_saldo,
       n.nro_docs
FROM NEGOCIOS N
INNER JOIN CON.FACTURA FAC ON (FAC.negasoc = N.cod_neg)
INNER JOIN convenios c ON (c.id_convenio = n.id_convenio)
WHERE 
	N.estado_neg = 'T' AND
	n.actividad = 'DES' AND 
	FAC.num_doc_fen = n.nro_docs AND 
	FAC.valor_abono = fac.valor_factura AND 
	to_char(FAC.fecha_ultimo_pago, 'YYYYMM') = ?
	AND n.cod_neg = 'FA13106';
	
	SELECT cod_neg, nro_docs,* FROM negocios WHERE cod_neg = 'LB00745';
	SELECT num_doc_fen,* FROM con.factura WHERE negasoc = 'LB00745';