﻿
--MULTISERVICIO FOMS13466-18

--La cabecera ya esta eliminada			select * from tem.btg_3027_1
create table tem.btg_3027_1 as
select * from con.factura  
-- DELETE FROM con.factura  
where documento in ('NM13905_8',
'NM13905_12',
'NM13905_1',
'NM13905_5',
'NM13905_7',
'NM13905_10',
'NM13905_11',
'NM13905_2',
'NM13905_3',
'NM13905_4',
'NM13905_9',
'NM13905_6'
) and reg_status = 'A' order by documento

--ELiminar detalle
create table tem.btg_3027_2 as
select * from con.factura_detalle 
-- delete from con.factura_detalle 
where referencia_1 in ('9043658','9043659') and documento in ('NM13905_8',
'NM13905_12',
'NM13905_1',
'NM13905_5',
'NM13905_7',
'NM13905_10',
'NM13905_11',
'NM13905_2',
'NM13905_3',
'NM13905_4',
'NM13905_9',
'NM13905_6'
) and reg_status = 'A' group by documento


--Eliminar cabecera contable
create table tem.btg_3027_3 as
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in ('NM13905_8',
'NM13905_12',
'NM13905_1',
'NM13905_5',
'NM13905_7',
'NM13905_10',
'NM13905_11',
'NM13905_2',
'NM13905_3',
'NM13905_4',
'NM13905_9',
'NM13905_6',
'IA489409','IA489426','IA489411','IA489413','IA489415','IA489417','IA489419','IA489421','IA489423','IA489425','IA489427','IA489431',
'IA489433'
) and reg_status = 'A'

--Eliminar detalle contable
create table tem.btg_3027_4 as			SELECT * FROM tem.btg_3027_4	
select * from con.comprodet 
--delete from con.comprodet 
where numdoc in ('NM13905_8',
'NM13905_12',
'NM13905_1',
'NM13905_5',
'NM13905_7',
'NM13905_10',
'NM13905_11',
'NM13905_2',
'NM13905_3',
'NM13905_4',
'NM13905_9',
'NM13905_6',
'IA489409','IA489426','IA489411','IA489413','IA489415','IA489417','IA489419','IA489421','IA489423','IA489425','IA489427','IA489431',
'IA489433'
) and reg_status = 'A'

--Validar las S0 de estas NM

--ELiminar cabecera IAs
create table tem.btg_3027_5 as
select * from con.ingreso 
--delete from con.ingreso 
where num_ingreso  in ('IA489409','IA489426','IA489411','IA489413','IA489415','IA489417','IA489419','IA489421','IA489423','IA489425','IA489427','IA489431',
'IA489433')

--ELiminar detalle IAs
create table tem.btg_3027_6 as
select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
where factura in  ('NM13905_8','NM13905_12','NM13905_1','NM13905_5','NM13905_7','NM13905_10','NM13905_11','NM13905_2','NM13905_3','NM13905_4','NM13905_9',
'NM13905_6')


--MULTISERVICIO FOMS13427-18

select documento from con.factura where ref1 = 'FOMS13427-18' group by documento

--La cabecera ya esta eliminada
create table tem.btg_3027_7 as			SELECT * FROM tem.btg_3027_7
select * from con.factura  
-- DELETE from con.factura  
where documento in ('NM13901_1',
'NM13901_2',
'NM13901_3',
'NM13901_4',
'NM13901_5',
'NM13901_6',
'NM13901_7',
'NM13901_8',
'NM13901_9',
'NM13901_10',
'NM13901_11',
'NM13901_12'
) and reg_status = 'A' order by documento

--ELiminar detalle
create table tem.btg_3027_8 as		SELECT * FROM  tem.btg_3027_8
select * from con.factura_detalle 
-- delete from con.factura_detalle 
where  documento in ('NM13901_1',
'NM13901_2',
'NM13901_3',
'NM13901_4',
'NM13901_5',
'NM13901_6',
'NM13901_7',
'NM13901_8',
'NM13901_9',
'NM13901_10',
'NM13901_11',
'NM13901_12'
)  and reg_status = 'A'

--Eliminar cabecera contable
create table tem.btg_3027_9 as
select * from con.comprobante 
-- delete from con.comprobante 
where numdoc in ('NM13901_1',
'NM13901_2',
'NM13901_3',
'NM13901_4',
'NM13901_5',
'NM13901_6',
'NM13901_7',
'NM13901_8',
'NM13901_9',
'NM13901_10',
'NM13901_11',
'NM13901_12',
'IA489357',
'IA489371',
'IA489373',
'IA489375',
'IA489377',
'IA489379',
'IA489359',
'IA489361',
'IA489363',
'IA489365',
'IA489367',
'IA489369'
) and reg_status = 'A'

