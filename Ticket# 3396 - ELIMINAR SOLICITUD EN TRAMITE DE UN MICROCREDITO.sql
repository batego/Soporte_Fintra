

-----------------------------------------------------------------------


--SOLICITUD AVAL #CONTIENE microcredito

--El campo id_convenio me relaciona la solicitud con el convenio, cod_neg me relaciona con el negocio el nombre del cliente lo relaciono con el numero de la  socilicitud 
--en la tabla aval tengo la informacion para todos los negocios  
select *,id_convenio, numero_solicitud, estado_sol,cod_neg  from solicitud_aval  where cod_neg in (?)-- and creation_date>=?  --  numero_solicitud =?
select *,id_convenio, numero_solicitud, estado_sol,cod_neg  from solicitud_aval where numero_solicitud in (?)

-->estas tablas se relacionan con el numero de la solicitud que esta en el aval
select * from solicitud_bienes where numero_solicitud = ?
select * from solicitud_cuentas where numero_solicitud = ?
select * from solicitud_documentos where numero_solicitud = ?
select * from solicitud_estudiante where numero_solicitud = ?
select * from solicitud_hijos where numero_solicitud = ?
select * from solicitud_persona where numero_solicitud = ?
select * from solicitud_laboral where numero_solicitud = ?
select * from solicitud_negocio where numero_solicitud = ?
select * from solicitud_referencias where numero_solicitud = ?
select * from solicitud_vehiculo where numero_solicitud = ?


select * from solicitud_persona 
--update solicitud_persona set --email =?
where identificacion = ? and tipo = ?
--tipo_vivienda 01 propia, 02 arrendada, 03 familiar

select * from cliente 
--update cliente set nomcli = ?
where nit in (?)

/* si en tabla nit --estado =A, no se crea como afiliado */
select * from nit  where
--update nit set nombre = where
 cedula in (?)

select * from proveedor where
--update proveedor set payment_name = ? where
 nit in (?)

 -----------------------------------------------------------------------
--me muestra el negocio y sus propiedades---
select *,cod_neg, estado_neg, id_convenio, actividad, valor_remesa,tasa, nit_tercero, financia_aval from negocios  where  cod_neg in ('mc13835') 

SELECT * from negocios where cod_cli = ?
-- tabla GEN: Raro Concepto!
ref, for, dec 
select table_type,table_code,referencia,descripcion,dato from tablagen 
where table_type='ESTADO_NEG'
    
--CAMBIAR CONVENIO DEL NEGOCIO-----------

--update negocios set id_convenio = '16' where cod_neg = ?
--update solicitud_aval set id_convenio = '16' where cod_neg = ?

--------------------ACTUALIZACION DE ESTADOS-----------------

--**actulizar estado del negocio en la tabla negocios**--

--update negocios set estado_neg = 'A' where cod_neg in(?)

--**actualizacion masiva estado en la tabla negocios**--
--update negocios set estado_neg = 'T' where cod_neg in(?)

--**actualizar estado del aval del negocio**--
--update solicitud_aval set estado_sol = 'A' where numero_solicitud=?  cod_neg  in(?)

--**actualizar estado del aval del negocio masivamente**--
--update solicitud_aval set estado_sol = 'R' where numero_solicitud in (?)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--departamento de riesgos cambiar el nombre de afiliado en la tabla clientes y solicitud persona y tabla negocios nit tercero---
-- para cambiar un campo del nombre se consulta primero en el query 2

--*1*--
select *,id_convenio, numero_solicitud, estado_sol from solicitud_aval where numero_solicitud in (?)  --?

--*2*--
select * from solicitud_persona where identificacion=?

--*3*-mostrar convenios comercial para ser asignados a un usuario--
SELECT  * FROM usuario_prov_convenio where  idusuario= ? limit 10
SELECT  * FROM prov_convenio where id_prov_convenio= ?

