SELECT 
      periodo,
      s.numero_solicitud,
      neg.cod_neg as negocio, 
      conf.nombre_convenio_pagaduria AS convenio, 
      cod_cli as cedula, 
      get_nombc(cod_cli) AS cliente, 
      vr_negocio as vlr_credito,
      nro_docs AS plazo,
      CASE WHEN (select num_doc_fen from con.factura where negasoc=neg.cod_neg AND valor_abono = 0 AND fecha_vencimiento  <= now() ORDER BY num_doc_fen DESC
      			       LIMIT 1) != '' then
	      			(select num_doc_fen 
	      			 from con.factura 
	      			 where negasoc=neg.cod_neg AND 
	      			       valor_abono = 0 AND 
	      			       fecha_vencimiento  <= now() 
	      			       ORDER BY num_doc_fen DESC
	      			       LIMIT 1)
      ELSE 
      	   		'1'
      END AS Cuota, 
      coalesce(valor_comprar,0) AS vlr_compra_cartera,
      coalesce(round(dna.valor),0.00)  AS vlr_cuota,      
      CASE WHEN (SELECT valor_unitario  
      			 FROM con.factura_detalle  
                 WHERE documento IN (select documento 
				 					 from con.factura 
				 					 where negasoc=neg.cod_neg AND 
				 					       valor_abono = 0 AND 
				 					       fecha_vencimiento  <= now()
				 					       ORDER BY num_doc_fen DESC
      			       					   LIMIT 1) 
				   AND item = '1') != 0 THEN   
			     (SELECT valor_unitario  
			      FROM con.factura_detalle  
                  WHERE documento IN (select documento 
				 					  from con.factura 
				 					  where negasoc=neg.cod_neg AND 
				 					       valor_abono = 0 AND 
				 					       fecha_vencimiento  <= now()
				 					       ORDER BY num_doc_fen DESC
      			       					   LIMIT 1) 
				    AND item = '1')		
	  ELSE 
	  			(SELECT valor_unitario  
	  			 FROM con.factura_detalle 
 				 WHERE documento IN (select DOCUMENTO  
 				                     from con.factura 
 				                     where negasoc=neg.cod_neg 
 				                       AND num_doc_fen = '1') 
 				   AND item = 1)
	  END AS Capital,	       
  	  CASE WHEN (SELECT valor_unitario  
  	  			 FROM con.factura_detalle 
                 WHERE documento IN (select documento 
 					      from con.factura 
 					      where negasoc=neg.cod_neg AND 
 					            valor_abono = 0 AND 
 					            fecha_vencimiento  <= now()  
 					            ORDER BY num_doc_fen DESC 
 					            LIMIT 1)
 			     AND item = 2) != 0 THEN
 		         (SELECT valor_unitario  
  	  			  FROM con.factura_detalle 
                  WHERE documento IN (select documento 
 					                  from con.factura 
 					                  where negasoc=neg.cod_neg AND 
 					                        valor_abono = 0 AND 
 					                        fecha_vencimiento  <= now()  
 					                  ORDER BY num_doc_fen DESC 
 					                  LIMIT 1)
 			      AND item = 2)
 		ELSE 
 				(SELECT valor_unitario  
 				 FROM con.factura_detalle 
 				 WHERE documento IN (select DOCUMENTO  
 				                     from con.factura 
 				                     where negasoc=neg.cod_neg 
 				                       AND num_doc_fen = '1') 
 				   AND item = 2)	
 	    END AS Interes, 
      (nro_docs::numeric*dna.valor) as vlr_documentos
FROM negocios neg
INNER JOIN solicitud_aval s ON (s.cod_neg = neg.cod_neg)
INNER JOIN documentos_neg_aceptado dna ON dna.cod_neg = neg.cod_neg AND item = 1
LEFT JOIN filtro_libranza filt ON (filt.numero_solicitud = s.numero_solicitud)
LEFT JOIN configuracion_libranza conf ON (conf.id = filt.id_configuracion_libranza)
LEFT JOIN (SELECT numero_solicitud, count(valor_comprar) as cant_cheques, sum(valor_comprar) as valor_comprar 
			FROM solicitud_obligaciones_comprar WHERE valor_comprar > 0 GROUP BY numero_solicitud) t
			ON (t.numero_solicitud = s.numero_solicitud)
WHERE neg.cod_neg ilike 'LB%' and 
      neg.creation_date::date BETWEEN '2018-01-01'::date AND now()::date  AND 
      neg.estado_neg in('T','V') AND 
      actividad not in('DEC') 
ORDER BY neg.cod_neg;

