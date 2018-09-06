delete from tablagen where table_code = 'JCUNHA' and last_update = '2018-09-03 17:50:33.223636'
select * from tablagen where dato ilike '%gestionar_cartera%' table_code = 'FSUAREZ'

SELECT * FROM usuarios where idusuario = 'JCUNHA'		--'q9xUcurlgF0='
update usuarios set claveencr = 'q9xUcurlgF0=' where idusuario = 'JCUNHA'		--'q9xUcurlgF0='
	--'q9xUcurlgF0='




SELECT *
FROM unidad_negocio
WHERE id IN (SELECT id_unid_negocio FROM rel_unidadnegocio_procinterno
	     INNER JOIN rel_seguimiento_cartera_unidad_negocio ON id_unidad_negocio = id_unid_negocio
             WHERE id_proceso_interno = (SELECT id FROM proceso_interno
             WHERE descripcion = 'COBRANZA ESTRATEGICA')
             AND id_usuario = 'FSUAREZ')
            ORDER BY descripcion

CREATE TABLE JCUNHA_PERFIL AS
SELECT * FROM rel_seguimiento_cartera_unidad_negocio where id_usuario = 'FSUAREZ';

INSERT INTO rel_seguimiento_cartera_unidad_negocio SELECT * FROM JCUNHA_PERFIL
UPDATE JCUNHA_PERFIL SET ID = ID + 250
SELECT * FROM JCUNHA_PERFIL