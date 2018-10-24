	SELECT
			endosar_en::varchar as cartera_en,
			id_unidad_negocio::varchar,
			unidad_negocio::varchar,
			nit_cliente::varchar,
			nombre_cliente::varchar,
			f.codcli::varchar,
			f.negocio::varchar,
			f.tipo_negocio::varchar,
			f.documento::varchar,
			f.cuota::varchar,
			f.fecha_vencimiento::date,
			(now()::date-f.fecha_vencimiento::date)::numeric as dias_vencidos,
			0::numeric as valor_factura,
			0::numeric as valor_abono,
			0::numeric as valor_saldo
		FROM administrativo.control_endosofiducia f
		     inner join negocios as neg on (neg.cod_neg=f.negocio and neg.estado_neg IN ('T','A'))
		     inner join rel_unidadnegocio_convenios as run on (run.id_convenio=neg.id_convenio)
		     inner join unidad_negocio as un on (run.id_unid_negocio=un.id and ref_4 != '' AND un.id = '2')
		     inner join con.factura fa on (fa.documento=f.documento) --CAMBIO DANIELA
		WHERE f.reg_status=''
		AND f.dstrct ='FINV'
		AND negocio in (select negasoc from tem.endoso_fc_varneg group by negasoc)
		AND fa.valor_saldo > 0 --CAMBIO DANIELA
		AND endosar_en = '8001444676' 
		ORDER BY negocio,documento, cuota;
		
		
		SELECT * FROM administrativo.control_endosofiducia ef
	    INNER JOIN negocios n ON (ef.negocio = n.cod_neg)
		WHERE id_unidad_negocio = '2' AND  endosar_en = '8001444676' AND n.cod_neg ='FA38288';
	    
	    SELECT * FROM administrativo.control_endosofiducia WHERE negocio = 'FA38009';
	
	    SELECT * FROM tem.endoso_fc_marzo18 WHERE negasoc = 'FA38009'; 
	    
		SELECT * FROM unidad_negocio WHERE id IN ('2','31');
	
	
CREATE TABLE tem.endoso_fc_varneg (cod_neg varchar(15) NULL);

SELECT * FROM tem.endoso_fc_varneg;
INSERT into tem.endoso_fc_varneg values('FA35839');
INSERT into tem.endoso_fc_varneg values('FA37209');
INSERT into tem.endoso_fc_varneg values('FA37582');
INSERT into tem.endoso_fc_varneg values('FB05559');
INSERT into tem.endoso_fc_varneg values('FA38009');
INSERT into tem.endoso_fc_varneg values('FB05784');

		
	