--*4*-para cambiar nit del cliente se cambia en solicitud_persona y en la tabla negocios.
--aqui se ve la info de las personas en el num de solicitud y poder hacer los cambios
SELECT *, numero_solicitud FROM solicitud_persona  WHERE numero_solicitud  = ?
--update solicitud_persona set --user_update = 'MMEDINA', primer_nombre = ?, nombre= ? WHERE numero_solicitud= ? and tipo = --'S'

select *,cod_neg, estado_neg, id_convenio from negocios where cod_neg = ?


SELECT  * FROM cliente  
--update solicitud_persona set -- user_update = 'MMEDINA',nombrecli =? 
where nomcli in (?)
SELECT  * FROM proveedor  where nit = ?
SELECT  * From nit where cedula = ?


--condiciones de aval tablas prov_convenio(para buscar el ide del aval del proveedor)
--tabla condiciones_aval y condiciones_aval_rangos-- 

--Historia de crédito Fenalco Atlántico se consulta en el esquema wsdc las tabla historico_peticiones--
SELECT * From wsdc.historico_peticiones where respuesta='F02' id_consulta=?
SELECT * From wsdc.persona  where identificacion=?
SELECT * From wsdc.respuesta_personalizada   where identificacion=?
SELECT * From wsdc.codigo  where codigo='F02'

----------------------------------------------------------------------------------------------------------
--cosulta masiva
select *,cod_neg, estado_neg, id_convenio, actividad from negocios 
--update negocios set estado_neg = 'R' 
where cod_neg in('LB00069')
----------------------------------------------------------------------------------------------------------

select *,id_convenio, numero_solicitud, estado_sol,cod_neg  from solicitud_aval 
---update solicitud_aval set estado_sol = 'R' 
where cod_neg in('LB00069')
----------------------------------------------------------------------------------------------------------
--CONSULTAR CONSECUTIVOS--
Select *,negasoc,num_doc_fen From con.factura  where negasoc='FA00281' 8020175384
Select * From con.factura_detalle    where documento='FC0487901'
Select *, item From documentos_neg_aceptado where  cod_neg='FA00281'

----PROBLEMA DEL AVAL ---
SELECT *
FROM   documentos_neg_aceptado  --order by cod_neg,item, creation_date    
WHERE  
reg_status!='A' AND cod_neg='FA00510'
ORDER BY fecha;


-------generacion del aval primera cuota--------
SELECT *
FROM   documentos_neg_aceptado	 --order by cod_neg,item, creation_date --1665128			
WHERE 	
reg_status!='A' AND cod_neg='FA00617'
ORDER BY fecha; 

-----VERIFICAR OFICINA PRINCIPAL DE UN USUARIO ------
SELECT id_agencia,* FROM usuarios where idusuario in ('PARIZA','PPLATA','MESCOBAR','SANDRADE','DCAMPO','SBLANCO','DMARTINEZ','LMERINO','DYEPEZ','YCASTILLA')


----------------------CONVENIOS DE AFILIADOS FENALCO ATLANTICO------------------

SELECT pc.id_prov_convenio,
                   pc.id_convenio,
                   c.nombre as nom_convenio,
                   pc.cod_sector,
                   CASE WHEN c.redescuento=true THEN
                   s.nombre  ELSE s.nombre_alterno END as nom_sector ,
                   pc.cod_subsector,
                   CASE WHEN c.redescuento=true THEN
                   ss.nombre ELSE ss.nombre_alterno END as nom_subsector,
                   c.factura_tercero,
                   c.nit_tercero,
                   c.redescuento
            FROM convenios c
            JOIN prov_convenio pc
              on c.id_convenio = pc.id_convenio
              and pc.reg_status!='A'
            join usuario_prov_convenio upc
              on upc.id_prov_convenio = pc.id_prov_convenio
            join sector s
              on s.cod_sector=pc.cod_sector
            left join subsector ss
              on ss.cod_sector = pc.cod_sector
             and ss.cod_subsector = pc.cod_subsector
            WHERE pc.nit_proveedor = '8901176833'
              and upc.idusuario = '890117683'  and upc.reg_status!='A'

SELECT * FROM usuario_prov_convenio where idusuario = ?

SELECT * FROM usuario_prov_convenio where idusuario = ?

