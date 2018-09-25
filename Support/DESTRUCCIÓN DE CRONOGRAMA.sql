SELECT
    tipo,id_actividad, ap.responsable, peso, 
    (fecha_inicial::date - ofo.fecha_inicial_oferta::Date + 1) AS fecha_inicial,
    (fecha_final::date - ofo.fecha_inicial_oferta::Date + 1) AS fecha_final, ap.reg_status
FROM
    opav.accion_programacion ap inner join opav.actividades a on (a.id=id_actividad)
INNER JOIN opav.acciones acc ON acc.id_accion = ap.id_accion
INNER JOIN opav.ofertas ofo ON ofo.id_solicitud = acc.id_solicitud
WHERE
    ap.reg_status!='A' and
    ap.id_accion=9044442
      order by fecha_inicial::date ;
---------------------------------------------------------------------------------------------------
--  FOMS13760-18 EDIFICIO GEARDINO   
     
CREATE TABLE TEM.ACTIVIDADES_9044442 AS     
SELECT * FROM  opav.accion_programacion WHERE id_accion = '9044442';                
--DELETE FROM   opav.accion_programacion WHERE id_accion = '9044442'; 

CREATE TABLE TEM.OFER_EJEC_9044442 AS 
SELECT * FROM OPAV.oferta_ejecucion WHERE id_accion = '9044442';
--delete FROM OPAV.oferta_ejecucion WHERE id_accion = '9044442';

CREATE TABLE TEM.OFE_EJE_926978 AS
SELECT * FROM opav.oferta_ejecucion WHERE id_accion IN (SELECT id_accion FROM opav.acciones WHERE id_solicitud = 926978) AND creation_user = 'JSANMARTIN'; 
--DELETE FROM opav.oferta_ejecucion WHERE id_accion IN (SELECT id_accion FROM opav.acciones WHERE id_solicitud = 926978) AND creation_user = 'JSANMARTIN';
INSERT INTO 

--CREATE TABLE TEM.SEG_EJE_926978 AS
SELECT * FROM OPAV.accion_programacion WHERE id_accion IN (SELECT id_accion FROM opav.acciones WHERE id_solicitud = 926978) AND creation_user = 'JSANMARTIN';
--DELETE FROM OPAV.accion_programacion WHERE id_accion IN (SELECT id_accion FROM opav.acciones WHERE id_solicitud = 926978) AND creation_user = 'JSANMARTIN';
INSERT INTO OPAV.accion_programacion SELECT * FROM TEM.SEG_EJE_926978;


----------------------------------------------------------------------------------------------------
--FOMS13761-18 EDIFICIO DESTINY

CREATE TABLE TEM.ACTIVIDADES_9044341 AS     
SELECT * FROM  opav.accion_programacion WHERE id_accion = '9044341';                
--DELETE FROM   opav.accion_programacion WHERE id_accion = '9044341'; 

CREATE TABLE TEM.OFER_EJEC_9044341 AS 
SELECT * FROM OPAV.oferta_ejecucion WHERE id_accion = '9044341';
--delete FROM OPAV.oferta_ejecucion WHERE id_accion = '9044341';

CREATE TABLE TEM.OFE_EJE_926972 AS
SELECT * FROM opav.oferta_ejecucion WHERE id_accion IN (SELECT id_accion FROM opav.acciones WHERE id_solicitud = 926972) AND creation_user = 'JSANMARTIN'; 
--DELETE FROM opav.oferta_ejecucion WHERE id_accion IN (SELECT id_accion FROM opav.acciones WHERE id_solicitud = 926972) AND creation_user = 'JSANMARTIN';
INSERT INTO 

CREATE TABLE TEM.SEG_EJE_926972 AS
SELECT * FROM OPAV.accion_programacion WHERE id_accion IN (SELECT id_accion FROM opav.acciones WHERE id_solicitud = 926972) AND creation_user = 'JSANMARTIN';
--DELETE FROM OPAV.accion_programacion WHERE id_accion IN (SELECT id_accion FROM opav.acciones WHERE id_solicitud = 926972) AND creation_user = 'JSANMARTIN';
--INSERT INTO OPAV.accion_programacion SELECT * FROM TEM.SEG_EJE_926972;
