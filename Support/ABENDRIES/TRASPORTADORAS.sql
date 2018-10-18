 --OPCIONES DEL MENU
 select * from opciones_menu_modulos where modulo='transportadora' 
 
SELECT ps.codigo_proserv,ps.descripcion 
from etes.transportadoras  trans
inner join etes.config_productos_descuentos  cpd on (cpd.id_transportadora=trans.id)
inner join etes.productos_servicios_transp ps on (cpd.id_proserv=ps.id) 
where  trans.idusuario='MMUSKUS' and ps.reg_status='' and cpd.reg_status='' and trans.reg_status='';
  
select ID, idusuario ,* from etes.transportadoras where idusuario ilike '%MMUSKUS%'  ;
select id_proserv,* from etes.config_productos_descuentos where id_transportadora = 5; 
select * from etes.productos_servicios_transp where id = '1';
select * from ETES.periodicidad;
select * from usuarios where idusuario ilike '%KUS%'
  
INSERT INTO public.usuarios
(nombre, direccion, codpais, ciudad, email, telefono, tipo, nit, clientedestinat, estado, idusuario, claveencr, creation_date, id_agencia, fecha_ini_act, ult_fecha_renovo_clave, num_dias_vigencia, num_dias_para_renovar_clave, proyect_ind, accesoplanviaje, perfil, dpto, reg_status, last_update, base, cambioclavelogin, cia, idvervalor, permitir_reanticipo, fec_ultimo_ingreso, nits_propietario, publicacion, hora_zonificada, renovaciones, spool, codigo_usuario, mensaje, estado_mensaje, tipo_mensaje, fecha_final_mensaje, dstrct, empresa_ultimo_ingreso)
VALUES('TRANS SOID COLOMBIA SAS', 'CRA 59 NO 68 - 69', 'CO', 'BQ', 'CONTABILIDAD@TSCC.COM.CO', '', 'CLIENTETSP', '90066848', '', 'A', 'MMUSKUS1', 'cABRHtDTbnw=', '2018-10-16 17:50:18.280', 'OP', '2018-10-16 18:07:00.385', '2018-10-16 18:07:00.385', 360, 30, 'N', '0', 'TRANSPORTAD', '', ' ', '2018-10-16 18:07:00.385', 'COL', false, FINV, false, 'N', '2018-10-16','' , '', '00:00:00', 'N', '', 4475, , '', 'BASICO', '0099-01-01 00:00:00.000', '', 'fintra');

 
 
  SELECT  
            (select codcli from cliente where nit = tpt.identificacion order by last_update desc limit 1) as codcli
            ,tpt.id
            ,cod_transportadora
            ,razon_social
            ,identificacion
            ,prov.hc
            ,prov.tipo_doc
            ,tpt.direccion
            ,tpt.correo
            ,id_periodicidad
            ,per.descripcion AS periodicidad
            ,cupo_rotativo
            ,usu.idusuario
            ,usu.claveencr
            ,representante_legal
            ,documento_representante_legal AS doc_representante,
            usu.perfil
            ,case when (autoriza_venta) = 'S' then 'checked' else '' end as autoriza_venta
            ,COALESCE ((SELECT coddpt FROM ciudad WHERE codciu=usu.ciudad),'') AS dpto
            ,coalesce((SELECT pais FROM ciudad WHERE codciu=usu.ciudad),'') AS pais 
            ,coalesce((SELECT codciu FROM ciudad WHERE codciu=usu.ciudad),'') AS ciudad 
            ,CASE WHEN (tpt.reg_status)='A' THEN 'Inactivo' ELSE 'Activo' END AS estado 
            ,usu.estado as estado_usuarios
            ,autoriza_venta as autorizar_ventas
            FROM etes.transportadoras tpt
            JOIN etes.periodicidad per ON(per.id= tpt.id_periodicidad)
            JOIN usuarios usu ON (usu.nit = tpt.identificacion )
            JOIN proveedor prov ON (usu.nit = prov.nit)
            ORDER BY tpt.id;
            
          
           
           
           SELECT US.* 
            from etes.usuarios_agencias us
            INNER JOIN etes.agencias ag ON ag.id = us.id_agencia
            INNER JOIN etes.transportadoras trans ON trans.id = ag.id_transportadora
            WHERE id_usuario = 'MMUSKUS';
            
            select * from ETES.usuarios_agencias;
		    select * from etes.agencias;
            select * from etes.transportadoras;
            
            
            
            SELECT * from etes.usuarios_agencias us
            INNER JOIN etes.agencias ag ON ag.id = us.id_agencia
            INNER JOIN etes.transportadoras trans ON trans.id = ag.id_transportadora;
            WHERE id_usuario = ?;
            