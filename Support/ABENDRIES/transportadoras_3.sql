SELECT ps.codigo_proserv,ps.descripcion 
from etes.transportadoras  trans
inner join etes.config_productos_descuentos  cpd on (cpd.id_transportadora=trans.id)
inner join etes.productos_servicios_transp ps on (cpd.id_proserv=ps.id) 
where  trans.idusuario='MMUSKUS' and ps.reg_status='' and cpd.reg_status='' and trans.reg_status='';
  
  
  select idusuario ,* from etes.transportadoras;
  select * from etes.config_productos_descuentos;  
  select * from usuarios where idusuario ilike '%KUS%'
  
  
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
            ,documento_representante_legal AS doc_representante
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
            INNER JOIN etes.transportadoras trans ON trans.id = ag.id_transportadora;
            WHERE id_usuario = 'MMUSKUS';
            
           
           
      32693686