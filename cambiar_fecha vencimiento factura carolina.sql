select documento,nit,cmc,creation_date,fecha_factura,periodo,fecha_contabilizacion, FECHA_VENCIMIENTO from con.factura
-- update con.factura set user_update = 'BTERRAZA' ,FECHA_VENCIMIENTO ='2018-08-02'
 where  documento in  ('MI100397')


select * from con.factura_detalle 
-- update con.factura set user_update = 'BTERRAZA' ,FECHA_VENCIMIENTO ='2018-08-02'
 where  documento in  ('MI100397')