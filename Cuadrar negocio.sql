	SELECT documento, tipo_documento, valor_factura AS debito, 0::NUMERIC AS credito, observacion 
	FROM con.factura 
	WHERE negasoc = 'MC17824'
UNION ALL
	select documento, tipo_documento,0::NUMERIC AS debito, vlr_neto AS credito, observacion 
	from fin.cxp_doc 
	where documento = 'MP15131' 
UNION ALL
	SELECT cod, tipodoc,0::NUMERIC AS debito, valor AS credito, '' AS observacion 
	FROM ing_fenalco 
	WHERE codneg = 'MC17824' 
UNION ALL 
	SELECT numdoc, tipodoc, 0::NUMERIC AS debito, valor_credito AS credito, detalle 
	FROM con.comprodet 
	WHERE numdoc = 'MC17824' AND detalle ILIKE '%intereses micro atlantico%'
UNION ALL
	SELECT documento, tipo_documento, 0::NUMERIC AS debito, abs(vlr) AS credito, descripcion 
	FROM fin.cxp_items_doc WHERE documento = 'MP15131' AND descripcion ILIKE 'DESCUENTO%'
UNION ALL
	SELECT documento, tipo_documento, vlr_neto AS debito, 0::NUMERIC AS credito, descripcion 
	FROM fin.cxp_doc 
	where documento_relacionado = 'MP15131'
UNION ALL
	SELECT documento,tipo_documento, 0::NUMERIC AS debito, vlr_neto AS credito, descripcion 
	FROM fin.cxp_doc 
	WHERE documento_relacionado = 'MC17824' AND documento ILIKE 'PL%';
	