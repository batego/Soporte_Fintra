select * from apicredit.usuarios_portal 
--update apicredit.usuarios_portal  set claveencr=(select claveencr from usuarios where idusuario = 'KMENDEZ'), reg_status = ''
--update apicredit.usuarios_portal  set reg_status = ''
where idusuario= 'calle30bq.paraiso@gmail.com'

select * from apicredit.usuarios_portal
--UPDATE apicredit.usuarios_portal SET claveencr='cABRHtDTbnw=' , reg_status = ''
--where identificacion = '72308720'
---where idusuario = 'VTORRES'
WHERE upper(email)=upper( 'ENRIQUEBALLESTAS888@GMAIL.COM') and reg_status=''

select * from usuarios where nit = '1073827772'
select * from usuarios 
--update usuarios set estado = 'I'
where idusuario = 'CARMENVM'
select * from usuarios where nit = '1102779015'
select * from apicredit.usuarios_portal 
--update apicredit.usuarios_portal set claveencr = 'cABRHtDTbnw='
where idusuario in  ('SMARTINEZ1')

select * from apicredit.usuarios_portal where nombre ilike '%VENDRIES%'
select * from apicredit.usuarios_portal where identificacion ilike '%94499163%'
select * from apicredit.usuarios_portal where idusuario ilike '%LIZ OSORIO%'
select * from apicredit.usuarios_portal where email ilike '%fernarzu@hotmail.com%'


select * from apicredit.usuarios_portal 
--update apicredit.usuarios_portal set reg_status = 'I'
where identificacion in (select identificacion from administrativo.empleados  where id_producto = 21)

'1045708390'
select * from apicredit.usuarios_portal 
--update apicredit.usuarios_portal set reg_status = 'I'
--select * from usuarios
--update apicredit.usuarios_portal set claveencr = 'cABRHtDTbnw=', email = 'wsuarez@fintra.co'
 where idusuario in ('WSUAREZ')

select * from apicredit.usuarios_portal 
--UPDATE apicredit.usuarios_portal SET reg_status = 'I'  
where idusuario in ('avendries@gmail.com')

select * from cliente where nit = '73208996'

'TOVIO BARRETO HUGO'

select * from administrativo.clasificacion_clientes_fintracredit  where cedula_codeudor = '73208996'


 
select idusuario,* from apicredit.usuarios_portal order by idusuario

SELECT * FROM apicredit.usuarios_portal order by creation_date--WHERE identificacion = '22430201'

select * from apicredit.pre_solicitudes_creditos where asesor = '' and etapa = 5
SELECT * FROM apicredit.usuarios_portal WHERE  email='c-a-m-g-@hotmail.com'
--update apicredit.usuarios_portal set reg_status= '', email = 'arnulfo3010@hotmail.com', idusuario= 'arnulfo3010@hotmail.com' where  email='arnulfo3010@hotmailo.com'


----CREACION USUARIOS.
INSERT INTO apicredit.usuarios_portal ( reg_status, dstrct, nombre, fecha_nacimiento,fecha_expedicion, tipo_identificacion, identificacion, email, idusuario, claveencr, fecha_ultimo_ingreso, 
empresa_ultimo_ingreso,ult_fecha_renovo_clave, num_dias_para_renovar_clave, cambioclavelogin,token_api, codigo_activacion, tipo_usuario, creation_date)
VALUES 
('', 'FINV', 'JUAN SEBASTIAN FERNANDEZ BALLESTAS', '0099-01-01', '0099-01-01', 'CED','1140897918', 'asistec.paraiso@gmail.com', 'JFERNANDEZ', 'cABRHtDTbnw=', '0099-01-01', '','0099-01-01 00:00:00', 0, true, '', '', 'E', NOW());

select * from usuarios where idusuario = 'JFERNANDEZ'

select * from  apicredit.usuarios_portal  where idusuario = 'WSUAREZ'


-----------------------------------------------------------------------------------------------------------------







 INSERT INTO apicredit.usuarios_portal ( reg_status, dstrct, nombre, fecha_nacimiento,fecha_expedicion, tipo_identificacion, identificacion, email, idusuario, claveencr, fecha_ultimo_ingreso, 
empresa_ultimo_ingreso,ult_fecha_renovo_clave, num_dias_para_renovar_clave, cambioclavelogin,token_api, codigo_activacion, tipo_usuario, creation_date)

SELECT 
'', 'FINV', nombre, '0099-01-01', '0099-01-01', 'CED', nit, email, idusuario, claveencr, '0099-01-01', '','0099-01-01 00:00:00',0, false, '', '', 'E', NOW()
from usuarios
where idusuario in
(SELECT 
                a.idusuario
            FROM asesores a 
            inner join usuarios u on (a.idusuario = u.idusuario)
            left join administrativo.empleados emp on (u.nit = emp.identificacion)
            left join administrativo.productos  prd on (emp.id_producto = prd.id)
            WHERE emp.reg_status ='' AND a.reg_status ='' --AND U.ciudad = 'SI'
	    and prd.descripcion ilike '%micro%' 
            --and u.nit =  '94499163'
            --and convenio ilike '%'||?||'%'
            ORDER BY a.idusuario ASC
) and idusuario  in ('JVILLADIEG')

select * from apicredit.usuarios_portal 
--update apicredit.usuarios_portal  set idusuario = 'SMARTINEZ1'
where identificacion = '1068657282'
select * from apicredit.pre_solicitudes_creditos  where asesor = 'SLMARTINEZ'
select * from apicredit.usuarios_portal 
--update usuarios  set email = 'smartinez1@fintra.co'
where email =  'smartinez1@fintra.co'
select * from 
insert into asesores (dstrct, idusuario) values ('FINV','EARIAS')
insert into asesores (dstrct, idusuario) values ('FINV','EGARCIAM')
select * from asesores where idusuario in ('EARIAS','EGARCIAM')
select  * from administrativo.empleados where identificacion = '22551853'

            select nombre, idusuario, claveencr  from apicredit.usuarios_portal where idusuario in (SELECT 
               u.idusuario
            FROM asesores a 
            inner join usuarios u on (a.idusuario = u.idusuario)
            left join administrativo.empleados emp on (u.nit = emp.identificacion)
            left join administrativo.productos  prd on (emp.id_producto = prd.id)
            WHERE emp.reg_status ='' AND a.reg_status ='' --AND U.ciudad = 'SI'
	    and prd.descripcion ilike '%micro%'  and u.estado = 'A' AND claveencr = 'cABRHtDTbnw=')
    