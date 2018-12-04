SELECT a.dstrct::varchar,
				a.cuenta::varchar,
				a.auxiliar::varchar,
				a.periodo::varchar,
				b.fechadoc::varchar,
				a.tipodoc::varchar,
				coalesce(UPPER(c.descripcion), a.tipodoc ) as tipodoc_desc, 
				a.numdoc::varchar
				,CASE WHEN b.tipodoc = 'NEG' THEN  b.numdoc
			      WHEN b.tipodoc = 'EGR' THEN (SELECT  cxp.descripcion FROM fin.cxp_doc as cxp where tipo_documento = 'FAP' and dstrct = 'FINV' and cxp.cheque=a.numdoc and clase_documento_rel='NEG' and proveedor = a.tercero limit 1)
			      WHEN b.tipodoc = 'FAP' THEN (SELECT cxp1.descripcion FROM fin.cxp_doc as cxp1  where documento=a.numdoc and tipo_documento ='FAP' and dstrct = 'FINV' and proveedor = a.tercero limit 1 )
			      WHEN b.tipodoc = 'NC'  THEN (SELECT cxp2.descripcion FROM fin.cxp_doc as cxp2 WHERE dstrct = 'FINV' and cxp2.documento=(SELECT cxp3.documento_relacionado FROM fin.cxp_doc as cxp3 
									      WHERE dstrct = 'FINV' and tipo_documento ='NC' and documento=a.numdoc and proveedor = a.tercero limit 1) 
								    and cxp2.periodo=a.periodo limit 1)
			      WHEN b.tipodoc = 'ND'  THEN (SELECT cxp2.descripcion FROM fin.cxp_doc as cxp2 WHERE dstrct = 'FINV' and cxp2.documento=(SELECT cxp3.documento_relacionado FROM fin.cxp_doc as cxp3 
									      WHERE dstrct = 'FINV' and tipo_documento ='ND' and documento=a.numdoc and proveedor = a.tercero limit 1) 
								    and cxp2.periodo=a.periodo limit 1)
			      WHEN b.tipodoc = 'FAC' THEN case when a.cuenta = '13050901' then a.detalle else (select descripcion from con.factura where documento = b.numdoc) end
			      WHEN b.tipodoc = 'ING' THEN (select descripcion from con.ingreso_detalle where num_ingreso = b.numdoc and factura = a.documento_rel limit 1)
			      --WHEN b.tipodoc = ''ICA'' THEN (select descripcion from con.factura where documento = (select documento from con.ingreso_detalle where num_ingreso = b.numdoc and item = 1))
			      WHEN b.tipodoc = 'ICA' THEN (select descripcion_ingreso from con.ingreso where num_ingreso = b.numdoc)
			      WHEN b.tipodoc = 'CDIAR' THEN a.detalle
			END as detalle,
			a.abc::varchar,
			a.valor_debito::numeric,
			a.valor_credito::numeric,
			a.tercero::varchar, 
			CASE WHEN a.tercero != '' THEN get_nombrenit(a.tercero) ELSE '' END as nombre_tercero,
			a.tipodoc_rel::varchar,
			CASE WHEN a.documento_rel = '' THEN (select numero_remesa from con.factura_detalle where documento = a.numdoc and numero_remesa != '' limit 1) else a.documento_rel END as documento_rel,
			a.vlr_for::numeric,
			b.moneda_foranea::varchar			
			,CASE WHEN a.tipo_referencia_1 = '' THEN
			      CASE WHEN (select cod_neg from negocios where cod_neg = (select negocio_rel from negocios where cod_neg = documento_rel) and financia_aval) IS NULL THEN 
				   a.tipodoc_rel
			      ELSE 
				   'NEG AVAL'
			      END
			ELSE 
			      a.tipo_referencia_1
			END as tipo_referencia_1,
			CASE WHEN b.tipodoc = 'NEG' THEN  b.numdoc
			     WHEN b.tipodoc = 'EGR' THEN case when a.cuenta != '23050118' then (SELECT cxp.documento_relacionado FROM fin.cxp_doc as cxp where tipo_documento = 'FAP' and dstrct = 'FINV' and cxp.cheque=a.numdoc and clase_documento_rel='NEG' and proveedor = a.tercero limit 1) 
									  else 
									    (select documento_rel from con.comprodet where dstrct = 'FINV' and numdoc = b.numdoc and documento_rel != b.numdoc  limit 1) end
			     WHEN b.tipodoc = 'FAP' THEN case when a.cuenta != '23050118' then  (SELECT  cxp1.documento_relacionado as rel FROM fin.cxp_doc as cxp1  where tipo_documento = 'FAP' and dstrct = 'FINV' and documento=a.numdoc and proveedor = a.tercero limit 1 )
									  else 
									    (select referencia_1 from fin.cxp_items_doc where dstrct = 'FINV' and tipo_documento = 'FAP' and documento = b.numdoc and  vlr = a.valor_debito limit 1) end
			     WHEN b.tipodoc = 'NC'  THEN (SELECT cxp2.documento_relacionado FROM fin.cxp_doc as cxp2 WHERE dstrct = 'FINV' and cxp2.documento=(SELECT cxp3.documento_relacionado FROM fin.cxp_doc as cxp3 
						      WHERE dstrct = 'FINV' and tipo_documento ='NC' and documento=a.numdoc and proveedor = a.tercero limit 1) 
					    and cxp2.periodo=a.periodo limit 1)
			     WHEN b.tipodoc = 'ND'  THEN (SELECT cxp2.documento_relacionado FROM fin.cxp_doc as cxp2 WHERE dstrct = 'FINV' and cxp2.documento=(SELECT cxp3.documento_relacionado FROM fin.cxp_doc as cxp3 
						      WHERE dstrct = 'FINV' and tipo_documento ='ND' and documento=a.numdoc and proveedor = a.tercero limit 1) 
					    and cxp2.periodo=a.periodo limit 1)
			       WHEN b.tipodoc = 'FAC' THEN (select negasoc from con.factura where documento = b.numdoc)
			       WHEN b.tipodoc = 'ING' THEN (select negasoc from con.factura where documento = (select documento from con.ingreso_detalle where num_ingreso = b.numdoc and item = 1))
			       WHEN b.tipodoc = 'ICA' THEN (select negasoc from con.factura where documento = (select documento from con.ingreso_detalle where num_ingreso = b.numdoc and item = 1))
			END as referencia_1, 
			CASE WHEN a.tipo_referencia_2 = '' THEN
			      CASE WHEN (select cod_neg from negocios where cod_neg = (select negocio_rel from negocios where cod_neg = documento_rel) and financia_aval) IS NULL THEN 
				   a.tipodoc_rel
			      ELSE 
				   'NEG AVAL'
			      END
			ELSE 
			      a.tipo_referencia_2
			END as tipo_referencia_2,
			CASE WHEN a.referencia_2 = '' THEN
			      CASE WHEN (select cod_neg from negocios where cod_neg = (select negocio_rel from negocios where cod_neg = documento_rel) and financia_aval) IS NULL THEN 
			       CASE WHEN a.documento_rel = '' THEN (select numero_remesa from con.factura_detalle where documento = a.numdoc and numero_remesa != '' limit 1) else a.documento_rel END
			      ELSE 
			       (select cod_neg from negocios where cod_neg = (select negocio_rel from negocios where cod_neg = documento_rel) and financia_aval)
			      END
			ELSE 
			      a.referencia_2
			END as referencia_2,
			CASE WHEN a.tipo_referencia_3 = '''' THEN
			      CASE WHEN a.documento_rel = '''' THEN 
				   (select nombre::varchar from convenios where id_convenio = (select id_convenio from negocios where cod_neg = (select numero_remesa from con.factura_detalle where documento = a.numdoc and numero_remesa != '' limit 1)) )
			      ELSE 
				   (select nombre::varchar from convenios where id_convenio = (select id_convenio from negocios where cod_neg = a.documento_rel) )
			      END
			ELSE 
			      a.tipo_referencia_3
			END as tipo_referencia_3,
			CASE WHEN a.referencia_3 = '' THEN
				CASE WHEN a.documento_rel = '' THEN 
				   ( select nombre from nit where cedula = (select nit_tercero from negocios where cod_neg = (select numero_remesa from con.factura_detalle where documento = a.numdoc and numero_remesa != '' limit 1)) )
				ELSE 
				   ( select nombre from nit where cedula = (select nit_tercero from negocios where cod_neg = a.documento_rel) )
				END
			 ELSE 
			      a.referencia_3
			 END as referencia_3,
			CASE WHEN ( a.documento_rel = '' or a.documento_rel is null ) THEN 
			      CASE WHEN substring(a.numdoc,1,2) in ('NM','PM','RM') THEN (select clasificacion1 from con.factura where documento = a.numdoc ) end
			ELSE
			      CASE 
				WHEN substring(a.documento_rel,1,2) in ('NM','PM','RM') THEN (select clasificacion1 from con.factura where documento = documento_rel )
				WHEN substring(a.documento_rel,1,2) in ('PB') THEN (select negocio_rel from negocios where cod_neg = (select documento_relacionado from fin.cxp_doc where dstrct = 'FINV' and tipo_documento = 'FAP' and documento = a.numdoc) )
			      END
			      --(select num_fac_venta_aval from negocios where cod_neg = documento_rel )
			END as documento_rel2,
			case when a.tipo_referencia_1 = 'NUMOS' THEN a.referencia_1 
			     when a.tipo_referencia_3 = 'NUMOS' THEN a.referencia_3 	end as multiservicio			    
			      FROM con.comprodet a
				     INNER JOIN con.comprobante b ON (b.tipodoc = a.tipodoc AND b.numdoc = a.numdoc AND b.grupo_transaccion = a.grupo_transaccion)
				     LEFT  JOIN con.tipo_docto  c ON (c.codigo  = a.tipodoc)
			      WHERE a.dstrct = 'FINV'	AND 
			      a.cuenta = '11050533'
			      and a.reg_status = ''
			      ORDER BY a.cuenta, a.auxiliar, fechadoc, a.tipodoc, a.numdoc