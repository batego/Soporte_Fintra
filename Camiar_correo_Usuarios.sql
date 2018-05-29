select * from con.factura 
--update con.factura set reg_status = 'A'
--delete from con.factura
where documento in ('MI99006') ,'S00010269')



select * from con.factura_detalle
--update con.factura set reg_status = 'A'
--delete from con.factura_detalle
where documento in ('MI99006'),'S00010269')


select * from negocios where cod_neg = 'MC13833' 

SELECT * FROM solicitud_persona where identificacion = '1002207527' 
update solicitud_persona set email = 'armabeja2010@hotmail.com' where identificacion = '1002207527' 


select * from solicitud_aval where cod_neg = 'MC13833'
solicitud
