SELECT cod_cli,
       get_nombc(cod_cli)  AS nomcli,
       cxp.vlr_saldo       AS vr_desembolso,
       observaciones,
       coalesce(cp.nombre_titular, p.nombre_cuenta) as nombre_cuenta,
       coalesce(cp.cedula_titular, p.cedula_cuenta) as cedula_cuenta ,
       coalesce(cp.tipo_cuenta, p.tipo_cuenta) as tipo_cuenta,
       coalesce(cp.no_cuenta, p.no_cuenta) AS no_cuenta,
       coalesce(cp.banco_transfer, p.banco_transfer) as banco_transfer,
       n.cod_neg,
       n.fecha_ap :: DATE AS fecha_negocio,
       comision,
       cxp.documento,
       CASE
           WHEN coalesce(cp.no_cuenta, p.no_cuenta) = ''
                 THEN (SELECT valor_1 :: CHARACTER VARYING FROM comisiones_bancos WHERE banco_transfer = coalesce(cp.banco_transfer, p.banco_transfer)
                                                                                    AND anio = substring(now(), 1, 4))
           WHEN (coalesce(cp.no_cuenta, p.no_cuenta) != '' AND un.id_unid_negocio NOT IN (2, 8, 12))
                 THEN CASE
                          WHEN (un.id_unid_negocio IN (22, 24, 30, 31))
                                THEN 'sin comision'
                          WHEN (un.id_unid_negocio = 1)
                                THEN (SELECT CASE WHEN valor_1 > valor THEN valor_1 ELSE valor END :: CHARACTER VARYING AS valor
                                      FROM comisiones_bancos
                                      WHERE banco_transfer = coalesce(cp.banco_transfer, p.banco_transfer)
                                        AND anio = substring(now(), 1, 4))
                                ELSE (SELECT valor :: CHARACTER VARYING FROM comisiones_bancos WHERE banco_transfer = coalesce(cp.banco_transfer, p.banco_transfer)
                                                                                                 AND anio = substring(now(), 1, 4))
           END
           WHEN (coalesce(cp.cedula_titular, p.cedula_cuenta) = '8901009858' OR un.id_unid_negocio IN (2, 8, 12, 30, 31))
                 THEN 'sin comision' END                                                                  AS micomision,
       (SELECT CASE WHEN coalesce(sum(valor_comprar), 0) > 0 THEN 'S' ELSE 'N' END
        FROM solicitud_obligaciones_comprar
        WHERE numero_solicitud = (SELECT numero_solicitud FROM solicitud_aval WHERE cod_neg = n.cod_neg)) AS compra_cartera,
       tipo_referencia_1
        FROM fin.cxp_doc cxp
                 INNER JOIN negocios n ON (n.cod_neg = cxp.documento_relacionado AND cxp.reg_status = '' AND cxp.dstrct = 'FINV' AND cxp.tipo_documento = 'FAP')
                 INNER JOIN proveedor p ON (p.nit = cxp.proveedor)
                 INNER JOIN solicitud_aval sa ON sa.cod_neg = n.cod_neg
                 LEFT JOIN apicredit.pre_solicitudes_creditos pre ON pre.numero_solicitud = sa.numero_solicitud --se agrega para validacion de la sucursal
                 LEFT JOIN cuentas_transferencia_proveedor cp ON cp.cedula_titular = p.nit AND cp.cod_dpto = pre.departamento
                 INNER JOIN rel_unidadnegocio_convenios un ON un.id_convenio = n.id_convenio
        WHERE  n.fecha_negocio >= '2014-01-01'
          AND n.cod_neg = cxp.documento_relacionado
          AND cxp.handle_code NOT IN ('AV', 'BA', 'FJ', 'FQ', 'AY', 'PZ','RG')  --#negocios# 
          AND referencia_3 != 'CHEQUE' and substring(cxp.documento,1,2) not in ('RN') and 
          un.id_unid_negocio = 1 and 
          --n.f_desem::date='2019-03-29'::date  and n.f_desem::date='2019-03-15'::date
           n.estado_neg='T'
          AND cxp.documento IN ('MP16008','MP16289')
          --#cond#
        ORDER BY n.fecha_ap, cxp.documento
        
        
        SELECT handle_code,* FROM fin.cxp_doc WHERE documento = 'MP16008';