select * from negocios limit 10

-- negocios de ejemplo
-- select visto_bueno_fianza, valor_fianza, valor_total_poliza,* from negocios where cod_cli = '1047480303'; --valor_total_poliza
-- select estado_neg,valor_total_poliza,* from negocios where valor_total_poliza != 0 and estado_neg = 'T' limit 10;


SELECT 
            neg.cod_cli,
            neg.cod_neg as negasoc,
            get_nombc(neg.cod_cli) as cliente,
            (select nombre from solicitud_persona where tipo in ('C','E') and numero_solicitud = (select numero_solicitud from solicitud_aval where cod_neg = neg.cod_neg) limit 1) as codeudor,
            (select identificacion from solicitud_persona where tipo in ('C','E') and numero_solicitud = (select numero_solicitud from solicitud_aval where cod_neg = neg.cod_neg) limit 1) as cc_codeudor,
            (select genero from solicitud_persona where tipo in ('C','E') and numero_solicitud = (select numero_solicitud from solicitud_aval where cod_neg = neg.cod_neg) limit 1) as genero_codeudor,
            neg.fecha_negocio ::date as fecha_negocio,
            CASE WHEN neg.estado_neg = 'T' THEN 'TRANSFERIDO'
            WHEN neg.estado_neg = 'A' THEN 'APROBADO'
            END AS estado_neg,
            (SELECT nombre FROM convenios WHERE id_convenio=neg.id_convenio)  AS convenio, 
            neg.id_convenio,
            tasa_interes,
            sa.afiliado,
            eg_tipo_negocio(neg.cod_neg) AS tipo_negocio,
            (coalesce (neg2.vr_negocio,0) + coalesce (neg.vr_negocio,0) ) as vr_negocio, 
            (coalesce(neg2.valor_aval,0) + coalesce (neg.valor_aval,0)) as valor_aval,
            (select vr_negocio from negocios where cod_neg = neg.cod_neg) as valor_neg,
            (select coalesce (vr_negocio,0) as valor from negocios where negocio_rel = neg.cod_neg)as valoraval,
            neg.nro_docs,
            sum (fac.saldo_cartera) as saldo_cartera,
            fianza,
            neg.visto_bueno_fianza,
            solp.genero,
            solp.tipo_id,
            case when neg.valor_total_poliza != 0 then 'S' else 'N' end as poliza,
            neg.visto_bueno_poliza
            FROM (
            SELECT 
            SUM (valor_saldo) AS saldo_cartera,
            codcli, 
            nit, 
            negasoc
            FROM negocios 
            INNER JOIN con.factura fac on (fac.negasoc=negocios.cod_neg)
            WHERE 
            negocios.estado_neg in ('T', 'A','PR')
            AND cod_cli = '1047480303' --cod_cli = '72277150'
            AND fac.reg_status=''
            AND SUBSTRING(fac.documento,1,2) NOT IN ('CP','FF','DF') 
            AND fac.reg_status !='A' AND fac.dstrct='FINV'
            --AND valor_saldo > 0
            GROUP BY codcli,nit,negasoc
            ) AS fac  
            INNER JOIN negocios AS neg ON (fac.nit = neg.cod_cli and fac.negasoc = neg.cod_neg and   neg.estado_neg in ('T', 'A','PR'))
            LEFT JOIN (
            SELECT 
            vr_negocio,
            valor_aval,
            cod_cli,
            cod_neg,
            negocio_rel 
            FROM negocios 
            WHERE
            negocios.estado_neg in ('T', 'A','PR')
            GROUP BY cod_cli,cod_neg,vr_negocio,valor_aval,negocio_rel
            ) AS neg2 ON (neg2.negocio_rel = neg.cod_neg and neg2.cod_cli = neg.cod_cli)
            INNER JOIN solicitud_aval AS sa ON (neg.cod_neg=sa.cod_neg)
            INNER JOIN solicitud_persona solp on (solp.numero_solicitud = sa.numero_solicitud and solp.tipo = 'S')
            INNER JOIN convenios c on (c.id_convenio = neg.id_convenio)
            WHERE 
            --financia_aval = 't'
            neg.negocio_rel =''
            AND neg.cod_cli = '1047480303' -- neg.cod_cli = '72277150'
            GROUP BY
            neg.cod_cli,
            cliente,
            neg.fecha_negocio,
            convenio, 
            neg.id_convenio,
            sa.afiliado,
            neg2.vr_negocio, 
            neg.nro_docs,
            fianza,
            tasa_interes,
            neg2.valor_aval,
            neg.visto_bueno_fianza,
            fac.saldo_cartera,
            neg.cod_neg,
            neg.estado_neg,
            neg.vr_negocio,
            neg.valor_aval,
            solp.genero,
            solp.tipo_id,
            poliza,
            neg.visto_bueno_poliza
            ORDER BY fecha_negocio;

           
           select fianza,cod_neg,* from solicitud_aval where fianza = 'S' limit 10;
           
          
--Query para sacar los negocios pendientes de visto bueno
          SELECT id::varchar, 
          	     nit_cliente::varchar, 
          	     nomcli::varchar as nombre_cliente, 
          	     negocio::varchar, 
          	     ctrl.plazo::varchar, 
                 valor_negocio::integer,
                 valor_desembolsado::integer, 
                 ctrl.valor_fianza::integer, 
                 fecha_vencimiento::date, 
                 ctrl.id_convenio::integer,
                 n.valor_total_poliza::integer
            FROM administrativo.historico_deducciones_fianza ctrl
            INNER JOIN negocios n ON n.cod_neg = ctrl.negocio
            LEFT JOIN cliente cl ON cl.nit = nit_cliente
            WHERE id_unidad_negocio = 1 AND 
            estado_neg = 'T' AND 
            visto_bueno_fianza = 'N'
                        
            union all 
            
            select n.cod_neg::varchar as id, 
          	     nit::varchar as nit_cliente, 
          	     nomcli::varchar as nombre_cliente, 
          	     n.cod_neg::varchar, 
          	     n.nro_docs::varchar as plazo, 
                 n.vr_negocio::integer,
                 n.vr_desembolso::integer, 
                 n.valor_fianza::integer, 
                 '9999-01-01'::date as fecha_vencimiento, 
                 n.id_convenio::integer,
                 n.valor_total_poliza::integer             
            from negocios n
            inner join cliente cl on (cl.nit = n.cod_cli)
            inner join rel_unidadnegocio_convenios un on (un.id_convenio = n.id_convenio)
            where valor_total_poliza != 0 and 
                  estado_neg = 'T' and 
                  visto_bueno_poliza = 'N' and
                  un.id_unid_negocio = '1'
             order by nit_cliente;
                 
                 
                 
                 select * from negocios limit 10 where column='value';
                 select * from unidad_negocio limit 10 where column='value';
                 select * from rel_unidadnegocio_convenios where column='value';
                 select id_convenio,* from negocios;
                 select * from administrativo.historico_deducciones_fianza where id	='3770';
                 
                 
            
9314148   
1001818925
1001818078
1001818135

1001856161
1001913454

select visto_bueno_poliza,usuario_visto_bueno_poliza, * from negocios where cod_neg='MC16829';
select sum(valor_saldo) from con.factura where negasoc = 'MC16829';






            