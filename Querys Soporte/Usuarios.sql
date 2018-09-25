------  SERIES CHEQUE USUARIOS

INSERT INTO series_cheque_usuarios SELECT reg_status,dstrct,id,concepto,'ISARMIENTO',last_update,user_update,creation_date,creation_user,base  FROM series_cheque_usuarios WHERE usuario = 'CAJARAMILL'

              
-------RESTABLECER CONTRASEÑA----------------------
select * from usuarios 
--update usuarios set claveencr='uwZ6WV1LuvAhKesvhgHabQ=='
--update usuarios set idusuario = 'JBOLANO'
--update usuarios set estado = 'I'
where idusuario IN ('HFERRER')
'uwZ6WV1LuvAhKesvhgHabQ=='
select * from apicredit.usuarios_portal 
where idusuario IN ('1102810544')
--claveencr='cABRHtDTbnw='
----INHABILITAR USUARIOS--------------
SELECT * from usuarios 
--update usuarios set estado = 'I'
where idusuario in ('GESPRIELLA','JMORA','UCHARRIS')

SELECT * from usuarios 
--update usuarios set estado = 'I'
where nit in ('GESPRIELLA','JMORA','UCHARRIS')


---AÑADIR USUARIOS A LA TABLA CONSULTAS

select * from consultas where descripcion = 'CXP_USUARIO_APROBADOR'
R: 'DPALLARES,MMEDINA,HCUELLO,EDGARGM87,MCASTILLO,YOSPINA,RSALCEDO,YBALCEIRO,DLOPEZ ,DDONADO'

select * from consultas where usuario ilike '%JVERGARA%'


--añadir a una consulta en especifio.
select * from consultas
--update consultas set usuario = usuario ||' ,MCANDELA'
where descripcion ilike '%Facturas vencidas en el mes%'



select * from consultas where usuario ilike '%AMANJARRES%'

--añadir a las consultas de un usuario en especifico.
update consultas
set usuario = usuario ||' ,VBETIN'
WHERE usuario like ('%RSALCEDO%')


----------MODULO NOVEDADES
select  * from opciones_menu_modulos  
--Update opciones_menu_modulos   set usuario = usuario ||' ,MCERTAIN'
where usuario  like '%NVILLAMIZA%' 

select  * from opciones_menu_modulos  
--Update opciones_menu_modulos   set usuario = usuario ||' ,NVILLAMIZA'
where ruta ilike '%VISTO%' and usuario not like '%NVILLAMIZA%'


insert into administrativo.rel_jefatura_usuario (id, dstrct, id_proceso_interno, id_usuario,id_empresa) 
select 111, dstrct, id_proceso_interno, 'LVALENCIAR',id_empresa from administrativo.rel_jefatura_usuario  where id_usuario = 'MMAZO' and jefatura = 'N'

select * from administrativo.rel_jefatura_usuario order by id desc

select * from administrativo.rel_jefatura_usuario  where id_usuario = 'NVILLAMIZA'
------------------------------
SELECT * FROM CONSULTAS  WHERE descripcion like ('%Agrupamiento%')


--eliminar usuario de web views
--select * from consultas
update consultas 
set usuario = REPLACE(usuario,'APACHECOG','')  -- WHERE descripcion like ('%Agrupamiento%')
where usuario ilike '%FFRANCO%'



---AÑADIR USUARIO A TABLAGEN CON LOS PERMISOS DE OTRO USUARIO. Se puede verificar tambien por table_type, referencia, descripcion o dato.
select * from tablagen where table_code like '%RPATERNINA%'

insert into tablagen
(SELECT reg_status, table_type, 'EVILORIA', referencia, descripcion, 
       now(), user_update, now(), creation_user, dato, 
       dstrct
FROM tablagen
where table_code like '%RPATERNINA%' )

