--Arreglar saldo de las facturas.
----------------------------------------------------------------
select * from con.factura where negasoc	='FE02379';
select * from con.factura_detalle where documento IN ('FG2626406','FG2626407','FG2626408');


--Devolver negocio a avalado, eliminar cxps.
----------------------------------------------------------------
SELECT estado_neg, actividad,* FROM negocios WHERE cod_neg = 'FE05335';
SELECT estado_sol,* FROM solicitud_aval WHERE cod_neg = 'FE05335';

SELECT * FROM FIN.cxp_doc WHERE documento_relacionado = 'FE05335';
SELECT * FROM FIN.cxp_items_doc WHERE documento IN ('PM38460','PM38461');

--anular la cxp en esta tabla
SELECT * FROM administrativo.historico_deducciones_fianza WHERE negocio = 'FE05335';

SELECT * FROM negocios_trazabilidad WHERE cod_neg = 'FE05335';

--ERROR EN CODIGO DE ESTUDIANTE.
------------------------------------------------------------------
-- Muy buenas tardes, el crédito a nombre de BARRAZA CAMACHO MARIA JUDITH cc 36385931 
-- formulario 153936, tiene un error en el campo de CÓDIGO ALUMNO, esta se encuentra 
-- en el formulario donde esta la información del estudiante, el código correcto es: 2920192005-27408. 
-- Favor hacer el cambio respectivo. Muchas gracias de antemano.

select * from solicitud_estudiante where numero_solicitud='153936';


--Error pasar de NM a PM fintra.
------------------------------------------------------------------
select dstrct,tipo_documento,documento,valor_saldo, clasificacion1,reg_status,codcli,* from con.factura where documento = 'NM14679_2';
update con.factura set codcli = '' where documento = 'NM14092_1';

select * from cliente where codcli = 'CS32834' 	nomcli like '%SUPERINT%' nit = '899999007' and  direccion like '%CL 5%' and nomcli like '%SUPERINT%' and nit = '899999007'		'SUPERINT DE NOTARIADO Y REGIST'
--'CL15431' -- '891000627'
Fintra--'CL41039'   -- '891000627'

select
      a.*,
      b.nomcli
    from
       (select 
	  a.ref1 as fom ,
	  substr(a.documento,1,7) as documento_maestro,
	  (substr(a.documento,9,3)::integer ) as cuota_primera,
	  0 as cuota_ultima,
	  (a.referencia_1) as solicitud,
	  (a.nit) as nit,
	  (a.codcli) as codcli,
	  (a.fecha_factura) as fecha_factura,
	  (a.valor_saldo) as valor_saldo
	from
	 con.factura a
	where
	 a.dstrct = 'FINV' and 
	 a.tipo_documento = 'FAC' and 
	 a.documento like 'NM%' and
	 a.valor_saldo > 0 and
	 a.clasificacion1 = '' and
	 a.reg_status != 'A' 
	group by
	 1,2,3,4,5,6,7,8,9,documento
	order by
	 a.ref1,
	 substr(a.documento,1,7),
	 substr(a.documento,9,3)::integer ) a,
       cliente b
     where
	 a.codcli = b.codcli
     order by
       a.fom      


--Query para Insertar los usuarios de selectrik en fintra
insert into cliente (
			estado, codcli, nomcli, notas, agduenia, base, texto_oc, nit, cedagente, rentabilidad, soportes_fac, fiduciaria, dstrct, moneda,
			forma_pago,plazo, zona, branch_code, bank_account_no, cmc, unidad, codigo_impuesto, agfacturacion, reg_status, creation_date,
			direccion, telefono, nomContacto, telContacto, email_Contacto, dir_Factura, ma_PreFactura, tiempoprefac, tiempo_leg, tiempo_Re_fact,
			diaPago, for_facturacion, direccion_contacto, agencia_cobro, hc, rif, ciudad, ciudad_factura, pais, pais_envio, creation_user
			)
