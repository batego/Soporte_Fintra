eliminar NM, S0, IA en selectrik y NM en fintra 


--SELECTRIK 12389-17
--busca documentos asociados al foms tanto selectrik como fintra
select * from opav.ofertas where num_os = 'FOMS13466-18'
select * from con.factura where ref1 in ('FOMS13466-18') order by documento
update opav.acciones set reg_status = 'A' where id_solicitud =  '925040'
--select * from opav.acciones where id_solicitud = '926502'
select * from con.factura_detalle where ref1 = 'FOMS12522-16' order by documento

--anular documentos asociados al foms en selectrik: factura NM, y S0
select * from con.factura 
--update con.factura set reg_status = 'A'
--delete from con.factura
where documento in --('NM13855_1','S00010269')
--('NM13905_1','NM13905_2','NM13905_3','NM13905_4','NM13905_5','NM13905_6','NM13905_7','NM13905_8','NM13905_9','NM13905_10','NM13905_11','NM13905_12') 
('S00010550','S00010551','S00010582','S00010583','S00010584','S00010585','S00010586','S00010587','S00010588','S00010589','S00010590','S00010591')

--('NM13910_1','NM13910_2','NM13910_3','NM13910_4','NM13910_5','NM13910_6','NM13910_7','NM13910_8','NM13910_9','NM13910_10','NM13910_11','NM13910_12');
--('S00010604','S00010605','S00010606','S00010607','S00010608','S00010609','S00010610','S00010611','S00010612','S00010613','S00010614','S00010615');





select * from con.factura_detalle
--update con.factura set reg_status = 'A'
--delete from con.factura_detalle
where documento in --('NM13855_1','S00010269')
--('NM13905_1','NM13905_2','NM13905_3','NM13905_4','NM13905_5','NM13905_6','NM13905_7','NM13905_8','NM13905_9','NM13905_10','NM13905_11','NM13905_12') 
('S00010550','S00010551','S00010582','S00010583','S00010584','S00010585','S00010586','S00010587','S00010588','S00010589','S00010590','S00010591')


--('NM13910_1','NM13910_2','NM13910_3','NM13910_4','NM13910_5','NM13910_6','NM13910_7','NM13910_8','NM13910_9','NM13910_10','NM13910_11','NM13910_12');
--('S00010604','S00010605','S00010606','S00010607','S00010608','S00010609','S00010610','S00010611','S00010612','S00010613','S00010614','S00010615');


select * from con.factura_consorcio  
--delete from con.factura_consorcio
--update con.factura_consorcio set documento_consorcio = 'NM13852_1'
where documento in (select documento from con.factura where ref1 in ('FOMS13387-18','FOMS13417-18','FOMS13369-18','FOMS12658-17','FOMS13459-18','FOMS13506-18','FOMS13443-18'))


select * from con.ingreso 
--delete from con.ingreso 
--update con.ingreso set reg_status = 'A'
where num_ingreso in ('IA489409','IA489411','IA489413','IA489415','IA489417','IA489419','IA489421','IA489423','IA489425','IA489427','IA489431','IA489433');



 
select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
--update con.ingreso_detalle set reg_status = 'A'
where factura in  --('NM13855_1','S00010269')
--('NM13905_1','NM13905_2','NM13905_3','NM13905_4','NM13905_5','NM13905_6','NM13905_7','NM13905_8','NM13905_9','NM13905_10','NM13905_11','NM13905_12') 
--and num_ingreso in  ('IA489409','IA489411','IA489413','IA489415','IA489417','IA489419','IA489421','IA489423','IA489425','IA489427','IA489431','IA489433')
('S00010550','S00010551','S00010582','S00010583','S00010584','S00010585','S00010586','S00010587','S00010588','S00010589','S00010590','S00010591')

('NM13910_1','NM13910_2','NM13910_3','NM13910_4','NM13910_5','NM13910_6','NM13910_7','NM13910_8','NM13910_9','NM13910_10','NM13910_11','NM13910_12');
('S00010604','S00010605','S00010606','S00010607','S00010608','S00010609','S00010610','S00010611','S00010612','S00010613','S00010614','S00010615');


select * from con.comprobante 
--delete from con.comprobante
--update con.comprobante set reg_status = 'A'
where numdoc in  --('NM13664_1','S00009443','IA488243')
--('NM13905_1','NM13905_2','NM13905_3','NM13905_4','NM13905_5','NM13905_6','NM13905_7','NM13905_8','NM13905_9','NM13905_10','NM13905_11','NM13905_12') 
--('S00010550','S00010551','S00010582','S00010583','S00010584','S00010585','S00010586','S00010587','S00010588','S00010589','S00010590','S00010591')
('IA489409','IA489411','IA489413','IA489415','IA489417','IA489419','IA489421','IA489423','IA489425','IA489427','IA489431','IA489433')


