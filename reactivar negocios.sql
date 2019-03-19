select estado_neg, actividad,* from negocios where cod_neg='MC18708';
select estado_sol, * FROM solicitud_aval where cod_neg='MC18708';
select * from solicitud_persona where numero_solicitud = '148768';
SELECT * FROM negocios_trazabilidad WHERE cod_neg = 'MC18708';