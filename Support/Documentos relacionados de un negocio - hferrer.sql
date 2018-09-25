SELECT 			cxp.documento,
			   	fecha_documento,
			    fac.documento AS Factura,
			   	fac.fecha_factura,
			   	egr.document_no,
			   	egr.creation_date
FROM 		fin.cxp_doc cxp
LEFT JOIN   con.factura fac ON (cxp.documento_relacionado = fac.negasoc)
LEFT JOIN   egreso  egr ON (cxp.cheque = egr.document_no)
WHERE cxp.documento_relacionado = 'MC16015';

