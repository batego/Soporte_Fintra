select * from administrativo.aseguradora limit 100

--Carga Macroproceso
SELECT id, descripcion FROM proceso_meta WHERE descripcion!='' ORDER BY descripcion

14 'ADMINISTRATIVO'
22 'APRENDIZ SENA'
10 'DIRECCIÓN'
21 'ERP'
11 'FINANCIERO'
12 'GESTIÓN COMERCIAL'
15 'GESTIÓN HUMANA'
20 'OPERACIONES'
13 'TI'

--Carga Proceso
SELECT * FROM proceso_interno WHERE dstrct = 'FINV' and id_proceso_meta = 14 ORDER BY descripcion


--Cargar linea de negocio
  select pm.descripcion as macroproceso, p.descripcion as proceso, u.id, u.descripcion as linea_negocio--, pr.descripcion as producto
    from proceso_meta pm
    left join proceso_interno p on p.id_proceso_meta=pm.id
    left join rel_unidadnegocio_procinterno r on r.id_proceso_interno=p.id
    left join unidad_negocio u on u.id=r.id_unid_negocio
    --left join administrativo.productos pr on pr.id_linea_negocio=u.id
    where p.dstrct = 'FINV' and r.id_proceso_interno= 27


    select * from proceso_meta where descripcion !=''
    select * from proceso_interno where id = 13
    select * from rel_unidadnegocio_procinterno where id = 26
    select * from unidad_negocio where id = 5


SELECT * FROM administrativo.fondo_pensiones order by reg_status
              
-- update administrativo.fondo_pensiones set reg_status = 'I' where id = '1'
-- update administrativo.fondo_pensiones set descripcion = 'NO APLICA' where id = '9'

--Cargar AFP

	select * from administrativo.fondo_pensiones
 SELECT
                id
                ,case when (reg_status)='' or id = 1 then'Activo' else 'Inactivo' end as estado
                ,nit
                ,digito_verificacion
                ,descripcion
                ,case when (reg_status)='' then 'checked' else '' end as cambio
            FROM administrativo.fondo_pensiones
            where id in(2,3,4,1,9)
            order by id

--Cargar cesantias
 SELECT         id
                ,case when (reg_status)=''then'Activo' else 'Inactivo' end as estado
                ,nit
                ,digito_verificacion
                ,descripcion
                ,case when (reg_status)='' then 'checked' else '' end as cambio
            FROM administrativo.fondo_pensiones
            WHERE reg_status != 'I'
            order by id

 --Causales de retiro
  SELECT
                id
                ,case when (reg_status)=''then'Activo' else 'Inactivo' end as estado
                ,descripcion
                ,case when (reg_status)='' then 'checked' else '' end as cambio
            FROM administrativo.causales_retiro  
            order by id

--CAMPO TERMINACION DE CONTRATO: Reemplazar CONCILIACION LABORAL por MUTUO ACURDO.
--  update administrativo.causales_retiro set descripcion = 'MUTUO ACUERDO' where  id = '6'

--Query cargar AFP Original
--  SELECT
--                 id
--                 ,case when (reg_status)=''then'Activo' else 'Inactivo' end as estado
--                 ,nit
--                 ,digito_verificacion
--                 ,descripcion
--                 ,case when (reg_status)='' then 'checked' else '' end as cambio
--             FROM administrativo.fondo_pensiones
--             order by id

  