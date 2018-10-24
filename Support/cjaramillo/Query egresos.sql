SELECT e.document_no, cd.documento_rel, cd.valor_debito, cd.valor_credito, cd.cuenta, cd.detalle
FROM con.comprodet cd
INNER JOIN egreso e ON (e.document_no = numdoc AND e.nit = '9002207536' AND e.document_no ILIKE 'BC%' AND e.transaccion = cd.grupo_transaccion);


		