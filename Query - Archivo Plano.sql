SELECT 
            REPLACE(replace(list(uno||dos||tres||cuatro||cinco||seis||siete||ocho||nueve||diez||e'\n;_;'),';_; ',''),';_;','') AS archivo
            FROM
            (
            SELECT

       --     <!--columna uno -->
            (c.tipo_identificacion || 
            OVERLAY('00000000000' PLACING c.identificacion FROM 12 - char_length(c.identificacion) FOR char_length(c.identificacion)) ||
            OVERLAY('000000000000000000' PLACING c.negocio FROM 19 - char_length(c.negocio) FOR char_length(c.negocio))) AS uno,

          ----  <!--columna dos -->
            (OVERLAY('000000000000000000000000000000000000000000000' PLACING c.nombre FROM 46 - char_length(c.nombre) FOR char_length(c.nombre)) ||
            c.situacion_titular || REPLACE(SUBSTRING(c.fecha_apertura,1,10),'-','') || REPLACE(SUBSTRING(c.fecha_vencimiento,1,10),'-','') ||
            CASE WHEN c.tipo='S' THEN '005000000000101'
            WHEN c.tipo='C' THEN '015000000000101'
            WHEN c.tipo='E' THEN '015000000000101'
            END ) AS dos,

       --     <!--columna tres --> 
            (c.novedad || '0' || REPLACE(SUBSTRING(c.fecha_apertura,1,10),'-','') || 
            (CASE WHEN c.dias_mora <= 31 THEN '01' ELSE '02' END) || REPLACE(fecha_corte_proceso,'-','')||'00000000000000000000                              12  000') as tres,

      --      <!--columna cuatro -->   
            (CASE WHEN c.dias_mora > 999 THEN   
		    OVERLAY('000' PLACING 999 FROM 4 - char_length(999) FOR char_length(999))  
		ELSE 
		    OVERLAY('000' PLACING c.dias_mora FROM 4 - char_length(c.dias_mora) FOR char_length(c.dias_mora))
		END ||
		    OVERLAY('00000000000' PLACING c.desembolso::numeric(11,0) FROM 12 - char_length(c.desembolso::numeric(11,0)) FOR char_length(c.desembolso::numeric(11,0))) ||
		    OVERLAY('00000000000' PLACING c.saldo_deuda::numeric(11,0) FROM 12 - char_length(c.saldo_deuda::numeric(11,0)) FOR char_length(c.saldo_deuda::numeric(11,0))) || '00000000000' ||
		    OVERLAY('00000000000' PLACING c.cuota_mensual::numeric(11,0) FROM 12 - char_length(c.cuota_mensual::numeric(11,0)) FOR char_length(c.cuota_mensual::numeric(11,0))) ||
		    OVERLAY('00000000000' PLACING c.saldo_en_mora::numeric(11,0) FROM 12 - char_length(c.saldo_en_mora::numeric(11,0)) FOR char_length(c.saldo_en_mora::numeric(11,0))) ||
		    OVERLAY('000' PLACING c.numero_cuotas FROM 4 - char_length(c.numero_cuotas) FOR char_length(c.numero_cuotas))
		    ) AS cuatro,
 
     --       <!--columna cinco -->	
            (OVERLAY('000' PLACING c.cuotas_canceladas FROM 4 - char_length(c.cuotas_canceladas) FOR char_length(c.cuotas_canceladas)) ||
            OVERLAY('000' PLACING c.cuotas_en_mora FROM 4 - char_length(c.cuotas_en_mora) FOR char_length(c.cuotas_en_mora)) || 
            '00000000000'||(case when c.fecha_limite_pago = '0099-01-01' then REPLACE(SUBSTRING(c.fecha_limite_pago,1,10),'-','') else '00000000' end)||(case when c.ultimo_pago = '0099-01-01' then REPLACE(SUBSTRING(c.ultimo_pago,1,10),'-','') else '00000000' end) ||
            OVERLAY('000000000000000000000000000000' PLACING 'FINTRA PRINCIPAL' FROM 31 - char_length('FINTRA PRINCIPAL') FOR char_length('FINTRA PRINCIPAL')) 
            ) AS cinco,

    --        <!--columna seis -->
            (OVERLAY('00000000000000000000' PLACING c.ciudad_radicacion FROM 21 - char_length(c.ciudad_radicacion) FOR char_length(c.ciudad_radicacion)) ||
            OVERLAY('00000000' PLACING  c.cod_dane_radicacion FROM 9 - char_length(c.cod_dane_radicacion) FOR char_length(c.cod_dane_radicacion)) ||
            OVERLAY('00000000000000000000' PLACING c.ciudad_residencia FROM 21 - char_length(c.ciudad_residencia) FOR char_length(c.ciudad_residencia))
            ) AS seis,

    --        <!--columna siete -->
            (OVERLAY('00000000' PLACING c.cod_dane_residencia FROM 9 - char_length(c.cod_dane_residencia) FOR char_length(c.cod_dane_residencia)) ||
            OVERLAY('00000000000000000000' PLACING c.departamento_residencia FROM 21 - char_length(c.departamento_residencia) FOR char_length(c.departamento_residencia)) ||
            OVERLAY('000000000000000000000000000000000000000000000000000000000000' PLACING c.direccion_residencia FROM 61 - char_length(c.direccion_residencia) FOR char_length(c.direccion_residencia)) ||
            OVERLAY('000000000000' PLACING c.telefono_residencia FROM 13 - char_length(c.telefono_residencia) FOR char_length(c.telefono_residencia))
            ) AS siete,

     --       <!--columna ocho --> 
            (OVERLAY('00000000000000000000' PLACING c.ciudad_laboral FROM 21 - char_length(c.ciudad_laboral) FOR char_length(c.ciudad_laboral)) ||
            OVERLAY('00000000' PLACING c.cod_dane_laboral FROM 9 - char_length(c.cod_dane_laboral) FOR char_length(c.cod_dane_laboral)) ||
            OVERLAY('00000000000000000000' PLACING c.departamento_laboral FROM 21 - char_length(c.departamento_laboral) FOR char_length(c.departamento_laboral)) ||
            OVERLAY('000000000000000000000000000000000000000000000000000000000000' PLACING c.direccion_laboral FROM 61 - char_length(c.direccion_laboral) FOR char_length(c.direccion_laboral)) ||
            OVERLAY('000000000000' PLACING c.telefono_laboral FROM 13 - char_length(c.telefono_laboral) FOR char_length(c.telefono_laboral))
            ) AS ocho,
  
    --        <!--columna nueve -->
            (OVERLAY('00000000000000000000' PLACING c.ciudad_correspondencia FROM 21 - char_length(c.ciudad_correspondencia) FOR char_length(c.ciudad_correspondencia)) ||
            OVERLAY('00000000' PLACING c.cod_dane_correspondencia FROM 9 - char_length(c.cod_dane_correspondencia) FOR char_length(c.cod_dane_correspondencia)) ||
            OVERLAY('00000000000000000000' PLACING c.departamento_residencia FROM 21 - char_length(c.departamento_residencia) FOR char_length(c.departamento_residencia)) ||
            OVERLAY('000000000000000000000000000000000000000000000000000000000000' PLACING c.direccion_correspondencia::varchar(59) FROM 61 - char_length(c.direccion_correspondencia::varchar(59)) FOR char_length(c.direccion_correspondencia::varchar(59))) || 
            OVERLAY('                                                            ' PLACING c.correo_electronico FROM 61 - char_length(c.correo_electronico) FOR char_length(c.correo_electronico))
            ) AS nueve,

    --        <!--columna diez-->
            (OVERLAY('000000000000' PLACING c.celular_solicitante FROM 13 - char_length(c.celular_solicitante) FOR char_length(c.celular_solicitante)) ||
            '490032                                     ') as diez
  
            FROM(
            select distinct coco.tipo_identificacion,coco.identificacion,coco.negocio,coco.nombre,coco.situacion_titular,coco.fecha_apertura,coco.fecha_vencimiento,coco.fecha_corte_proceso,coco.dias_mora,coco.novedad,coco.min_dias_mora,coco.desembolso,coco.saldo_deuda,coco.saldo_en_mora,coco.cuota_mensual,coco.numero_cuotas,coco.cuotas_canceladas,coco.cuotas_en_mora,
            coco.fecha_limite_pago,coco.ultimo_pago,coco.ciudad_radicacion,coco.cod_dane_radicacion,coco.ciudad_residencia,coco.cod_dane_residencia,coco.departamento_residencia,coco.direccion_residencia,coco.telefono_residencia,coco.ciudad_laboral,coco.cod_dane_laboral,coco.departamento_laboral,coco.direccion_laboral,coco.telefono_laboral,coco.ciudad_correspondencia,
            coco.cod_dane_correspondencia,coco.direccion_correspondencia,coco.correo_electronico,coco.celular_solicitante,coco.tipo
            from dv_ReporteDataCredito('2018-12-31'::date, '201812', '16', -3000, 3000, 'Visualizar') as coco (nit varchar, tipo_identificacion varchar, identificacion varchar, negocio varchar, nombre varchar, situacion_titular varchar, fecha_apertura varchar, fecha_vencimiento varchar, fecha_corte_proceso date, dias_mora numeric, novedad varchar, min_dias_mora numeric, desembolso varchar, saldo_deuda numeric, saldo_en_mora numeric, cuota_mensual varchar, numero_cuotas varchar, cuotas_canceladas numeric, cuotas_en_mora numeric, fecha_limite_pago date, ultimo_pago date, ciudad_radicacion varchar, cod_dane_radicacion varchar, ciudad_residencia varchar, cod_dane_residencia varchar,      departamento_residencia varchar, direccion_residencia varchar, telefono_residencia varchar, ciudad_laboral varchar, cod_dane_laboral varchar, departamento_laboral varchar, direccion_laboral varchar, telefono_laboral varchar, ciudad_correspondencia varchar, cod_dane_correspondencia varchar, direccion_correspondencia varchar, correo_electronico varchar, celular_solicitante varchar, tipo varchar) 
	        )as c
              inner join cr_obligaciones_areportar_criesgo cr on cr.negocio_reportado=c.negocio and cr.identificacion=c.identificacion and cr.periodo_lote = '201812' and cr.reg_status !='A' and cr.reportado='N'  
            ) as foo