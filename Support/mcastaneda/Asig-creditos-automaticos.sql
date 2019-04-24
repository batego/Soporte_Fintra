select nah.cod_neg,
       nah.analista,
       to_char(nah.creation_date,'YYYY-MM-DD HH24:MI:SS') as fecha_asignacion,
       nah.creation_date::date as fch_asignacion,
       to_char(nah.creation_date,'HH24:MI:SS') as hora_asignacion,
       r.descripcion as rol,
       p.descripcion as perfil,
       p.monto_minimo,
       p.monto_maximo,
       p.cant_max_cred as cantidad_maxima_por_dia,
       ppu.monto_minimo_decision as monto_minimo_decision,
       ppu.monto_decision as monto_maximo_decision,
       (select
             CASE WHEN count(*)=1 THEN 'No'
                  WHEN count(*)>1 THEN 'Si'
              end as regasig
        from negocios_analista_hist snah 
        where snah.cod_neg=nah.cod_neg) as reasignado,
        get_est(n.estado_neg) as estado_neg,
        conv.agencia,
        n.fecha_negocio::date,
        n.vr_negocio,
        case
             when (n.actividad = 'LIQ') then 'RADICACION'
             when (n.actividad = 'RAD') then 'REFERENCIACION'
             when (n.actividad = 'REF') then 'ANALISIS'
             when (n.actividad = 'ANA') then 'DECISION'
             when (n.actividad = 'DEC') then 'FORMALIZACION'
             when (n.actividad = 'PFCC') then 'PERFECCION LIBRANZA'
             when (n.actividad = 'FOR') then 'TRANSFERENCIA'
             when (n.actividad = 'DES') then 'NEGOCIO DESEMBOLSADO'
             when (n.actividad = 'STBY') then 'STAND BY'
        END AS etapa_fabrica,
		coalesce (tu.dato,'')as causal,
		TZ.actividad
from negocios_analista_hist nah
join rol_analista ra on ra.analista=nah.analista
join roles r on r.id=ra.idRol
join perfries_por_usuarios ppu on ppu.idUsuario= nah.analista
join perfiles_riesgos p on p.id=nah.idPerfil
join negocios n on n.cod_neg=nah.cod_neg and n.analista_asignado=nah.analista
INNER JOIN convenios conv on(conv.id_convenio=n.id_convenio)
inner JOIN solicitud_aval sa on (sa.cod_neg=n.cod_neg)
left join  apicredit.pre_solicitudes_creditos pre on pre.numero_solicitud=sa.numero_solicitud
LEFT JOIN (select cod_neg, max(fecha) as mifecha ,causal
		    from negocios_trazabilidad 
		    where concepto='RECHAZAD' 
		    group by cod_neg,causal) traza on (n.cod_neg = traza.cod_neg)
LEFT JOIN tablagen tu ON (tu.table_type='CAUSACONCP' AND referencia = 'RECHAZAD' and traza.causal=tu.table_code)
INNER JOIN negocios_trazabilidad TZ ON (N.cod_neg = TZ.cod_neg AND TZ.ACTIVIDAD = 'DEC');


select  to_char(FECHA,'YYYY-MM-DD') AS fecha,
		to_char(fecha, 'HH24:mm') AS Hora,
	   CASE WHEN actividad = 'ANA' THEN 'ANALISIS'
			WHEN actividad = 'LIQ' THEN 'LIQUIDACION'
	        WHEN ACTIVIDAD = 'RAD' THEN 'RADICACION'
	        WHEN ACTIVIDAD = 'DEC' THEN 'DECISION'
	        WHEN ACTIVIDAD = 'STBY' THEN 'STAND BY'
			WHEN ACTIVIDAD = 'REF' THEN 'REFERECIACION'
			WHEN actividad = 'FOR' THEN 'FORAMLIZACION'
			WHEN actividad = 'DES' THEN 'DESEMBOLSO'
			WHEN actividad = 'PFCC' THEN 'PERFECCIONAMIENTO'			
	   END AS ACTIVIDAD, 
	   cod_neg,
	   tg.dato as motivo_stby,
	   nt.comentarios
from negocios_trazabilidad nt
LEFT JOIN tablagen tg ON (tg.table_code = nt.causal AND tg.table_type = 'CAUSASTBY')
where cod_neg IN (select N.cod_neg					       
					from negocios_analista_hist nah
					join rol_analista ra on ra.analista=nah.analista
					join roles r on r.id=ra.idRol
					join perfries_por_usuarios ppu on ppu.idUsuario= nah.analista
					join perfiles_riesgos p on p.id=nah.idPerfil
					join negocios n on n.cod_neg=nah.cod_neg and n.analista_asignado=nah.analista
					INNER JOIN convenios conv on(conv.id_convenio=n.id_convenio)
					inner JOIN solicitud_aval sa on (sa.cod_neg=n.cod_neg)
					left join  apicredit.pre_solicitudes_creditos pre on pre.numero_solicitud=sa.numero_solicitud
					LEFT JOIN (select cod_neg, max(fecha) as mifecha ,causal
							    from negocios_trazabilidad 
							    where concepto='RECHAZAD' 
							    group by cod_neg,causal) traza on (n.cod_neg = traza.cod_neg)
					LEFT JOIN tablagen tu ON (tu.table_type='CAUSACONCP' AND referencia = 'RECHAZAD' and traza.causal=tu.table_code)
					INNER JOIN negocios_trazabilidad TZ ON (N.cod_neg = TZ.cod_neg AND TZ.ACTIVIDAD = 'DEC'))
ORDER BY cod_neg, fecha;	



select * from solicitud_aval where cod_neg='FE04596';
SELECT * FROM negocios_trazabilidad WHERE  numero_solicitud = '146400';
select * from tablagen where table_type ILIKE '%CAUSASTBY%';

