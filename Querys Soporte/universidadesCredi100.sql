select * from prov_convenio  where id_convenio = 17  order by nombre_afiliado
select * from prov_convenio where nit_proveedor = '8600786431'

select pc.nit_proveedor,p.payment_name,* 
from usuario_prov_convenio upc 
INNER JOIN prov_convenio pc ON upc.id_prov_convenio = pc.id_prov_convenio
INNER JOIN proveedor p ON pc.nit_proveedor = p.nit
where upc.id_prov_convenio = '17'



select * from prov_convenio where nit_proveedor in ('8600786431','8901081391')
select * from proveedor where nit = '8002489262'

select * from usuario_prov_convenio where id_prov_convenio = '17'

---Universidades Credi 100
SELECT  
                    DISTINCT pc.nit_proveedor as nit_afiliado,check_api,
                    pc.nombre_afiliado as nombre_afiliado, --pc.nombre_afiliado
                    p.cod_fenalco,
                    ref_4,
                    run.id_convenio,
                    producto
                FROM prov_convenio pc
                LEFT JOIN proveedor p ON (pc.nit_proveedor = p.nit )
                LEFT join rel_unidadnegocio_convenios run on (run.id_convenio=pc.id_convenio)
                LEFT join unidad_negocio un on (un.id=run.id_unid_negocio)
                where check_api='S' and ref_4 ='FENALCO_ATL'
                and nit_proveedor !='8020220161' and nit_Afiliado = '9004487733'
                AND cod_fenalco !=''
                order by pc.nombre_afiliado 

select * from rel_unidadnegocio_convenios where id_convenio = 19
select * from unidad_negocio where id in (10,11,14,15,18,19,20,8)



select * from convenios order by id_convenio
select * from rel_unidadnegocio_convenios --where id_unid_negocio = 17
--update rel_unidadnegocio_convenios set check_api='S'
where id_convenio in (17) and id_unid_negocio = 2


--Se debe poner el nombre de afiliado
select * from prov_convenio 
--update prov_convenio  set nombre_afiliado = 'INSTITUTO TECNICO CARL ROS'
where nit_proveedor in ('9004487733')
'8000366521'
'8000366521'
select * from proveedor 
--update proveedor set cod_fenalco = '030906501'
where nit = '8000366521'


--QUERY USUARIOS-AFILIADOS

SELECT DISTINCT pc.nit_proveedor,p.payment_name, upc.id_prov_convenio
            FROM (usuario_prov_convenio upc INNER JOIN prov_convenio pc ON upc.id_prov_convenio = pc.id_prov_convenio)
                    INNER JOIN proveedor p ON pc.nit_proveedor = p.nit
            WHERE upc.idusuario = 'DVALENCIA' AND upc.reg_status='';


            ---ASOCIAR AFILIADO AUTONOMA DEL CARIBE A LOS USUARIOS
 insert into usuario_prov_convenio (idusuario, id_prov_convenio, creation_user, user_update) values ('ASANJUAN',549, '', '')
 insert into usuario_prov_convenio (idusuario, id_prov_convenio, creation_user, user_update) values ('ACEQUEA',549, '', '')
 insert into usuario_prov_convenio (idusuario, id_prov_convenio, creation_user, user_update) values ('OCOLINA',549, '', '')
 insert into usuario_prov_convenio (idusuario, id_prov_convenio, creation_user, user_update) values ('DMORENO',549, '', '')