select
                    a.dstrct,
                    a.tipodoc as tipo_doc,
                    a.nit as tercero,
                    a.cod as numdoc,
                    a.valor as valor,
                    a.base,
                    a.cmc as hc,
                    a.fecha_doc,
                    substr( a.fecha_doc,1,4 ) || substr( a.fecha_doc,6,2 ) as periodo,
                    cmc.sigla_comprobante,
                    CASE WHEN a.endosado='S' THEN 
                        (SELECT cuenta FROM cuentas_endoso_diferidos ced 
                                WHERE ced.id_convenio=ng.id_convenio AND ced.tipo_documento=a.tipodoc AND ced.reg_status='')
                    ELSE cmc.cuenta END AS cuenta,
                    cmc.dbcr,
                    ctas.nombre_largo as descrip,
                    CASE WHEN a.endosado='S' THEN 
                        (SELECT cta_ingreso_dif FROM cuentas_endoso_diferidos ced 
                                WHERE ced.id_convenio=ng.id_convenio AND ced.tipo_documento=a.tipodoc AND ced.reg_status='')
                    ELSE
                            CASE  WHEN substr(a.cod,1,2)=cfc.prefijo AND a.tipodoc=cfc.tipodoc THEN coalesce(cfc.cuenta_diferido,'')
                                  WHEN substr(a.cod,1,2)=c.prefijo_diferidos AND a.tipodoc=(select tipo_documento from series where document_type=c.prefijo_diferidos) THEN coalesce(c.cuenta_diferidos,'')
                                  WHEN substr(a.cod,1,2)=c.prefijo_dif_fiducia AND a.tipodoc=(select tipo_documento from series where document_type=c.prefijo_dif_fiducia) THEN coalesce(c.cuenta_dif_fiducia,'')
                                  WHEN substr(a.cod,1,2)=c.prefijo_cuota_administracion_diferido AND a.tipodoc=(select tipo_documento from series where document_type=c.prefijo_cuota_administracion_diferido) THEN coalesce(c.cta_cuota_admin_diferido,'')
                               ELSE ''
                            END 
                    END  as cuenta_diferidos,
                    ng.cod_neg AS documento_rel,
                    'NEG' AS tipodocRel,
                    coalesce(cfc.aplica_iva,'N') as aplica_iva,
                    ng.id_convenio
                from
                    ing_fenalco a
                join
                    negocios ng on (ng.cod_neg = a.codneg)
                left join
                    con.tipo_docto tdoc
                    on (tdoc.dstrct = a.dstrct
                    and tdoc.codigo_interno = a.tipodoc)
                left join
                    con.cmc_doc cmc
                    on (cmc.dstrct = tdoc.dstrct
                    and cmc.tipodoc = tdoc.codigo
                    and cmc.cmc = a.cmc)
                left join
                    con.cuentas ctas
                    on (cmc.cuenta=ctas.cuenta)
                left join
                    negocios n
                    on (n.cod_neg = a.codneg)
                left join
                    convenios c
                    on (c.id_convenio = n.id_convenio)
                left join convenios_cargos_fijos cfc on (c.id_convenio=cfc.id_convenio and cfc.activo = true and cfc.tipodoc=a.tipodoc and cfc.reg_status='')
                where
                a.dstrct = 'FINV'
                and substring(a.fecha_doc,1,7) <= substring(current_date,1,7) 
                and a.fecha_contabilizacion = '0099-01-01 00:00:00'
                and a.reg_status = ''
                and a.periodo=''
                order by a.tipodoc,a.fecha_doc,cuenta;
                
              --select * from ing_fenalco where cod='CA500694502';
               --select * from negocios where cod_neg='MC17317';