SELECT * FROM prov_convenio where nit_proveedor = '' id_prov_convenio in ('792')


----------------------------------SOLICITUD EN TRAMITES------------------------------------
--cuando el estado de solicitud no esta actualizado no se puede realizar otro negocio debe actualizarse 

select distinct on (sa.numero_solicitud) estado_sol,sa.cod_neg,ng.estado_neg,ng.actividad, sa.numero_solicitud,* from solicitud_aval sa  inner join solicitud_persona sp
    on(sp.numero_solicitud=sa.numero_solicitud)
    LEFT JOIN negocios ng ON ng.cod_neg = sa.cod_neg
    where
    identificacion in ('72341863')and 
    estado_sol not in ('A','R','T') and ng.estado_neg not in ('T')
    limit 5
--T transferido | A aprovado | R rechazado | P aceptado
--update solicitud_aval set estado_sol = 'R' where
 numero_solicitud in (78055,78564)
)

select cod_neg,estado_neg from negocios
--select cod_neg, estado_sol, numero_solicitud from solicitud_aval
--update solicitud_aval set estado_sol = 'P' 
--update negocios set estado_neg = 'P' 
where cod_neg in('LB00683','LB00679')

select * from solicitud_aval where numero_solicitud  =98040
select * from solicitud_persona 
--update solicitud_persona set reg_status = ''
where numero_solicitud in (98648)


SELECT * from 3334500
--------------------NEGOCIO---------------------------------------------------------------
--el sistema rechaza por vencimiento de --update negocios set actividad = 'DEC' where cod_neg in('FA02033')tiempo o por numero de ingresos (max 3), debe cambiar el estado_sol a P  consulta 1 y 2 
--para cambiar el estado se realiza en las dos consultas 1 y 2
-- PARA ESTAR EN CADA ACTIVIDAD debe tener los valores q aparecen abajo actividad y estado respectivamente 
--LIQUIDACION : SOL ; P
--RADICACION : LIQ ; P
--REFERECIACION : RAD ; P
--ANALISIS : REF ; P
--DECISION : ANA ; P
 --FORAMLIZACION : DEC ; V
--RELIQUIDAR : LIQ ; Q  -----> ELIMINAR LA TRAZABILIDAD
--DESEMBOLSO: FOR; A
--STBY--
--*1*--
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios --where actividad = 'DEC' and estado_neg = 'V'
--update negocios set update_user = 'DVALENCIA',actividad = 'DEC', estado_neg = 'V'---, --vr_negocio = ?
--update negocios set update_user = 'DVALENCIA', estado_neg = 'T'
--SOL | LIQ | RAD | REF | ANA | DEC | FOR | REG | PER
--A aprobado | R rechazado | P aceptado | V avalado | D desistido |Q preaceptado
where  --cod_cli = '45763448'
cod_neg in  ('mc13835')

select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento  from negocios where cod_neg in ('LB00827','LB00830')
select * from negocios_trazabilidad where cod_neg ='MC12979' --- AND usuario = 'DVALENCIA'--'2017-06-29 17:50:25.07514' AN
select * from negocios_standby  where cod_neg ='MC12979' AND ACTIVIDAD = 'STBY'

--REACTIVAR NEGOCIO POR STAND BY
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'DVALENCIA',actividad = 'LIQ', estado_neg = 'P' 
where  cod_neg in ('MC13104')

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '115396'
--update solicitud_aval set estado_sol= 'V' 
where cod_neg in ('LB01044')

select * from solicitud_persona 
--update solicitud_persona set reg_status = ''
where numero_solicitud in (115396)


select * from apicredit.pre_solicitudes_creditos  --where identificacion = '1070820516'
--update apicredit.pre_solicitudes_creditos  set estado_sol= 'R'
where numero_solicitud in (115542,115723)

select * from solicitud_persona where  identificacion = '73111670'

update negocios set estado_neg = 'D' where cod_neg in  ('MC08215','MC08249')
select estado_sol, cod_neg, numero_solicitud from solicitud_aval  where cod_neg in ('LB00816')--cod_neg in ('FA27825')
update solicitud_aval set estado_sol= 'P' where cod_neg in ('MC08568')
cod_neg in ('LB00640')