--('NM13910_1','NM13910_2','NM13910_3','NM13910_4','NM13910_5','NM13910_6','NM13910_7','NM13910_8','NM13910_9','NM13910_10','NM13910_11','NM13910_12');
--('S00010604','S00010605','S00010606','S00010607','S00010608','S00010609','S00010610','S00010611','S00010612','S00010613','S00010614','S00010615');
--('IA489467','IA489468','IA489469','IA489470','IA489459','IA489460','IA489461','IA489462','IA489463','IA489464','IA489465','IA489466');



select * from con.comprodet 
--delete from con.comprodet 
--update con.comprodet set reg_status = 'A'
where numdoc in  --('NM13664_1','S00009443','IA488243')
--('NM13905_1','NM13905_2','NM13905_3','NM13905_4','NM13905_5','NM13905_6','NM13905_7','NM13905_8','NM13905_9','NM13905_10','NM13905_11','NM13905_12') 
--('S00010550','S00010551','S00010582','S00010583','S00010584','S00010585','S00010586','S00010587','S00010588','S00010589','S00010590','S00010591')
('IA489409','IA489411','IA489413','IA489415','IA489417','IA489419','IA489421','IA489423','IA489425','IA489427','IA489431','IA489433')


--('NM13910_1','NM13910_2','NM13910_3','NM13910_4','NM13910_5','NM13910_6','NM13910_7','NM13910_8','NM13910_9','NM13910_10','NM13910_11','NM13910_12');
--('S00010604','S00010605','S00010606','S00010607','S00010608','S00010609','S00010610','S00010611','S00010612','S00010613','S00010614','S00010615');
--('IA489467','IA489468','IA489469','IA489470','IA489459','IA489460','IA489461','IA489462','IA489463','IA489464','IA489465','IA489466');

select * from opav.subclientes_ofertas 
--update opav.subclientes_ofertas  set factura_cliente = 'NM13852'
where id_solicitud = '926545'

select * from con.comprobante where numdoc in ('NM13852_1','NM13853_1','NM13854_1','NM13854_2','NM13854_3','NM13851_1','NM13851_2','NM13851_3','NM13851_4','NM13851_5','NM13851_6','NM13851_7','NM13851_8','NM13851_9','NM13851_10',
'NM13851_11','NM13851_12')

--FINTRA-------------------------------------------------------------------------------------------------------------------------
--anular documentos asociados al foms en fintra: factura NM, y PM
select * from con.factura where ref1 = 'FOMS13466-18' order by documento

select * from con.factura 
--delete from con.factura
--update con.factura set reg_status = 'A'
where documento in  ('NM13905_1','NM13905_2','NM13905_3','NM13905_4','NM13905_5','NM13905_6','NM13905_7','NM13905_8','NM13905_9','NM13905_10','NM13905_11','NM13905_12') 




select * from con.factura_detalle 
--delete from con.factura_detalle
--update con.factura_detalle set reg_status = 'A'
where documento in  --('NM13664_1','PM13664_1')
('NM13905_1','NM13905_2','NM13905_3','NM13905_4','NM13905_5','NM13905_6','NM13905_7','NM13905_8','NM13905_9','NM13905_10','NM13905_11','NM13905_12') 


select * from con.ingreso 
--delete from con.ingreso 
where num_ingreso in  --('NM13664_1','PM13664_1')
('NM13910_1','NM13910_2','NM13910_3','NM13910_4','NM13910_5','NM13910_6','NM13910_7','NM13910_8','NM13910_9','NM13910_10','NM13910_11','NM13910_12');


select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
where num_ingreso in  --('NM13664_1','PM13664_1')
('NM13905_1','NM13905_2','NM13905_3','NM13905_4','NM13905_5','NM13905_6','NM13905_7','NM13905_8','NM13905_9','NM13905_10','NM13905_11','NM13905_12') 


select * from con.comprobante 
--delete from con.comprobante
--update con.comprobante set reg_status = 'A'
where numdoc in  --('NM13664_1','PM13664_1')
('NM13905_1','NM13905_2','NM13905_3','NM13905_4','NM13905_5','NM13905_6','NM13905_7','NM13905_8','NM13905_9','NM13905_10','NM13905_11','NM13905_12') 


select * from con.comprodet 
--delete from con.comprodet 
--update con.comprodet set reg_status = 'A'
where numdoc in --('NM13664_1','PM13664_1')
('NM13905_1','NM13905_2','NM13905_3','NM13905_4','NM13905_5','NM13905_6','NM13905_7','NM13905_8','NM13905_9','NM13905_10','NM13905_11','NM13905_12') 



------------------------------------------------------------------

