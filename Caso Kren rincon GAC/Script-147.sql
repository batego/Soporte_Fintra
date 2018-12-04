	

SELECT  * FROM conceptos_recaudo WHERE 
prefijo = substring('CAPITAL',1,10) AND
(now()::date - '2018-10-17') BETWEEN dias_rango_ini AND dias_rango_fin AND
id_unidad_negocio = 31;


SELECT * FROM sanciones_condonaciones 
WHERE id_conceptos_recaudo = 259
AND id_tipo_acto = 1
AND (now()::date - '2018-10-17' )  BETWEEN dias_rango_ini AND dias_rango_fin 
AND periodo = '201811' and id_unidad_negocio = 31; 

			



SELECT * FROM con.factura_detalle where documento = 'FG2533302' order by descripcion

SELECT  now()::date> '2018-10-17'::date;

select  tasa_usura/100 from convenios where id_convenio = (select id_convenio from negocios where cod_neg='FE01599'); --0.02160000000000000000

SELECT (960405 * 10)/100


SELECT  cod_neg from negocios where negocio_rel = 'FE01599';
SELECT cod_neg from negocios where negocio_rel_seguro = 'FE01599';
SELECT cod_neg from negocios where negocio_rel_gps = 'FE01599';
