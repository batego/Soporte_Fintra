--Cambiamos el estado a Q = Estado gris
select estado_neg,actividad,* from negocios where cod_neg in('FA36918')
--update negocios set estado_neg = 'Q', actividad = 'LIQ' where cod_neg in('MC13835')

--Tabla de Backup
create table tem.LB01094_Mcamila_cab as
select * from fin.cxp_doc where documento_relacionado = 'LB01094'

create table tem.LB01094_Mcamila_det as
SELECT * FROM FIN.CXP_ITEMS_DOC WHERE DOCUMENTO IN ('FZL00446','LP0001208','LP0001209')


--consulta tabla de backup
select * from tem.MC13993_horet_det

--Eliminamos Cxps
--DELETE FROM FIN.CXP_DOC WHERE DOCUMENTO_RELACIONADO = 'LB01094'
--DELETE FROM  FIN.CXP_ITEMS_DOC WHERE DOCUMENTO IN ('FZL00446','LP0001208','LP0001209')

--verificamos contablemente, si esta se elimina el comprobante
select * from con.comprobante limit 100 where numdoc = 'MC13835'

--Actualizamos en solicitud aval el estado
select * from solicitud_aval where cod_neg = 'MC13835'
--update solicitud_aval set estado_sol = 'Q' where cod_neg = 'MC13835'








pero le debes eliminar las cxps...
y si estan contabilizadas tambien
fin.cxp_doc where documento_relacionado = 'MC13835'
zona gris es estado_neg = 'Q', actividad = 'LIQ'