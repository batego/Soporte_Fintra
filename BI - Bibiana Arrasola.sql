SELECT 
	entidad,
	numero_solicitud,
	cod_neg,
	identificacion,
	nombre_cliente,
	celular,
	email,
	afiliado,
	estado_inicial_solicitud,
	estado_solicitud,
	estado_negocio, 
	causal ,
	asesor,
	id_convenio,
	monto_credito,
	valor_cuota,
	numero_cuotas,
	score,
	score_lisim,
	score_total,
	total_obligaciones_financieras,
	total_gastos_familiares,
	total_ingresos,
	round((((total_obligaciones_financieras+total_gastos_familiares+valor_cuota)/case when total_ingresos = 0 then 1 else total_ingresos end)*100),2) as endeudamiento,
	comentario,
	cuotas_pendientes,
	etapa,
	medio,
	fecha_presolicitud,
	rechazo_operaciones as Estado_operacion,
	periodo,
	tipo_cliente,
	clasificacion_actual,
	lat,
	lng,
	ciudad,
	departamento
FROM (
	SELECT 
	CASE WHEN pre.rechazo_operaciones = 'R' AND nt.estado= 'RECHAZADO COMERCIAL' THEN 'Rechazado Comercial'
			WHEN pre.rechazo_operaciones = 'R' AND nt.estado= 'RECHAZADO OPERACIONES' THEN 'Rechazado Operaciones'
                        WHEN pre.rechazo_operaciones = 'S' THEN 'Stand By' ELSE '' END as rechazo_operaciones,
		
	CASE WHEN (pre.entidad) = 'FENALCO_ATL' then 'FENALCO ATLANTICO'
	WHEN (pre.entidad) = 'FENALCO_BOL' then 'FENALCO BOLIVAR'
	WHEN (pre.entidad) = 'MICROCREDITO' then 'MICROCREDITO'
	ELSE 'NO REGISTRA' END AS entidad,
	pre.numero_solicitud,
	coalesce (sa.cod_neg,'') as cod_neg,
	pre.identificacion,
	upper(pre.primer_nombre||' '||pre.primer_apellido) as nombre_cliente,
	coalesce (pre.telefono,'') as celular,
	pre.email,
	get_nombp( pre.afiliado) AS afiliado,
	CASE WHEN pre.estado_sol='P' THEN 'PRE APROBADO' 
	WHEN pre.estado_sol='R' THEN 'RECHAZADO' 
	WHEN pre.estado_sol='Z' THEN 'ZONA GRIS' 
	WHEN pre.estado_sol='B' THEN 'ERROR CALCULO BURO' 
	WHEN pre.estado_sol='S' THEN 'MONTO SUGERIDO' 
	WHEN pre.estado_sol='C' THEN 'NO COMPLETADO' 
	END AS estado_inicial_solicitud,
	CASE WHEN sa.estado_sol='R' THEN 'RECHAZADO'
	WHEN sa.estado_sol='P' THEN 'ACEPTADO'
	WHEN sa.estado_sol='V' THEN 'AVALADO'
	WHEN sa.estado_sol='A' THEN 'APROBADO'
	WHEN sa.estado_sol='T' THEN 'TRANSFERIDO'
	WHEN sa.estado_sol='D' THEN 'DESISTIDO'
	WHEN sa.estado_sol IS NULL THEN ''
	END AS estado_solicitud,
	CASE WHEN neg.estado_neg='R' THEN 'RECHAZADO EN FABRICA'
	WHEN neg.estado_neg='P' THEN 'ACEPTADO'
	WHEN neg.estado_neg='V' THEN 'AVALADO'
	WHEN neg.estado_neg='A' THEN 'APROBADO'
	WHEN neg.estado_neg='T' THEN 'TRANSFERIDO'
	WHEN neg.estado_neg='D' THEN 'DESISTIDO'
	WHEN pre.estado_sol='R' AND  neg.estado_neg IS NULL THEN 'RECHAZO 1ERA ETAPA' 
	WHEN pre.estado_sol='C' AND  neg.estado_neg IS NULL THEN 'NO COMPLETADO' 
	WHEN pre.estado_sol='B' AND  neg.estado_neg IS NULL THEN 'ERROR' 
	WHEN pre.estado_sol='P' AND  neg.estado_neg IS NULL THEN 'PREAPROBADO 1ERA ETAPA'
	WHEN pre.estado_sol='S' AND  neg.estado_neg IS NULL THEN 'SUGERIDO 1ERA ETAPA'
	WHEN pre.estado_sol='Z' AND  neg.estado_neg IS NULL THEN 'ZONA GRIS 1ERA ETAPA'
	WHEN neg.estado_neg IS NULL THEN ''
	END AS estado_negocio, 
	coalesce (tu.dato,'')as causal ,
	pre.asesor,
	pre.id_convenio,
	pre.monto_credito,
	pre.valor_cuota,
	pre.numero_cuotas,
	pre.score,
	coalesce (sa.score_lisim,'') as score_lisim,
	coalesce (sa.score_total,'') as score_total,
	pre.total_obligaciones_financieras,
	pre.total_gastos_familiares,
	pre.ingresos_usuario AS total_ingresos,
	round((((pre.total_obligaciones_financieras+pre.total_gastos_familiares+pre.valor_cuota)/case when tipo_cliente = ''then 1 else pre.ingresos_usuario end)*100),2) as endeudamiento,
	pre.comentario,
	coalesce (sa.cuotas_pendientes,'') as cuotas_pendientes,
	CASE WHEN pre.etapa = 0 THEN 'SIN FORMULARIO'
	WHEN pre.etapa = 1 OR pre.etapa = 2 then 'FORMULARIO INGRESADO'
	WHEN pre.etapa = 3 THEN 'RADICADO'
	WHEN pre.etapa = 4 THEN 'REFERENCIADO'
	WHEN pre.etapa = 5 THEN 'ANALISIS'
	WHEN pre.etapa = 6 THEN 'DECISION'
	WHEN pre.etapa = 7 THEN 'FORMALIZACION'
	WHEN pre.etapa = 8 THEN 'DESEMBOLSO'
	WHEN pre.etapa =-1 THEN 'RECHAZADO EN FABRICA'
	END AS etapa,
	CASE WHEN pre.asesor ='' THEN 'INGRESADO POR EL CLIENTE'
	WHEN pre.asesor !='' THEN 'INGRESADO POR EL ASESOR'
	END AS medio,
	pre.creation_date::date as fecha_presolicitud,
	replace(substring(pre.creation_date,1,7),'-','') as periodo,
	COALESCE((SELECT clasificacion 
	     FROM administrativo.clasificacion_clientes_fintracredit  
	     WHERE cedula_deudor=pre.identificacion AND periodo <=replace(substring(pre.creation_date,1,7),'-','')
	     AND id_convenio IN (17,31) ORDER BY periodo::INTEGER DESC LIMIT 1),'SIN_CLASIFICAR') AS tipo_cliente,
	COALESCE((SELECT clasificacion  FROM administrativo.clasificacion_clientes_fintracredit 
			WHERE cedula_deudor=pre.identificacion AND periodo >=replace(substring(current_date,1,7),'-','')
		   AND id_convenio IN (17,31) ORDER BY periodo::INTEGER DESC LIMIT 1),'SIN_CLASIFICAR') AS clasificacion_actual,
        pre.lat,
        pre.lng,
        c.nomciu as ciudad,
        c.coddpt as departamento	     
	FROM apicredit.pre_solicitudes_creditos  pre
	LEFT JOIN solicitud_aval sa on (sa.numero_solicitud=pre.numero_solicitud)
	LEFT JOIN solicitud_persona sp on (pre.numero_solicitud = sp.numero_solicitud and tipo ='S' )
	LEFT JOIN negocios neg on (neg.cod_neg=sa.cod_neg)
	LEFT JOIN ciudad c on (c.codciu=pre.ciudad) 
	INNER JOIN rel_unidadnegocio_convenios unicon on ( pre.id_convenio = unicon.id_convenio)
	INNER JOIN unidad_negocio unineg on (unicon.id_unid_negocio = unineg.id )
	LEFT JOIN (select cod_neg, max(fecha) as mifecha ,causal
		    from negocios_trazabilidad 
		    where concepto='RECHAZAD' 
		    group by cod_neg,causal) traza on (neg.cod_neg = traza.cod_neg)
	LEFT JOIN tablagen tu ON (tu.table_type='CAUSACONCP' AND referencia = 'RECHAZAD' and traza.causal=tu.table_code) 
	 LEFT JOIN (SELECT trazap.numero_solicitud,estado, usuario, fecha ,comentarios,trazap.causal  FROM apicredit.pre_solicitudes_trazabilidad as trazap
	inner join  (select numero_solicitud, max(fecha) as mifecha 
					from apicredit.pre_solicitudes_trazabilidad 
					group by numero_solicitud) t on (t.numero_solicitud=trazap.numero_solicitud and t.mifecha=trazap.fecha)) nt ON nt.numero_solicitud = pre.numero_solicitud
					
	WHERE 1=1 AND pre.creation_date::date between '2016-06-01'::DATE AND now()::DATE 	 
	GROUP BY pre.numero_solicitud,sa.cod_neg,pre.identificacion,  pre.id_convenio,pre.monto_credito,
	pre.valor_cuota, pre.numero_cuotas,pre.score,sa.score_lisim,sa.score_total, pre.total_obligaciones_financieras,
	pre.total_gastos_familiares,pre.ingresos_usuario,sa.cuotas_pendientes,  pre.asesor,pre.creation_date,pre.entidad,
	pre.primer_nombre,pre.primer_apellido,pre.afiliado,pre.estado_sol,sa.estado_sol,neg.estado_neg,pre.comentario,
	pre.etapa,tu.dato,sp.celular,pre.email,pre.telefono,pre.tipo_cliente,pre.lat,pre.lng,c.nomciu,c.coddpt,  pre.rechazo_operaciones, nt.estado	
)temporal
