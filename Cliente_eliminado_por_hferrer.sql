SELECT * FROM administrativo.historico_deducciones_fianza where negocio = 'LB01225'
select * from fin.cxp_doc where documento_Relacionado = 'LB01225'

SELECT id, nit_cliente,-- nomcli as nombre_cliente,  
documento_relacionado, negocio, ctrl.plazo, 
            valor_negocio,valor_desembolsado, ctrl.valor_fianza, fecha_vencimiento::date, ctrl.id_convenio
            FROM administrativo.historico_deducciones_fianza ctrl
            INNER JOIN negocios n ON n.cod_neg = ctrl.negocio
         --   LEFT JOIN cliente cl ON cl.nit = nit_cliente
            WHERE id_unidad_negocio = 22 --AND periodo_corte = ? AND nit_empresa_fianza = ? AND agencia=?
            and negocio = 'LB01225'
            AND estado_proceso = '' AND estado_neg in ('T','A','L') AND ctrl.reg_status!='A';      



	create table tem.cliente_1082914480_ as
        select * from cliente where nit = '1082914480' and cmc = ''

        insert into cliente select * from tem.cliente_1082914480_
           