select * FROM negocios_trazabilidad where cod_neg in ('LB01044') order by fecha

--num_fac_venta_aval in (?)

select * from tablagen where table_type = 'TIPO_RAD' and table_code = 'AVENDRIES'

SELECT * FROM series where prefix ='FB'
--update negocios set num_fac_venta_aval = '', fecha_factura_aval = null where cod_neg = 'FB02289'

SELECT num_fac_venta_aval,* FROM negocios where num_fac_venta_aval like '%FB%' 
order by num_fac_venta_aval desc

--SOLICITUD AVAL--
--en esta consulta si en el formulario no aparece el numero de plazo se cambia el campo  plazo_pr_cuota = '30' con el numero de solicitud 

--*2*--
---aqui se puede cambiar el asesor de un negocio 
select estado_sol, plazo_pr_cuota, numero_solicitud, * from solicitud_aval --limit 1
--update solicitud_aval set user_update --= 'MMEDINA',estado_sol = 'P'--- plazo_pr_cuota = '30'--
where cod_neg in ('LB00683','LB00679')--numero_solicitud = '?' --


---TRAZABILIDAD ---------
Select * from negocios_trazabilidad where cod_neg = ?--numero_solicitud 

--eliminar registro extra, si es necesario
--update negocios_trazabilidad set --user_update = 'MMEDINA',comentarios = ? where 
 actividad = 'DEC' and cod_neg = 'FA18063'

select estado_sol,cod_neg,* from solicitud_aval where numero_solicitud  ='115723'




----------DISTRIBUCION--------------------
--Estados De Oferta--
--000: Rechazado-----
--Estudio: Estudio---
--010: Aprobado------
-- no pueden pasar de estado de aprobado a estudio --ca,po estudio_cartera

select id_solicitud, tipodistribucion, tipo_solicitud,porc_opav, porc_fintra, porc_interventoria, porc_provintegral,porc_eca, porc_iva
from opav.ofertas, opav.tipo_distribucion_eca where id_solicitud in (924875) 
and tipodistribucion = tipo

select * from opav.tipo_distribucion_eca 

---CAMBIO DE TIPO DE SOLICITUD Y DISTRIBUCION
select id_solicitud, tipodistribucion, tipo_solicitud,* from opav.ofertas
--update opav.ofertas set tipodistribucion = '61', tipo_solicitud = 'Valor agregado_clientes__1'
where id_solicitud in (924875) 

select estudio_cartera ,* from opav.ofertas where
--update opav.ofertas set estudio_cartera = '010' where 
 id_solicitud in ('925563')

 ------agregar distribucion -----TIPO_DISTR --TIPO_OFERT

 SELECT table_code AS codigox, table_code AS descripcionx FROM tablagen WHERE table_type='TIPO_OFERT' and reg_status ='' ORDER BY table_code 

-----------------------------------------------
-----------------------------------------------
---al cambiar un estado de una solicitud se realiza cambio de cartera en ofertas y el estado en acciones a y b
-->cuando se refiere a cambiar un id  --*a
select estudio_cartera,* from opav.ofertas 
--update opav.ofertas set user_update = 'DVALENCIA', reg_status= 'A'---estudio_cartera ='Estudio' ----descripcion=replace(descripcion,'%',' porciento ')
where 
id_solicitud in ('926314') 
AND descripcion ~* '.*%.*'
select * from opav.ofertas where num_os = 'FOMS12809-17'
select * from con.factura where ref1 ='FOMS10822-15' or ref2 ='FOMS10822-15'
----------LIQUIDADOR DE SOLICITUDES-------
---->para cambiar de ingresar open a por ingresar en open la consulta 1 se cambia el campo estado y prefacturar debe estar en N

