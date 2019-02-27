SELECT * FROM fin.cxp_doc WHERE documento = 'EDS0000376';
select * from tablagen where table_type= 'AUTCXP' AND referencia='CXP_EDS'; --AND descripcion=usuario

--funcion que crea la cxp y asigna el aprobador 
--REVISAR 
SELECT etes.cxp_estaciones(ideds integer, fecha character varying, usuario character varying);