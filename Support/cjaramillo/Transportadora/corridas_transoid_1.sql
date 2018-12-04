--2018-11-01
--cabecera corrida
SELECT  (select id from etes.transportadoras where identificacion = fac.nit ) as id,
            fac.nit,(SELECT nomcli FROM cliente WHERE nit = fac.nit) AS nom_cliente,
            fac.valor_factura,fac.valor_abono,fac.valor_saldo,fac.fecha_vencimiento,fac.fecha_ultimo_pago,
            fac.creation_user ,fac.documento,anticipo.fecha_corrida::date,fac.creation_date::date,
            (select count (*) from etes.manifiesto_carga anticipo where fac.documento = cxc_corrida)+
            (select count (*) from etes.manifiesto_reanticipos where fac.documento = cxc_corrida)as numero_planilla
            FROM con.factura  fac
            INNER JOIN con.factura_detalle facdet on (fac.documento=facdet.documento)
            JOIN etes.manifiesto_carga anticipo ON (fac.documento = anticipo.cxc_corrida   and anticipo.reg_status !='A')
            WHERE 
            fac.reg_status='' 
            AND facdet.reg_status='' 
            AND fac.documento in (SELECT * FROM (
            SELECT  anticipo.cxc_corrida from etes.manifiesto_carga as anticipo
            INNER JOIN etes.agencias as agencia on(agencia.id=anticipo.id_agencia)
            INNER JOIN etes.transportadoras as trans on (agencia.id_transportadora=trans.id)  
            WHERE   anticipo.cxc_corrida != '' and anticipo.reg_status='' and trans.id = '5' and anticipo.fecha_corrida ::date between '2018-11-02'::date AND '2018-11-01'::date  -- AND trans.id=? and anticipo.fecha_corrida ::date= ?::date
            UNION ALL
            SELECT  reanticipo.cxc_corrida from etes.manifiesto_reanticipos  as reanticipo 
            INNER JOIN etes.manifiesto_carga as anticipo on (reanticipo.id_manifiesto_carga=anticipo.id)
            INNER JOIN etes.agencias as agencia on(agencia.id=anticipo.id_agencia)
            INNER JOIN etes.transportadoras as trans on (agencia.id_transportadora=trans.id)
            WHERE    reanticipo.cxc_corrida != '' and  reanticipo.reg_status='' and trans.id = '5' and reanticipo.fecha_corrida ::date  between '2018-11-02'::date AND '2018-11-01'::date  --AND trans.id=? and reanticipo.fecha_corrida::date= ?::date

            )as tabla group by  cxc_corrida)
            group by fac.nit,nom_cliente,fac.valor_factura,fac.valor_abono,fac.fecha_vencimiento,fac.fecha_ultimo_pago,
            fac.creation_user ,fac.documento,anticipo.fecha_corrida,fac.valor_saldo,fac.creation_date
            order by fecha_corrida asc



  -- Detalle corrida         
            select * 
            from (
            SELECT 
            anticipo.cxc_corrida
            ,anticipo.planilla 
            ,anticipo.creation_date::date
            ,anticipo.fecha_corrida::date
            ,'N' as reanticipo,
            anticipo.valor_neto_anticipo
            ,anticipo.fecha_pago_fintra::date
            FROM etes.transportadoras trans
            JOIN etes.agencias ag ON (ag.id_transportadora = trans.id)
            JOIN etes.manifiesto_carga anticipo ON (ag.id= anticipo.id_agencia AND anticipo.reg_status !='A' AND anticipo.cxc_corrida !='')
            WHERE anticipo.reg_status='' AND  trans.id='5' and anticipo.fecha_corrida::date= '2018-11-01'::date AND cxc_corrida ='R0036940'
            GROUP BY cxc_corrida,anticipo.planilla,anticipo.creation_date,anticipo.fecha_corrida,anticipo.valor_neto_anticipo,anticipo.fecha_pago_fintra
            UNION 
            SELECT 
            reanticipo.cxc_corrida 
            ,reanticipo.planilla
            ,reanticipo.creation_date::date
            ,reanticipo.fecha_corrida::date
            ,'S' as reanticipo
            ,reanticipo.valor_reanticipo
            ,reanticipo.fecha_pago_fintra::date
            FROM etes.transportadoras trans
            JOIN etes.agencias ag ON (ag.id_transportadora = trans.id)
            JOIN etes.manifiesto_carga anticipo ON (ag.id= anticipo.id_agencia  AND anticipo.reg_status !='A')
            JOIN etes.manifiesto_reanticipos reanticipo ON (reanticipo.id_manifiesto_carga = anticipo.id AND reanticipo.reg_status !='A')
            WHERE reanticipo.reg_status='' AND  trans.id='5' and reanticipo.fecha_corrida::date = '2018-11-01'::date  AND reanticipo.cxc_corrida ='R0036940'
            GROUP BY reanticipo.cxc_corrida ,anticipo.planilla,reanticipo.planilla,reanticipo.creation_date,
            anticipo.creation_date,anticipo.fecha_corrida,reanticipo.fecha_corrida,reanticipo.valor_reanticipo,reanticipo.fecha_pago_fintra)
            as tabla