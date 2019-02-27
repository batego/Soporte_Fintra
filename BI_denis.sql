select 
	   c.cedula, 
	   nombre_cliente, 
	   c.direccion,  
	   coalesce(n.barrio,'') as barrio, 
	   ciu.coddpt as coddpto, 
	   --ciu.ciudad as codciu, 
	   (select nomciu from ciudad where codciu=c.ciudad) AS ciudad, 
	   c.telefono, 
	   telcontacto, 
	   negocio, 
	   vencimiento_mayor,
	   dia_pago, 
	   --c.id_convenio, 
	   --c.pagaduria, 
	   --sum(valor_asignado) as valor_asignado, 	   
	   round(sum(debido_cobrar)) as debido_cobrar, 
	   --sum(recaudosxcuota_fiducia) as recaudosxcuota_fiducia, 
	   --sum(recaudosxcuota_fenalco) as recaudosxcuota_fenalco, 
	   --sum(recaudosxcuota) as recaudosxcuota, 
	   case when sum(debido_cobrar) != 0 then ((sum(recaudosxcuota)/sum(valor_asignado))*100)::numeric(9,2) else 0 end as cumplimiento, 
	   --c.agente, 
	   --agente_campo,
       coalesce((select valor_a_pagar from con.compromiso_pago_cartera where negocio = c.negocio  order by fecha_a_pagar desc limit 1),0)AS valor_a_pagar,
       (select max(fecha_a_pagar) from con.compromiso_pago_cartera where negocio = c.negocio)     AS fecha_ult_compromiso,
       --CASE WHEN EXISTS(SELECT 1 FROM rel_negocios_reestructuracion WHERE negocio_reestructuracion = c.negocio) THEN 'S' ELSE 'N' END AS reestructuracion,
       --CASE WHEN(neg.etapa_proc_ejec not in('','0')) THEN 'S' ELSE 'N' END AS juridica,
       sp.identificacion AS cedula_codeudor, sp.nombre AS nombre_codeudor, sp.direccion AS direccion_cod, sp.barrio AS barrio_cod, ciud.nomciu AS ciudad_cod, 
       sp.telefono AS telefono_cod, sp.celular AS celular_cod,
       sr.nombre AS nombre_ref_fam, sr.direccion AS  direccion_ref_fam, sr.ciudad AS ciudad_ref_fam, sr.telefono1 AS telefono_ref_fam, sr.celular AS celular_ref_fam,
       srp.nombre AS nombre_ref_per, srp.direccion AS  direccion_ref_per, srp.ciudad AS ciudad_ref_per, srp.telefono1 AS telefono_ref_per, srp.celular AS celular_ref_per
  from (
	    select * 
	    from SP_SeguimientoCarteraGeotech(201901,'1','BTERRAZA') as coco(cedula varchar, nombre_cliente varchar, direccion varchar, ciudad varchar, telefono varchar, telcontacto varchar, negocio varchar, id_convenio varchar, pagaduria varchar, cuota varchar, valor_asignado numeric, fecha_vencimiento date, periodo_vcto numeric, vencimiento_mayor varchar, dias_vencidos numeric, dia_pago numeric, status varchar, status_vencimiento varchar, debido_cobrar numeric, recaudosxcuota_fiducia numeric, recaudosxcuota_fenalco numeric, recaudosxcuota numeric, agente varchar, agente_campo varchar)
	    where status in ('','A Vencer','Vencido') 
    	) c
    LEFT JOIN ciudad ciu ON ciu.codciu = c.ciudad
    LEFT JOIN nit n ON n.cedula = c.cedula
    LEFT JOIN negocios neg on neg.cod_neg = c.negocio
    LEFT JOIN solicitud_aval sa ON (sa.cod_neg = neg.cod_neg)
    LEFT JOIN solicitud_persona sp ON (sp.numero_solicitud = sa.numero_solicitud AND sp.tipo = 'C')
    LEFT JOIN ciudad ciud ON (ciud.codciu = sp.ciudad)
    LEFT JOIN solicitud_referencias sr ON (sr.numero_solicitud = sa.numero_solicitud AND sr.tipo_referencia = 'F' AND sr.secuencia = '1' AND sr.tipo = 'S')
    LEFT JOIN solicitud_referencias srp ON (srp.numero_solicitud = sa.numero_solicitud AND srp.tipo_referencia = 'P' AND srp.secuencia = '1' AND srp.tipo = 'S')
    group by dia_pago, c.cedula, nombre_cliente, c.direccion, n.barrio,ciu.coddpt, c.ciudad, c.telefono, telcontacto, negocio, c.id_convenio, pagaduria, vencimiento_mayor, c.agente, agente_campo, etapa_proc_ejec,
    sp.identificacion , sp.nombre , sp.direccion , sp.barrio , ciud.nomciu , sp.telefono , sp.celular, 
    sr.nombre , sr.direccion , sr.ciudad , sr.telefono1, sr.celular,
    srp.nombre , srp.direccion , srp.ciudad , srp.telefono1, srp.celular
    having  vencimiento_mayor in ('6- ENTRE 121 Y 180','7- ENTRE 180 Y 360','8- MAYOR A 1 ANIO') AND ciu.coddpt IN ('ATL','COR')
    order by cumplimiento DESC;
   
  