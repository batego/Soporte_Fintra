
CREATE TABLE tem.MC17722 AS			--select * from tem.MC17722
SELECT * FROM fin.cxp_doc WHERE documento_relacionado ='MP15067';

CREATE TABLE tem.MC17722_itms AS				--SELECT * FROM  tem.MC17722_itms
SELECT * FROM fin.cxp_items_doc WHERE documento IN (select documento from tem.MC17722);
--delete FROM fin.cxp_items_doc WHERE documento IN (select documento from tem.MC17722);

--delete FROM fin.cxp_doc WHERE documento_relacionado ='MC17722';
select estado_neg,actividad,* from negocios where cod_neg='MC17722';


SELECT * FROM usuarios WHERE idusuario ='MRODRIGUEZ';
select * from apicredit.usuarios_portal where idusuario='DTATIS';
SELECT * FROM proveedor WHERE nit ='1143132566';

SELECT * FROM solicitud_persona WHERE identificacion = '32788075';
select * from solicitud_persona where numero_solicitud = '88221';

select * from solicitud_persona where numero_solicitud = '139802';