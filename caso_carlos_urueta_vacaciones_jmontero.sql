--create table tem.vac_NSN00121 as 
select * from administrativo.novedades where numsolicitud in ('NSN00121')
-- DELETE from administrativo.novedades where numsolicitud in ('NSN00122')

-- Cedula: 8784004

--Query que trae las vacaciones de un usuario.
 SELECT n.numsolicitud,
                n.id,
                case when (n.aprobado)='S'then'Aprobado' else CASE WHEN n.aprobado = 'N' then 'Rechazado' else CASE WHEN n.aprobado = 'P' then 'Pendiente' end end end as status,
                case when (n.reg_status)=''then'Activo' else 'Inactivo' end as estado,
                t.descripcion as tipo_novedad, 
                t.id as id_tipo_novedad,
                fecha_solicitud::date, 
                cc_empleado as identificacion, 
                em.nombre_completo,
                fecha_ini::date, 
                duracion_dias, 
                fecha_fin::date, 
                hora_ini, 
                duracion_horas, 
                hora_fin, 
                r.descripcion as razon, 
                r.id as id_razon,
                cod_enfermedad, 
                e.descripcion as enfermedad, 
                n.descripcion, 
                --case when aprobado = 'S' then 'SI' else 'NO' END as aprobado,
                aprobado,
                comentario, 
                fecha_autoriza::date,
                --rel.id_usuario as id_jefe_directo,
                --u.nombre as jefe_directo, 
                n.user_autoriza as id_jefe_directo,
                remunerada, 
                fecha_visto_bueno::date, 
                user_visto_bueno, 
                n.observaciones, 
                n.creation_date, 
                n.creation_user, 
                n.last_update, 
                n.user_update, 
                dias_compensados,
                dias_a_pagar,
                recobro,
                id_proceso,
                p.descripcion as proceso_actual,
                n.origen,
                case when (n.reg_status)='' then 'checked' else '' end as cambio
           FROM administrativo.novedades n
           LEFT JOIN administrativo.enfermedades e on e.codigo = n.cod_enfermedad
           INNER JOIN administrativo.empleados em on em.identificacion = n.cc_empleado
           INNER JOIN administrativo.tipo_novedad t on t.id=n.id_tipo
           LEFT JOIN administrativo.razon_novedad r on r.id=n.razon
           --INNER JOIN administrativo.rel_jefatura_usuario rel on rel.id_usuario= n.user_autoriza
           INNER JOIN usuarios u on u.idusuario = n.user_autoriza
           LEFT JOIN proceso_interno p on p.id=n.id_proceso
           WHERE n.id_tipo = 4 
           AND n.creation_user = 'JMONTERO' 
           and em.reg_status = ''
           AND fecha_solicitud::date between '2018-06-20'::date and '2018-06-20'::date 
           AND cc_empleado = '8784004' 
           order by n.fecha_solicitud desc

-- verificamos que el usuario este creado como empleado
select * from administrativo.empleados where identificacion = '8784004'
--Verificamos el jefe
select * from administrativo.rel_jefatura_usuario where id_usuario = 'MCERTAIN'
--verificamos si el usuario jefe esta creado como usuario
select * from usuarios where idusuario = 'MCERTAIN'