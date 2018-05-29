select fecha_vencimiento,documento,nit,cmc,creation_date,fecha_factura,periodo,fecha_contabilizacion, * from con.factura
--update con.factura set user_update = 'BTERRAZA' , fecha_vencimiento ='2018-05-22'
 where  documento in  ('MI99006')	22/05/2018

 select * from con.factura_detalle 
--update con.factura set user_update = 'BTERRAZA' , fecha_vencimiento ='201804', fecha_contabilizacion = '2018-04-30'
 where  documento in  ('MI99007')

select creation_date,periodo, * from con.comprobante 
--update con.comprobante set user_update = 'DVALENCIA',creation_date = '2018-04-02 10:16:50.202458' --, fecha_factura = fecha_factura - 1
--update con.comprobante set creation_date = '2018-04-02',  periodo = '201804'--, fechadoc = '2018-04-31',
--update con.comprobante set fechadoc = '2018-03-31'
where numdoc in ('MI99007')  

select creation_date,periodo,* from con.comprodet
--update con.comprodet set user_update = 'DVALENCIA', creation_date = creation_date + interval '0 year 0 mons 0 week -1 day 0 hour 0 min 0 s'--, fecha_factura = fecha_factura - 1
--update con.comprodet set creation_date = '2018-04-02', periodo = '201804'
--update con.comprodet set reg_status = ''
where numdoc in  ('MI99007') 