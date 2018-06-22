SELECT *
FROM tablagen 
WHERE reg_status != 'A'  AND TABLE_CODE = 'FSUAREZ' LIMIT 100 AND (dato ~* '.*asignar_cartera.*' OR dato ~* '.*asesor_comercial.*')

 UPDATE tablagen SET  TABLE_CODE = 'FSUAREZ' WHERE  TABLE_CODE = 'SSUAREZ' 

select * from asesores where idusuario = 'DRBLANCO'

INSERT INTO tablagen(
            reg_status, table_type, table_code, referencia, descripcion, 
            last_update, user_update, creation_date, creation_user, dato, 
            dstrct, entidad, agencia)
    VALUES ('','PERF_ECA','LBORJA','','',NOW(),'',NOW(),'BTERRAZA','gestionar_cartera,asignar_cartera,agente_campo','','','');


