SELECT substring('201807',5) = '01'	-- F	--201807 - 1 
select to_char(to_timestamp(substring('201807',1,4)::numeric || '-' || to_char(substring('201807',5,2)::numeric,'FM00') || '-01', 'YYYY-MM-DD') + INTERVAL '1 month' - INTERVAL '1 days', 'YYYY-MM-DD');

--'2018-07-31'

select negasoc::varchar as negocio, 
			       nit::varchar as cedula, 
			       ''::varchar as nombre_cliente, 
			       num_doc_fen::varchar as cuota, 
			       documento::varchar, 
			       fecha_vencimiento::date,
			       ('2018-07-31'::date-fecha_vencimiento)::numeric AS dias_vencidos,
			       ''::varchar as vencimiento_mayor,
			       '-'::varchar as status,
			       valor_saldo::numeric,
			       0::numeric as debido_cobrar,
			       0::numeric as interes_mora,
			       0::numeric as gasto_cobranza  
			from con.foto_cartera f
			where negasoc = 'FE00061'
			and periodo_lote = '201807'
			and reg_status = ''	
			--and descripcion != 'CXC AVAL'
			and substring(documento,1,2) not in ('CP','FF','DF') 
			and valor_saldo > 0 
			and replace(substring(f.fecha_vencimiento,1,7),'-','')::numeric <= '201807'
			order by num_doc_fen::numeric,creation_date;

select substring('FG2417501',1,2) IN ('FG','CG')	-- T

SELECT valor_saldo FROM con.factura WHERE valor_saldo >0 AND reg_status='' and dstrct='FINV' 
and documento = 'FG'||substring('FG2417501',3) OR  documento = 'CG'||substring('FG2417501',3);    -- 318236.00

-- FacturaActual PASO ,FG2417501;

-- CarteraGeneral.debido_cobrar = 318236.00
-- BolsaSaldo = 318236.00


SELECT 	
     CASE WHEN maxdia >= 365 THEN '8- MAYOR A 1 AÑO'
     WHEN maxdia >= 181 THEN '7- ENTRE 180 Y 360'	
     WHEN maxdia >= 121 THEN '6- ENTRE 121 Y 180'
     WHEN maxdia >= 91 THEN '5- ENTRE 91 Y 120'
     WHEN maxdia >= 61 THEN '4- ENTRE 61 Y 90'
     WHEN maxdia >= 31 THEN '3- ENTRE 31 Y 60'
     WHEN maxdia >= 1 THEN '2- 1 A 30'	     
     WHEN maxdia <= 0 THEN '1- CORRIENTE'
	ELSE '0' END AS rango
FROM (	
 SELECT max('2018-07-31'::date-(fecha_vencimiento)) as maxdia
 --SELECT FechaCortePeriodo::date-fecha_vencimiento as maxdia
 FROM con.foto_cartera fra            
 WHERE fra.dstrct = 'FINV'       
	  AND fra.valor_saldo > 0            
	  AND fra.reg_status = '' 
	  AND fra.negasoc = 'FE00061'
	  --AND fra.documento = CarteraGeneral.documento
	  AND fra.tipo_documento = 'FAC'
	  AND fra.periodo_lote = '201807'
 GROUP BY negasoc) tabla2; 


-- CarteraGeneral.vencimiento_mayor =  '2- 1 A 30'


SELECT * FROM con.factura_detalle where documento = 'FG2417501'

select 302236.00 > 0 and 318236.00 > 0

VlDetFactura = 16000.00 23896.00 278340.00
_Base = 16000.00 23896.00 278340.00 

SELECT * FROM conceptos_recaudo WHERE prefijo = substring('CUOTA-ADMINISTRACION',1,10) 
AND (now()::date - 2018-07-12 ) BETWEEN dias_rango_ini AND dias_rango_fin and id_unidad_negocio = 31;	-- id : '' 

SELECT * FROM conceptos_recaudo WHERE prefijo = substring('INTERESES',1,10) 
AND (now()::date - 2018-07-12 ) BETWEEN dias_rango_ini AND dias_rango_fin and id_unidad_negocio = 31;   -- id : '249'

SELECT * FROM conceptos_recaudo WHERE prefijo = substring('CAPITAL',1,10) 
AND (now()::date - 2018-07-12 ) BETWEEN dias_rango_ini AND dias_rango_fin and id_unidad_negocio = 31;	-- id : '259'
					        

SELECT * FROM sanciones_condonaciones where id_unidad_negocio = '31'
WHERE id_conceptos_recaudo in (249,259)
and id_tipo_acto = 1
AND (now()::date - '2018-07-12' )  BETWEEN dias_rango_ini AND dias_rango_fin 
AND periodo = '201807' and id_unidad_negocio = 31 


SELECT cod_neg from negocios where negocio_rel = 'FE00062';