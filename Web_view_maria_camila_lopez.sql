SELECT cod_neg, vr_desembolso,fecha_ap AS fecha_formalizacion, periodo, f_desem,valor_aval,cod_cli, create_user AS usuario_creador, aprobado_por, 
* FROM negocios 
WHERE cod_neg ILIKE 'FE%' AND 
      id_convenio = '58' AND 
     fecha_ap::timestamp BETWEEN '2018-11-06 02:00:00'::timestamp AND '2018-11-07 12:30:00'::timestamp; 
   