--Codigos--
--000->PENDIENTE POR VALIDAR CARTERA		|	--005->RECHAZADA POR CARTERA
--010->PENDIENTE POR ASIGNAR CONTRATISTA	|	--020->PENDIENTE POR HACER VISITA tipo trabajo
--030->PENDIENTE POR HACER COTIZACION		|	--040->PENDIENTE POR GENERAR OFERTA
--050->PENDIENTE POR ENTREGAR OFERTA		|	--055->PENDIENTE POR REVALUAR OFERTA
--060->PENDIENTE POR ACEPTACION DEL CLIENTE	|	--070->PENDIENTE POR GENERAR OT
--080->PENDIENTE POR RECEPCION DE OBRA		|	--085->NO CONFORME
--090->RECEPCION DE OBRA			|    ***--100->POR INGRESAR EN OPEN
--110->INGRESADO EN OPEN ***			|	--667->OFERTA DENEGADA				
--670->DOBLE DISTRIBUCION PARA MS

--*1*-- b
select prefacturar,estado,factura_contratista,facturado,* from opav.acciones --limit 1
--update opav.acciones set  estado='080'--,facturado ='N'
--delete from opav.acciones 
where id_solicitud in('924677') and reg_status = ''
and reg_status = '' 


--DESMARCAR FACTURA CLIENTE CUANDO SE ANULAN Y SE VUELVE A FACTURAR.
select  factura_cliente,* from opav.subclientes_ofertas 
--update opav.subclientes_ofertas set factura_cliente = ''
where id_solicitud in('925040')

select * from opav.ofertas where num_os = 'FOMS12809-17'
--modificar contratista
select contratista, id_accion,id_solicitud, estado from opav.acciones
--update opav.acciones set  contratista='CC764'
where contratista = 'CC764' and estado!=110 

select * from tablagen where table_type ='ESTADO_ECA'

--------LIQUIDADOR------------------------
select cod_neg, case when reg_status = '' then 'ACTIVO' else 'ANULADO' end as estado, creation_date, saldo_inicial, capital, interes, valor, saldo_final, remesa, * 
from documentos_neg_aceptado 
where cod_neg in (?) --substring(creation_date,1,4) = ? 
and substring(cod_neg,1,2) in ('FA','FB','NG') 
order by creation_date


select  negasoc, * from con.factura Where documento = ?
select  * from con.factura Where negasoc = ?

-------numeros cheque (num_titulo)--------

select * from solicitud_documentos where numero_solicitud in (?)

-------TABLAGEN-------------
SELECT * FROM tablagen  
WHERE table_type='SALTADATA' AND referencia='SALTAR_DATA_AAAE' 
AND  table_code=?

------------opav materiales no aparecen------------
SELECT consecutivo,fecha,id_accion, 
	(select count(*) from opav.cotizaciondets 
	where cod_cotizacion=cot.consecutivo and reg_status = '') AS detalles
FROM opav.cotizacion cot
--update opav.cotizacion set reg_status = 'A'
WHERE id_accion=? AND reg_status != 'A'

-------------------------------------------------------------------------------------------
---------------------COLOMBIA MOVIL--------------------------------------------------------
--> cuando no apaprece los datos del nic
---relacionar en la tabla clientes_eca_nics nic y ver si aparece el id _cliente indicado
SELECT    nic,  titular,  direccion,  telefono,  estrato ,  calificacion
            FROM    opav.clientes_electricaribe
            WHERE titular ~* '.*COLOMBIA MOVIL.*'
and 
            nic in ('6527543') ;


select * from opav.clientes_eca_nics  where nic = 6527543 

---------------------------------------------------------------------------------

              
-------RESTABLECER CONTRASEÑA----------------------
select * from usuarios 
-- update usuarios set claveencr='cABRHtDTbnw=' ,cambioclavelogin ='true' ---, estado = 'I'
where idusuario ilike '%DVALENCIA%'


------------imprimir factura y pagare----------------

SELECT *
FROM tablagen
WHERE table_type='SECURE_ECA' 
AND  upper(TABLE_CODE) in (upper('GESPRIELLA73142432')) AND upper(referencia)=upper('73142432')

-----------PERMISO EXPOR..----------------------------
select * from tablagen where table_type = 'TFORMATOS' AND dato ILIKE  '%DLOVERA%'