SELECT t.*
FROM dblink('dbname=selectrik port=5432',
            'SELECT estado, codcli, nomcli, notas, agduenia, base, texto_oc, nit, cedagente, rentabilidad, soportes_fac, fiduciaria, dstrct, moneda,
			forma_pago,plazo, zona, branch_code, bank_account_no, cmc, unidad, codigo_impuesto, agfacturacion, reg_status, now(),
			direccion, telefono, nomContacto, telContacto, email_Contacto, dir_Factura, ma_PreFactura, tiempoprefac, tiempo_leg, tiempo_Re_fact,
			diaPago, for_facturacion, direccion_contacto, agencia_cobro, hc, rif, ciudad, ciudad_factura, pais, pais_envio, ''MCASTILLO'' FROM cliente WHERE codcli ilike ''CS%'' ' )
    AS t(estado varchar, codcli varchar, nomcli varchar, notas varchar, agduenia varchar, base varchar, texto_oc varchar, nit varchar,cedagente varchar, rentabilidad numeric, soportes_fac varchar, fiduciaria varchar, dstrct varchar, moneda varchar,
			forma_pago varchar,plazo numeric, zona varchar, branch_code varchar, bank_account_no varchar, cmc varchar, unidad varchar, codigo_impuesto varchar, agfacturacion varchar, reg_status varchar, creation_date date,
			direccion varchar, telefono varchar, nomContacto varchar, telContacto varchar, email_Contacto varchar, dir_Factura varchar, ma_PreFactura varchar, tiempoprefac varchar, tiempo_leg varchar, tiempo_Re_fact varchar,
			diaPago varchar, for_facturacion varchar, direccion_contacto varchar, agencia_cobro varchar, hc varchar, rif varchar, ciudad varchar, ciudad_factura varchar, pais varchar, pais_envio varchar, creation_user varchar) 
LEFT JOIN cliente c ON t.codcli = c.codcli
where c.codcli is NULL





--Devolver negocio a avalado, eliminar cxps.
----------------------------------------------------------------
SELECT estado_neg, actividad,* FROM negocios WHERE cod_neg = 'MC20175';
SELECT estado_sol,* FROM solicitud_aval WHERE cod_neg = 'MC20175';

SELECT * FROM FIN.cxp_doc WHERE documento_relacionado = 'MC20175';
SELECT * FROM FIN.cxp_items_doc WHERE documento IN (SELECT documento FROM FIN.cxp_doc WHERE documento_relacionado = 'MC20175');

SELECT numero_solicitud, estado_sol,* FROM solicitud_aval WHERE cod_neg = 'MC20175';
--se actuaiza con el numero de la solicitud el campo de negocio
SELECT * FROM detalle_poliza_negocio WHERE cod_neg = '141696';--141696

--anular la cxp en esta tabla
SELECT * FROM administrativo.historico_deducciones_fianza WHERE negocio = 'MC20175';

SELECT * FROM negocios_trazabilidad WHERE cod_neg = 'MC20175';

-- factura proyectos especiales: NM14685_1
--corresponde a estudio y diseño
----------------------------------------------------------------
SELECT * FROM con.factura WHERE ref1 = 'FOMS14328-19' documento = 'NM14685_1';
SELECT tipo_proyecto, * FROM opav.ofertas WHERE num_os = 'FOMS14328-19';

select nombre, cod_proyecto from opav.sl_tipo_negocio where column='value';


--ANULAR NOTAS DE AJUSTE JAIRO CASTAÑEDA
-----------------------------------------------------------------
Favor su colaboracion anulando estas notas de ajuste en el CORE SELECTRIK y 
restableciendo el saldo de las factura correspondientes

IA491683 $186,250 NM14468_1
IA491841 $98,750 NM14496_1
IA491843 $27,500 NM14493_1

select * from con.ingreso where num_ingreso='IA491683';--186250.00
select * from con.ingreso_detalle where num_ingreso='IA491683';
SELECT * FROM con.factura WHERE documento ='NM14468_1';

select * from con.ingreso where num_ingreso='IA491841';--98750.00
select * from con.ingreso_detalle where num_ingreso='IA491841';
SELECT * FROM con.factura WHERE documento ='NM14496_1';

select * from con.ingreso where num_ingreso='IA491843';--27500.00
select * from con.ingreso_detalle where num_ingreso='IA491843';
SELECT * FROM con.factura WHERE documento ='NM14493_1';

select * from con.ingreso where num_ingreso='IC211067';--27500.00
select * from con.ingreso_detalle where num_ingreso='IC211067';
SELECT * FROM con.factura WHERE documento ='NM14468_1';--8586000.00
SELECT * FROM con.factura WHERE documento ='NM14496_1';--74500.00


--Corregir apellido
------------------------------------------------------------------------
select * from solicitud_persona where numero_solicitud='154157';
select * from cliente where nit='1052968118';

--Corregir Nombre
-------------------------------------------------------------------------
select * from solicitud_aval where cod_neg='FE05366';
select * from solicitud_persona where numero_solicitud = '153780';


--ERROR NM14685_1 CRYOGAS FOMS14328-19
-------------------------------------------------------------------------
--En Fintra
create table tem.fintra_fac_FOMS14328 AS;
select * from con.factura where ref1 = 'FOMS14328-19'; --documento='NM14685_1';

create table tem.fintra_facdet_FOMS14328 AS;
select * from con.factura_detalle where documento = 'NM14685_1';

create table tem.fintra_compt_FOMS14328 AS
SELECT * FROM con.comprobante WHERE numdoc = 'NM14685_1';

create table tem.fintra_comdtt_FOMS14328 AS
SELECT * FROM con.comprodet WHERE numdoc = 'NM14685_1';

--En Selectrik
create table tem.fintra_fac_FOMS14328 AS;
select * from con.factura where ref1 = 'FOMS14328-19'; --documento='NM14685_1';

create table tem.fintra_facdet_FOMS14328 AS;
select * from con.factura_detalle where documento IN ('NM14685_1','S00013230');

create table tem.fintra_comp_FOMS14328 AS
select * from con.comprodet where numdoc IN ('NM14685_1','S00013230');

create table tem.fintra_comprobante_FOMS14328 AS
SELECT * FROM con.comprobante WHERE numdoc = 'S00013230';


--Query datacredito
------------------------------------------------------------------------
select hr.periodo_lote as hr_periodo, hr.tipo_identificacion as hr_tipo_id, hr.identificacion as hr_identificacion, hr.nombre as hr_nombre, hr.negocio as hr_negocio, hr.fecha_apertura as hr_fecha_apertura, hr.fecha_vencimiento as hr_fecha_ven, hr.novedad as hr_novedad, hr.saldo_en_mora as hr_saldo_mora, ? as un_negocio, ? as periodo,coco.* 
            from SP_ReporteDataCredito('201906'::date, 17, '2019-05-31', '-5000', '5000', 'Visualizar') as coco 
            (nit varchar, tipo_identificacion varchar, identificacion varchar, negocio varchar, nombre varchar, situacion_titular varchar, fecha_apertura varchar, fecha_vencimiento varchar, fecha_corte_proceso date, dias_mora numeric, novedad varchar, min_dias_mora numeric, desembolso varchar, saldo_deuda numeric, saldo_en_mora numeric, 
            cuota_mensual varchar, numero_cuotas varchar, cuotas_canceladas numeric, cuotas_en_mora numeric, fecha_limite_pago date, ultimo_pago date, ciudad_radicacion varchar, cod_dane_radicacion varchar, ciudad_residencia varchar, cod_dane_residencia varchar,      departamento_residencia varchar, direccion_residencia varchar, 
            telefono_residencia varchar, ciudad_laboral varchar, cod_dane_laboral varchar, departamento_laboral varchar, direccion_laboral varchar, telefono_laboral varchar, ciudad_correspondencia varchar, cod_dane_correspondencia varchar, direccion_correspondencia varchar, correo_electronico varchar, celular_solicitante varchar, tipo varchar)
            left outer join cr_historico_reportes as hr on (coco.identificacion=hr.identificacion and coco.negocio=hr.negocio and ? = hr.id_unidad_negocio and hr.periodo_lote = ? and hr.reg_status != 'A')
            where coco.negocio not in (select distinct negocio_reportado from cr_obligaciones_areportar_criesgo where periodo_lote = ? and id_unidad_negocio = ? and reg_status != 'A') 

            
 --reporte            
 ----------------
    sELECT  a.colocacion::date, COALESCE(c1.descripcion,'')||''||COALESCE(a.texto,'') as texto ,a.nombre_fuente 		
    from wsdc.alerta a
    left join wsdc.codigo c1
    on c1.web_service = 'H'
    and c1.tabla='cod_alerta'
    and c1.codigo=a.codigo
    and c1.valor=a.codigo_fuente
    where identificacion=15051291
    and tipo_identificacion=1
    and nit_empresa=8020220161;
   
   
 ----------------------------------------
 SELECT * FROM usuarios WHERE idusuario = 'GFIGUEROA';--K5++XGe+bfztyinic5GoLw==
 
 
 
 -- Por favor reversar lote de las 2.32pm de LDSP: 6968329 y 6968330. 
---------------------------------------- 
SELECT aprobado, fecha_aprobacion, usuario_aprobacion,transferido,fecha_transferencia, numero_egreso, * 
FROM etes.manifiesto_carga WHERE planilla  IN ('6968330','6968329'); 


SELECT * FROM etes.manifiesto_descuentos WHERE planilla = '6968330';

create table tem.egresos_PT02730_1_PT02730_2  as
SELECT * FROM egreso WHERE document_no IN ('PT02730_1','PT02730_2');

create table tem.egresosdet_PT02730_1_PT02730_2  as
SELECT * FROM egresodet WHERE document_no IN ('PT02730_1','PT02730_2');

create table tem.comp_PT02730_1_PT02730_2  as
select * from con.comprobante where numdoc IN ('PT02730_1','PT02730_2');

create table tem.compdt_PT02730_1_PT02730_2  as
select * from con.comprodet where numdoc IN ('PT02730_1','PT02730_2');

create table tem.tran_ant_temp  as
SELECT * FROM  etes.transferencia_anticipos_temp WHERE planilla IN ('6968330','6968329'); 

select cheque,* from fin.cxp_doc where documento IN ('6968330','6968329');
select * from fin.cxp_items_doc where documento IN ('6968330');




select last_update,cheque,* from fin.cxp_doc where documento='6968331';



SELECT * FROM etes.generar_reporte_produccion_transportadora()            
WHERE fecha_creacion_fintra::date between '2019-05-01'::date AND '2019-06-12'::date
AND planilla = '6968329'
ORDER BY ID, fecha_creacion_fintra;

create table tem.tran_ant_6968329_6968330 as
select * from etes.transferencias_anticipos where planilla in ('6968329','6968330') ;

SELECT 
						   anticipo.id,
						   CASE WHEN anticipo.reg_status ='A' THEN 'ANULADO' END AS estado,
						   novedades.descripcion AS obs_anulacion,
						   prod_servicio.descripcion AS producto,
						   agencias.nombre_agencia,
						   conductor.cod_proveedor as nit_conductor,
						   conductor.nombre as nombre_conductor,
						   conductor.veto,
						   conductor.veto_causal,
						   propietario.cod_proveedor as nit_propietario,
						   propietario.nombre as nombre_propietario,
						   propietario.veto,
						   propietario.veto_causal,
						   vehiculo.placa,
						   anticipo.planilla,
						   to_char(anticipo.fecha_creacion_anticipo,'YYYY-MM-DD HH24:MI:SS')::TIMESTAMP as fecha_anticipo,
						   to_char(anticipo.fecha_envio_fintra ,'YYYY-MM-DD HH24:MI:SS')::TIMESTAMP  as fecha_envio,
						   to_char(anticipo.creation_date,'YYYY-MM-DD HH24:MI:SS')::TIMESTAMP  as fecha_creacion_fintra,
						   'N'::TEXT AS reanticipo,
						   anticipo.creation_user AS usuario_creacion,
						   anticipo.aprobado,
						   anticipo.transferido,
						   transferencias.banco_transferencia,
						   transferencias.cuenta_transferencia,
						   transferencias.tipo_cuenta_transferencia ,
						   CASE WHEN anticipo.transferido='S' THEN transferencias.banco END AS banco_conductor,
						   CASE WHEN anticipo.transferido='S' THEN transferencias.no_cuenta END AS no_cuenta_conductor,
						   CASE WHEN anticipo.transferido='S' THEN transferencias.tipo_cuenta END AS tipo_cuenta_conductor,
						   CASE WHEN anticipo.transferido='S' THEN transferencias.nombre_titular_cuenta END AS nombre_cta_conductor,
						   CASE WHEN anticipo.transferido='S' THEN transferencias.cedula_titular_cuenta END AS nit_cuenta_conductor,
						   anticipo.valor_planilla,
						   anticipo.valor_neto_anticipo,
						   anticipo.valor_descuentos_fintra as total_dscto,
						   anticipo.valor_desembolsar as valor_neto,
						   coalesce(transferencias.valor_comision_bancaria,0.0) AS valor_comision,
						   (anticipo.valor_desembolsar - coalesce(transferencias.valor_comision_bancaria,0.0)) AS valor_consignado,
						   to_char(anticipo.fecha_transferencia,'YYYY-MM-DD HH24:MI:SS')::TIMESTAMP AS fecha_transferencia,
						   anticipo.numero_egreso,
						   anticipo.valor_egreso,
						   agencias.id_transportadora,
						   (SELECT razon_social FROM etes.transportadoras  WHERE id=agencias.id_transportadora) AS transportadora,
						   anticipo.origen,
						   anticipo.destino,						   
						   anticipo.fecha_pago_fintra,
						   anticipo.cxc_corrida as nro_corrida ,
						   transferencias.id_transportadora,
						   transferencias.id_manifiesto_carga,
						   transferencias.planilla
							FROM etes.manifiesto_carga AS anticipo
							LEFT JOIN etes.novedades_manifiesto AS novedades ON (anticipo.id=novedades.id_manifiesto_carga AND novedades.id_novedad=3)
							INNER JOIN etes.productos_servicios_transp AS prod_servicio ON (anticipo.id_proserv=prod_servicio.id )  
							INNER JOIN etes.agencias AS agencias ON (anticipo.id_agencia=agencias.id )
							INNER JOIN etes.conductor AS conductor ON (anticipo.id_conductor=conductor.id)
							INNER JOIN etes.vehiculo AS vehiculo ON (anticipo.id_vehiculo=vehiculo.id)
							INNER JOIN etes.propietario  AS propietario ON (vehiculo.id_propietario=propietario.id)
							LEFT JOIN etes.transferencias_anticipos AS transferencias ON (transferencias.id_transportadora=agencias.id_transportadora 
									AND transferencias.id_manifiesto_carga=anticipo.id AND anticipo.planilla=transferencias.planilla
									AND transferencias.reg_status!='A')
							WHERE anticipo.planilla='6968329'
							ORDER BY anticipo.fecha_envio_fintra;
						
						
--------------------------------
