SELECT 
      --periodo, 
      --s.numero_solicitud,
      neg.cod_neg as negocio, 
      --CASE WHEN conf.nombre_convenio_pagaduria = '' THEN p.payment_name ELSE conf.nombre_convenio_pagaduria END AS convenio, 
      COALESCE(conf.nombre_convenio_pagaduria,p.payment_name) AS convenio,
      cod_cli as cedula, 
      get_nombc(cod_cli) AS cliente, 
      nro_docs AS plazo,
      vr_negocio as vlr_credito,
      coalesce(valor_comprar,0) AS vlr_compra_cartera,
      coalesce(round(dna.valor),0.00)  AS vlr_cuota,
      (nro_docs::numeric*dna.valor) as vlr_total_a_pagar, 
      observaciones,
      f_desem as fecha_desembolso,
      vr_negocio - coalesce(valor_comprar,0) - (round(vr_negocio*3.5/100) + (32000*coalesce(cant_cheques,0)) + round(coalesce(valor_comprar,0)*4/1000) + CASE WHEN vr_negocio BETWEEN 0 AND 5000000 THEN 80000 ELSE 100000 END + 10000) AS desembolso_titular,
      sum(valor_saldo) as saldo
FROM negocios neg
INNER JOIN solicitud_aval s ON (s.cod_neg = neg.cod_neg)
INNER JOIN documentos_neg_aceptado dna ON dna.cod_neg = neg.cod_neg AND item = 1
LEFT JOIN filtro_libranza filt ON (filt.numero_solicitud = s.numero_solicitud)
LEFT JOIN configuracion_libranza conf ON (conf.id = filt.id_configuracion_libranza)
LEFT JOIN (SELECT numero_solicitud, count(valor_comprar) as cant_cheques, sum(valor_comprar) as valor_comprar 
FROM solicitud_obligaciones_comprar WHERE valor_comprar > 0 GROUP BY numero_solicitud) t
ON (t.numero_solicitud = s.numero_solicitud)
LEFT JOIN proveedor p ON (p.nit=s.afiliado)
INNER JOIN con.factura f ON (f.negasoc=neg.cod_neg)
WHERE neg.cod_neg ilike 'LB%' AND neg.estado_neg in('T','V','L') AND actividad not in('DEC') --and conf.nombre_convenio_pagaduria ilike '%'||?||'%' 
group by neg.cod_neg, convenio, cedula, cliente, nro_docs, vlr_credito, valor_comprar,dna.valor,observaciones,neg.f_desem,t.cant_cheques
order by neg.cod_neg