
('FZL00446','LP0001208') 

CREATE TABLE TEM.MC13126_CXP AS					select * from TEM.MC13126_CXP		select * from tem.lb01094_mcamila_cab  ;
select * from fin.cxp_doc										insert into fin.cxp_doc select * from tem.lb01094_mcamila_cab WHERE DOCUMENTO = 'FZL00446'
--delete from fin.cxp_doc
where documento in ('LB01094') 


CREATE TABLE TEM.MC13126_ITEMS_CXP AS				
select * from fin.cxp_items_doc 
--delete from fin.cxp_items_doc
where documento in ('LB01094') 


CREATE TABLE TEM.BTG_LB01094_FAC AS					-- SELECT * FROM TEM.BTG_LB01094_FAC
select * from con.factura 
--delete from con.factura
where negasoc in ('LB01094') 


FZL00446

select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in ('LB01094') 

select * from egreso
--delete from egreso
where document_no in ('MC13126')

select * from egresodet
--delete from egresodet
where document_no in ('EG54902')


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)
CREATE TABLE TEM.MC13126_COMP AS			
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('LB01094') 


CREATE TABLE TEM.MC13126_COMPDET AS			
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('LB01094') 



--Query que trae los registro de fianza
SELECT id, nit_cliente, nomcli as nombre_cliente,  documento_relacionado, negocio, ctrl.plazo, 
            valor_negocio,valor_desembolsado, ctrl.valor_fianza, fecha_vencimiento::date, ctrl.id_convenio
FROM administrativo.historico_deducciones_fianza ctrl
INNER JOIN negocios n ON n.cod_neg = ctrl.negocio
 LEFT JOIN cliente cl ON cl.nit = nit_cliente
WHERE id_unidad_negocio = 22 AND periodo_corte = '201805' AND nit_empresa_fianza = '9002207536' AND agencia='ATL'
AND NEGOCIO = 'LB01094'
AND estado_proceso = '' AND estado_neg in ('T','A','L');      


select * from negocios WHERE COD_NEG = 'LB01094'

--Anulamos los documentos que salen en la vista CXP COnsolidada
create table tem.fianza_LB01094 as
select * from administrativo.historico_deducciones_fianza where id = 7342 negocio = 'LB01094' and documento_relacionado = 'FZT05406'
update administrativo.historico_deducciones_fianza set reg_status = 'A' where  id = 7350 --negocio = 'LB01094' and documento_relacionado = 'FZL00446' and id = 7342



select * from administrativo.historico_deducciones_fianza where id = 7362
update administrativo.historico_deducciones_fianza set reg_status = 'A' where id = 7362


select * from tem.fianza_LB01094 
where id = 7362

select * from fin.cxp_doc limit 10 where documento = ''


select	df.id,'', 'FINV', cp.proveedor, 'NC', cp.documento, 'NC CANCELACION CXP TEMPORALES FIANZA A '||'xxx'||' '||periodo_corte, cp.agencia,  '' , '', 'FAP', cp.documento, '0099-01-01 00:00:00', 
	(select table_code from tablagen where table_type= 'AUTCXP' AND dato='PREDETERMINADO'), '', cp.banco, cp.sucursal, cp.moneda,
	cp.vlr_neto, cp.vlr_total_abonos,cp.vlr_saldo, cp.vlr_neto_me, cp.vlr_total_abonos_me,cp.vlr_saldo_me, 1.0000000000, '', '0099-01-01 00:00:00', '', '0099-01-01 00:00:00',
	 '0099-01-01 00:00:00', '', 0, 0, 0, NOW(), '' , NOW(), '' , 'COL', '', '', '',
	'0099-01-01 00:00:00', '0099-01-01 00:00:00', '0099-01-01 00:00:00', '', '', '', '', 0, 0, '', 0, 'PES', cp.fecha_documento, cp.fecha_documento, '0099-01-01', 'S', 0, 'N', '4',
	'FAP', cp.documento,'NEG', df.negocio,'',''
FROM administrativo.historico_deducciones_fianza df
LEFT JOIN fin.cxp_doc cp ON (cp.documento=df.documento_relacionado and cp.reg_status='' and cp.proveedor=df.nit_cliente  and cp.dstrct='FINV' and cp.tipo_documento='FAP' )
WHERE id = ANY ('{"7568","7567","7566","7565","7562","7559","7558","7557","7555","7533","7532","7520","7519","7518","7517","7516","7426","7425","7415","7414","7363","7362","7343","7341","7340","7339","7338","7535","7534","7413","7342"}'::text[]::int[])
and df.reg_status = ''--and negocio = 'LB01094'-- 

select * from  fin.cxp_doc where  proveedor ='1129537415' and dstrct='FINV' and tipo_documento='FAP'limit 10

select * from  fin.cxp_items_doc where documento in('FZL00448')






  