-------------------------eds
select * from login_estacion_descuento where loginx in ('HTOCANCIPA','ESIBERIA','ESTRELLA')

select * from estacion_gasolina limit 100

--------------------------AGENTE DE CAMPO----------------------------------------
SELECT table_code as id, table_code as valor
FROM tablagen
WHERE reg_status != 'A'
AND dato ~* '.*agente_campo.*';   


--------------PERMISOS FENALCO-----------------------------------------------
SELECT  * FROM tablagen  
where table_code='MMEDINA' and table_type ='PER_FENALC'


SELECT  * FROM tablagen  
where table_code='MMEDINA' and table_type ='PERMISOSFB'

SELECT  * FROM tablagen  where
-- update tablagen set reg_status ='A' where 
 table_code='MMEDINA' and table_type ='TODOSCONV'

SELECT  * FROM tablagen  
where table_code='MMEDINA' and table_type ='TIPO_RAD'

SELECT  * FROM tablagen  where
-- update tablagen set reg_status ='A' where 
 table_code ='MMEDINA' and table_type ='USUAMONTO'


---------------darle permisos a los usuarios para agregar garantías fasecolda
SELECT * 
FROM tablagen 
WHERE table_type='SECURE_ECA' 
AND  upper(TABLE_CODE)=upper('TSPUSER1042996816')
 AND upper(referencia)=upper('1042996816')

----------- asignacion de cartera --------------
SELECT table_code as id, table_code as valor
            FROM tablagen
            WHERE reg_status != 'A'
            AND dato ~* '.*asignar_cartera.*'

 
---banco moculo transferir negocio 
--xml : SQL_BANCOS_NEGOCIOS dao.xml : NegociosDao.xml
select branch_code,bank_account_no,account_number,branch_code ||' '|| bank_account_no ||' '|| account_number as nombre 
            from banco
            where  account_number in ('69225845948','69226034878','802017087','111111111','69226034879','69260577298','000000000011','000000000000000001','890104964','000000000001') 
	    and branch_code NOT IN ( 'CAJA GD PROVINT','CAJA REFI MICRO')
            order by 1


---  BANCOS MODULO TRANSFERENCIA ANTICIPOS -----

            SELECT
                   table_code, table_type,
                   descripcion,
                   referencia
            FROM   tablagen
            WHERE  table_type = '802022016'
            ORDER BY descripcion

select * from apicredit.pre_solicitudes_creditos  where numero_solicitud like '%121081%'

-- create table MC_SA_7375761 as
select * from solicitud_aval where numero_solicitud = 121081
delete from solicitud_aval where numero_solicitud = 121081

-- create table MC_SN_7375761 as
select * from solicitud_negocio  where numero_solicitud = 121081
-- delete from solicitud_negocio  where numero_solicitud = 121081


--create table MC_7375761 as 
select * from solicitud_persona   where numero_solicitud = 121081 and identificacion = 7375761
--delete from solicitud_persona   where numero_solicitud = 121081 and identificacion = 7375761
select * from MC_7375761

-- create table MC_SR_7375761 as
select * from solicitud_referencias where numero_solicitud = 121081
-- delete from solicitud_referencias where numero_solicitud = 121081
-- select * from MC_SR_7375761

-- create table MC_SD_7375761 as
select * from solicitud_documentos   where numero_solicitud = 121081

-- create table MC_SL_7375761 as
select * from solicitud_laboral    where numero_solicitud = 121081 
-- delete from solicitud_laboral    where numero_solicitud = 121081 


select * from solicitud_actividad_economica where numero_solicitud = 121081

-- create table MC_Cu_7375761 as
select * from solicitud_cuentas where numero_solicitud = 121081
-- delete from solicitud_cuentas where numero_solicitud = 121081

-- create table MC_SH_7375761 as
select * from solicitud_hijos where numero_solicitud = 121081
-- delete from solicitud_hijos where numero_solicitud = 121081


 SELECT monto_minimo, monto_maximo
 fROM convenios
 WHERE reg_status!='A' AND id_convenio=43;
