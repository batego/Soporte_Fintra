
select 1 as und_neg, * 
FROM sp_ver_extracto_micro_ciclo_pagos_refactor(1, '201903', 2, '2019-02-25'::date, 'Visualizar', 'BTERRAZA') 
extracto (
		vencimiento_rop date, venc_mayor varchar, id_convenio numeric, negasoc varchar, nit varchar, nom_cli varchar, 
		direccion varchar, barrio varchar, ciudad varchar, departamento varchar, 
		agencia varchar, linea_producto varchar, total_cuotas_vencidas numeric, cuotas_pendientes varchar, 
		min_dias_ven numeric, fecha_ultimo_pago date, subtotal_det numeric, total_sanciones numeric, total_dscto_det numeric, 
		total_det numeric, total_abonos numeric, observaciones varchar, msg_paguese_antes varchar, 
		msg_estado varchar, capital numeric , cat numeric, int_cte numeric, int_mora numeric, gxc numeric, 
		dscto_cap numeric, dscto_cat numeric, dscto_int_cte numeric,  dscto_int_mora numeric, 
		dscto_gxc numeric, subtotal_corriente numeric,subtotal_vencido numeric, subtotal numeric, 
		total_descuento numeric, total numeric )
 where 
 extracto.venc_mayor 
 in ('1- CORRIENTE','2- 1 A 30','3- ENTRE 31 Y 60','4- ENTRE 61 Y 90','5- ENTRE 91 Y 120','6- ENTRE 121 Y 180','7- ENTRE 180 Y 360') 
 order by venc_mayor;
 
-- Se anulo momentaneamente el sgte negocio
 SELECT * FROM con.foto_ciclo_pagos WHERE negasoc = 'MC15923';