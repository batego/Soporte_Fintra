SELECT
      ofertas.id_solicitud,
      ofertas.num_os,
      ofertas.consecutivo_oferta,
      cliente.nomcli as nomcliente,
      ofertas.fecha_inicial_oferta::date as fecha_inicial,--(select min(ap.fecha_inicial)::date from opav.accion_programacion ap join opav.acciones a on ap.id_accion=a.id_accion and a.id_solicitud = opav.ofertas.id_solicitud),
      ((select max(ap.fecha_final)::date from opav.accion_programacion ap join opav.acciones a on ap.id_accion=a.id_accion and a.id_solicitud = opav.ofertas.id_solicitud)- ofertas.fecha_inicial_oferta::Date)+1::int as fecha_final
FROM
      opav.ofertas,
      cliente
WHERE
      ofertas.id_cliente = cliente.codcli AND
      ofertas.id_solicitud = 927000;

 


	    
	    select id_accion from  opav.acciones where id_solicitud = 927000 

	    select id_actividad, id_accion, creation_date,* from  opav.accion_programacion where id_accion in ('9044270') and id_actividad = '159'
-- 	    update opav.accion_programacion set reg_status = ''  where id_accion in ('9044271','9044270') and id_actividad = '159'

		
	    
            select * from  opav.actividades where id in (select id_actividad from  opav.accion_programacion where id_accion in ('9044270'))
--             update opav.actividades set reg_status = '' where id = '159' and id in (select id_actividad from  opav.accion_programacion where id_accion in ('9044271','9044270'))







	 select *
                
            from
                opav.oferta_seguimiento
            where
                id_solicitud = '927000' 
               


 select
                oe.id_accion, oe.id_actividad, fecha, avance, avance_esperado, coalesce(oe.observaciones, '') as observaciones
            from
                opav.oferta_ejecucion oe
            join
                opav.accion_programacion ap on (oe.id_accion=ap.id_accion and oe.id_actividad=ap.id_actividad)
            where
                oe.id_accion=9044270
                and oe.reg_status=''
            order by
                ap.id_actividad,oe.id_accion,fecha--ap.fecha_inicial;



