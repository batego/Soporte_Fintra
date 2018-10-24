-- Negocios para prueba Asignacion agentes de campos
-- MC07650
-- MC07650	
-- MC05997	
-- MC06239	
-- MC05775	
-- MC07435	
-- MC07283	
-- MC07379	
-- MC06478	
-- MC06461	
-- MC07126	
-- MC07342	 
-- MC07248	
-- MC06300	
-- MC05960	
-- MC05517	
-- MC08279	
-- MC07173	
-- MC07434

select count(*) from con .foto_cartera where agente = 'FSUAREZ'
-- UPDATE con.foto_cartera SET agente = 'FSUAREZ', fecha_asignacion = now(), usuario_asignacion = 'KRINCON'
WHERE reg_status != 'A'
AND dstrct = 'FINV' 
AND tipo_documento IN ('FAC','NDC')
AND substring(documento,1,2) NOT IN ('CP','FF','DF')
AND periodo_lote = '201807'
AND valor_saldo > 0
AND negasoc in ('MC07650')

select now()
select * from con.foto_cartera WHERE /*periodo_lote = replace(substring('2018-08-22'::date,1,7),'-','') and*/ negasoc in ('MC07650') and agente = 'FSUAREZ'

select c.id, negocio, cod_cli as cedula, sp.nombre, valor_a_pagar, fecha_a_pagar, c.direccion, c.barrio, c.ciudad as codciudad, ciu.nomciu as ciudad,  c.observacion, 
            t1.agente, c.creation_user as gestor
            from con.compromiso_pago_cartera c 
            INNER JOIN negocios neg ON neg.cod_neg = c.negocio
            INNER JOIN solicitud_aval s on (s.cod_neg=neg.cod_neg) AND s.reg_status='' 
            INNER JOIN solicitud_persona sp ON sp.numero_solicitud = s.numero_solicitud AND sp.reg_status='' AND sp.tipo in('S') 
            LEFT JOIN ciudad ciu ON ciu.codciu = c.ciudad 
            LEFT JOIN (select * from (select distinct negasoc, agente from con.foto_cartera WHERE periodo_lote = replace(substring('2018-08-22'::date,1,7),'-','') AND agente is not null
            AND reg_status != 'A'
            AND dstrct = 'FINV' 
            AND tipo_documento IN ('FAC','NDC')
            AND substring(documento,1,2) NOT IN ('CP','FF','DF')
            group by negasoc, agente) t) as t1 ON t1.negasoc = c.negocio where fecha_a_pagar::date between '2018-07-01' and '2018-07-31' AND c.direccion not in('')  AND  t1.agente = 'FSUAREZ';

select distinct negasoc, agente from con.foto_cartera WHERE periodo_lote = replace(substring('2018-07-22'::date,1,7),'-','') AND agente is not null
            AND reg_status != 'A'
            AND dstrct = 'FINV' 
            AND tipo_documento IN ('FAC','NDC')
            AND substring(documento,1,2) NOT IN ('CP','FF','DF')
            AND AGENTE = 'FSUAREZ'
            group by negasoc, agente                     