--Eliminar detalle contable
create table tem.btg_3027_10 as			SELECT * FROM tem.btg_3027_10
select * from con.comprodet 
-- delete from con.comprodet
where numdoc in ('NM13901_1',
'NM13901_2',
'NM13901_3',
'NM13901_4',
'NM13901_5',
'NM13901_6',
'NM13901_7',
'NM13901_8',
'NM13901_9',
'NM13901_10',
'NM13901_11',
'NM13901_12',
'IA489357',
'IA489371',
'IA489373',
'IA489375',
'IA489377',
'IA489379',
'IA489359',
'IA489361',
'IA489363',
'IA489365',
'IA489367',
'IA489369'
) and reg_status = 'A'

) 

--Validar las S0 de estas NM

--ELiminar cabecera IAs
create table tem.btg_3027_11 as
select * from con.ingreso 
--delete from con.ingreso 
where num_ingreso  in ('IA489357',
'IA489371',
'IA489373',
'IA489375',
'IA489377',
'IA489379',
'IA489359',
'IA489361',
'IA489363',
'IA489365',
'IA489367',
'IA489369'
)

--ELiminar detalle IAs
create table tem.btg_3027_12 as
select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
where factura in  ('NM13901_1',
'NM13901_2',
'NM13901_3',
'NM13901_4',
'NM13901_5',
'NM13901_6',
'NM13901_7',
'NM13901_8',
'NM13901_9',
'NM13901_10',
'NM13901_11',
'NM13901_12'
) 


--MULTISERVICIO FOMS13460-18

select documento from con.factura where ref1 = 'FOMS13460-18' group by documento

--La cabecera ya esta eliminada
create table tem.btg_3027_13 as		--SELECT * FROM tem.btg_3027_13
select * from con.factura  
-- delete from con.factura 
where documento in ('NM13910_1',
'NM13910_2',
'NM13910_3',
'NM13910_4',
'NM13910_5',
'NM13910_6',
'NM13910_7',
'NM13910_8',
'NM13910_9',
'NM13910_10',
'NM13910_11',
'NM13910_12'
)  and reg_status = 'A' order by documento

--ELiminar detalle
create table tem.btg_3027_14 as			--SELECT * FROM tem.btg_3027_14
select * from con.factura_detalle 
-- delete from con.factura_detalle 
where  documento in ('NM13910_1',
'NM13910_2',
'NM13910_3',
'NM13910_4',
'NM13910_5',
'NM13910_6',
'NM13910_7',
'NM13910_8',
'NM13910_9',
'NM13910_10',
'NM13910_11',
'NM13910_12'
) and reg_status = 'A'

--Eliminar cabecera contable
create table tem.btg_3027_15 as		--SELECT * FROM tem.btg_3027_15
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in ('NM13910_1',
'NM13910_2',
'NM13910_3',
'NM13910_4',
'NM13910_5',
'NM13910_6',
'NM13910_7',
'NM13910_8',
'NM13910_9',
'NM13910_10',
'NM13910_11',
'NM13910_12',
'IA489464',
'IA489459',
'IA489460',
'IA489461',
'IA489462',
'IA489463',
'IA489465',
'IA489466',
'IA489467',
'IA489468',
'IA489469',
'IA489470') and reg_status = 'A'

--Eliminar detalle contable
create table tem.btg_3027_16 as			--select * from tem.btg_3027_16
select * from con.comprodet
-- delete from con.comprodet
 where numdoc in ('NM13910_1',
'NM13910_2',
'NM13910_3',
'NM13910_4',
'NM13910_5',
'NM13910_6',
'NM13910_7',
'NM13910_8',
'NM13910_9',
'NM13910_10',
'NM13910_11',
'NM13910_12',
'IA489464',
'IA489459',
'IA489460',
'IA489461',
'IA489462',
'IA489463',
'IA489465',
'IA489466',
'IA489467',
'IA489468',
'IA489469',
'IA489470') and reg_status = 'A'

--Validar las S0 de estas NM

--ELiminar cabecera IAs
create table tem.btg_3027_17 as
select * from con.ingreso 
--delete from con.ingreso 
where num_ingreso  in ('IA489464',
'IA489459',
'IA489460',
'IA489461',
'IA489462',
'IA489463',
'IA489465',
'IA489466',
'IA489467',
'IA489468',
'IA489469',
'IA489470'
)

--ELiminar detalle IAs
create table tem.btg_3027_18 as
select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
where factura in  ('NM13910_1',
'NM13910_2',
'NM13910_3',
'NM13910_4',
'NM13910_5',
'NM13910_6',
'NM13910_7',
'NM13910_8',
'NM13910_9',
'NM13910_10',
'NM13910_11',
'NM13910_12'
) 
