--select * from consultas where descripcion ILIKE '%Opav_Ingresado_en_Open II %';
-- TPR00006: Especiales
-- TPR00008: Tableros
--'' NO estan clasificados 


SELECT *
FROM (

SELECT	o.num_os,
	fac.creation_date as fecha_clic_open,
	so.fecha_financiacion,
	so,fecha_inicio_pago as fecha_posible_pago,
	so.nic,
	so.id_cliente,
	cl.nomcli AS client,
	cl.tipo AS tipo_client,
	cont.descripcion,
	--CASE WHEN (se.id_cliente_padre=so.id_cliente) THEN '' ELSE se.id_cliente_padre END AS id_cliente_padre,
	--CASE WHEN (se.id_cliente_padre=so.id_cliente) THEN '' ELSE pad.nombre END AS nombre_padre,
	se.id_cliente_padre,
	pad.nomcli  AS nombre_padre,

	ROUND(acc.material*(so.porcentaje_base/100),2) AS materialx,
	ROUND(acc.mano_obra*(so.porcentaje_base/100),2) AS mano_obrax,
	ROUND(acc.administracion*(so.porcentaje_base/100),2) AS administracionx,
	ROUND(acc.imprevisto*(so.porcentaje_base/100),2) AS imprevistox,
	ROUND(acc.utilidad*(so.porcentaje_base/100),2) AS utilidadx,
	ROUND(acc.transporte*(so.porcentaje_base/100),2) AS  otrosx,
	ROUND((acc.material+acc.mano_obra+acc.administracion+acc.imprevisto+acc.utilidad+acc.transporte)*(so.porcentaje_base/100),2) AS costo_contratistax,

	ROUND(
	CASE WHEN acc.utilidad=0 THEN 
		ROUND(((acc.material+acc.mano_obra+acc.administracion+acc.imprevisto+acc.utilidad+acc.transporte)*0.16) ,0)
	ELSE
		ROUND((acc.utilidad*0.16),0)
	END  *(so.porcentaje_base/100),2) AS iva_contratistax,

	ROUND(
	CASE WHEN acc.utilidad=0 THEN 
		ROUND(((acc.material+acc.mano_obra+acc.administracion+acc.imprevisto+acc.utilidad+acc.transporte)*0.16) ,0)+(acc.material+acc.mano_obra+acc.administracion+acc.imprevisto+acc.utilidad+acc.transporte)
	ELSE
		ROUND((acc.utilidad*0.16),0)+(acc.material+acc.mano_obra+acc.administracion+acc.imprevisto+acc.utilidad+acc.transporte)
	END *(so.porcentaje_base/100),2) AS 	valor_contratistax,
        
	
	ROUND(acc.financiar_sin_iva*(so.porcentaje_base/100),2) AS  subtotal_sin_ivax,
	
	-- jpineedo
	
	ROUND(acc.financiar_sin_iva *so.porcentaje_extemporaneo,2)  As valor_extem,


	
	ROUND(acc.financiar_con_iva *(so.porcentaje_base/100),2) AS valor_solicitudx,  

        ROUND(acc.financiar_con_iva *(so.porcentaje_base/100),2) +    ROUND(acc.financiar_con_iva *so.porcentaje_extemporaneo,2)      AS valor_solicitud_extemporaneo, 
	
	--(acc.financiar_sin_iva  +     (ROUND(acc.financiar_sin_iva *so.porcentaje_extemporaneo,2) ) * (so.porcentaje_base/100) )    as solicitud_extemporaneo, --jpinedo
	--nacc.cantidad_acciones_pago,
	ROUND((ROUND(so.val_a_financiar,2)/nacc.cantidad_acciones_pago),2) AS  val_a_financiarw,--1012
	
	so.id_solicitud,
	so.simbolo_variable,
	so.periodo,
	
	(ROUND(so.val_con_financiacion,2)/nacc.cantidad_acciones_pago) AS val_con_financiacionw,--1012
	
	(ROUND(so.cuota_pago,2)/nacc.cantidad_acciones_pago) AS cuota_pagow,--1012
	
	so.observacion 
	,cl.sector
	,(SELECT ej.nombre FROM opav.ejecutivos ej WHERE ej.id_ejecutivo=cl.id_ejecutivo) AS ejecutivo
        ,o.tipo_solicitud
        ,cl.ciudad

        ,so.factura_cliente AS documento_cf
	,(SELECT SUBSTR(f.factura_traslado,1,7) FROM con.factura f WHERE f.documento =so.factura_cliente || '_1') AS documento_nm
	,o.consecutivo_oferta
	,SUBSTR(o.fecha_oferta,1,10) AS fecha_oferta

	,acc.factura_contratista
	,SUBSTR(acc.fecha_factura_contratista_final,1,16) AS fecha_factura_contratista_final
        ,SUBSTR(  (select fecha_documento from fin.cxp_doc cxp where cxp.documento=acc.factura_contratista and cxp.tipo_documento='FAP' limit 1)  ,1,16) AS fec_fact_conformada

	,acc.por_factoring_contratista
	,ROUND(acc.val_factoring_contratista*(so.porcentaje_base/100),2) AS val_factoring_contratista
	,acc.por_formula_contratista
	,ROUND(acc.val_formula_contratista*(so.porcentaje_base/100),2) AS val_formula_contratista
        ,acc.id_accion
        ,acc.parcial

	,so.tipo_punto,so.clase_dtf,so.punto, so.dtf_semanal,so.porcentaje_incremento, so.porcentaje_extemporaneo*100 AS porcentaje_extemporaneo,so.porcentaje_interes        

	,td.porc_opav
	, ROUND(acc.opav*(so.porcentaje_base/100),2) AS opavx
	, ROUND(acc.iva_opav*(so.porcentaje_base/100),2) AS iva_opavx
	, td.porc_fintra
	, ROUND(acc.fintra*(so.porcentaje_base/100),2) AS fintrax
	, ROUND(acc.iva_fintra*(so.porcentaje_base/100),2) AS iva_fintrax
	, td.porc_interventoria
	, ROUND(acc.interventoria*(so.porcentaje_base/100),2) AS interventoriax
	, ROUND(acc.iva_interventoria*(so.porcentaje_base/100),2) AS iva_interventoriax
	, td.porc_provintegral
	, ROUND(acc.provintegral*(so.porcentaje_base/100),2) AS provintegralx
	, ROUND(acc.iva_provintegral*(so.porcentaje_base/100),2) AS iva_provintegralx
	, td.porc_eca
	, ROUND(acc.eca*(so.porcentaje_base/100),2) AS ecax
	, ROUND(acc.iva_eca	*(so.porcentaje_base/100),2) AS iva_ecax
	, ROUND(acc.bonificacion*(so.porcentaje_base/100),2) AS bonificacionx
	, ROUND(acc.iva_bonificacion*(so.porcentaje_base/100),2) AS iva_bonificacionx
	--, td.valor_agregado		
	,so.porcentaje_base
	
	,REPLACE(acc.descripcion,'-','_') AS descripcion_accion
	
	,ROUND((SELECT SUM(fad.valor_item) FROM con.factura_detalle fad 
	  WHERE SUBSTR(fad.documento,1,7) = so.factura_cliente  AND fad.codigo_cuenta_contable ='28151007' AND fad.concepto='227'
		AND fad.reg_status!='A' )/nacc.cantidad_acciones_pago,2) AS sum_fac_interesw

	,o.esoficial AS meses_extemporaneo
	,tg.referencia AS tasa_tri	
	,(o.esoficial::numeric*tg.referencia::numeric) AS producto

	,ROUND((so.val_extemporaneo_1/nacc.cantidad_acciones_pago),2) AS val_extemporaneo_1w--1012
	,ROUND((so.val_extemporaneo_2/nacc.cantidad_acciones_pago),2) AS val_extemporaneo_2w--1012

	/*,(SELECT COUNT(a2.id_accion) 
	  FROM acciones a2 
	  WHERE a2.id_solicitud=acc.id_solicitud AND a2.parcial=acc.parcial AND a2.reg_status!='A') AS cantidad_acciones_pago*/

	,nacc.cantidad_acciones_pago

	,ROUND((so.val_cuota_inicial/nacc.cantidad_acciones_pago),2) AS val_cuota_inicialw--1012
	,so.factura_cuota_inicial
	,acc.val_ret_mano_obra_contratista As   val_rentecion_mano_obra
	,acc.val_ret_otros_contratista As val_rentecion_otros
	,acc.val_ret_aiu_contratista  As val_rentecion_aiu
	,acc.val_ret_ica_contratista As  val_rete_ica
	,acc.val_ret_iva_contratista As val_rete_iva
        ,acc.val_ret_material_contratista As val_ret_material_contratista
        ,acc.prefactura_contratista,
        o.aviso as opd,
	(select referencia from tablagen where table_type = 'ESTADO_ECA' AND table_code = acc.estado) as estado,	
	
        (select descripcion from tablagen where table_type='INTERVENTO' AND table_code = o.interventor) as interventor,
    (SELECT descripcion FROM opav.tipo_proyecto WHERE cod_proyecto = o.tipo_proyecto) AS Tipo_proyecto
	
FROM opav.subclientes_ofertas so
	inner join opav.ofertas o ON (so.id_solicitud =o.id_solicitud)
	inner join cliente cl ON (cl.codcli=so.id_cliente)
	inner join opav.acciones acc ON (acc.id_solicitud=o.id_solicitud AND acc.parcial=so.parcial AND acc.reg_status!='A')--20101108
	inner join opav.app_contratistas cont ON (cont.id_contratista=acc.contratista)
	LEFT JOIN (select 
				fac.ref1 as multiservicio,
				fac.fecha_factura,
				fac.creation_date::date,
				fac.referencia_1 as id_solicitud,
				fdet.referencia_1 as accion 
			from con.factura fac
			inner join con.factura_detalle fdet on (fac.documento=fdet.documento)
			where fac.documento like 'NM%' and fac.tipo_documento='FAC'  and fac.reg_status=''
			group by 
			fac.ref1,
			fac.fecha_factura,
			fac.creation_date::date,
			fac.referencia_1,
			fdet.referencia_1
		      ) as fac on (fac.id_solicitud =so.id_solicitud and fac.accion=acc.id_accion)	
	LEFT JOIN opav.subclientes_eca se ON  (se.id_subcliente=so.id_cliente) --20101106
	LEFT JOIN cliente pad ON  (pad.codcli=se.id_cliente_padre) --20101106
	LEFT JOIN opav.tipo_distribucion_eca td ON (td.tipo=o.tipodistribucion AND td.valor_agregado=(CASE WHEN o.noesvaloragregado='1' THEN 'N' ELSE 'S' END))

	LEFT JOIN tablagen tg ON (tg.table_type='T_TRI_ECA' AND tg.table_code=(SUBSTR(o.fecha_oferta,1,4) || SUBSTR(o.fecha_oferta,6,2)))

	LEFT JOIN (SELECT COUNT(a3.id_accion) AS cantidad_acciones_pago,a3.id_solicitud, a3.parcial 
		   FROM opav.acciones a3 
		   WHERE a3.reg_status!='A'
		   GROUP BY a3.id_solicitud, a3.parcial ) nacc ON (nacc.id_solicitud=acc.id_solicitud AND nacc.parcial=acc.parcial)
WHERE so.prefacturar='S' and acc.reg_status='' and acc.estado = '110'
 and (substring(so.fecha_financiacion,1,10)>='2018-01-01'
 and substring(so.fecha_financiacion,1,10)<= '2018-12-31')
 AND trim(o.tipodistribucion) !='43'
 AND o.num_os != ''
	--AND o.ID_SOLICITUD='903283'
	--AND num_os = 'FOMS13810-18'
ORDER BY so.fecha_factura,o.num_os--1seg--1905--2138
--LIMIT 100

) ta


--select * from ;--
--SELECT tipo_proyecto, * FROM opav.ofertas WHERE tipo_proyecto != '';