﻿--Notas a Eliminar :NC037460 - NC037735
select * from tem.Nota_3565_CAB_ING

CREATE TABLE tem.Nota_3565_CAB_ING AS 
-- delete FROM con.INGRESO where num_ingreso in ('IA489436',
-- 'IA489438',
-- 'IA489440',
-- 'IA489442',
-- 'IA489444',
-- 'IA489446',
-- 'IA489448',
-- 'IA489450',
-- 'IA489452',
-- 'IA489454',
-- 'IA489456',
-- 'IA489458',
-- 'IA489394',
-- 'IA489396',
-- 'IA489398',
-- 'IA489400',
-- 'IA489402',
-- 'IA489352',
-- 'IA489354',
-- 'IA489356',
-- 'IA489430',
-- 'IA489350',
-- 'IA489358',
-- 'IA489360',
-- 'IA489362',
-- 'IA489364',
-- 'IA489366',
-- 'IA489368',
-- 'IA489370',
-- 'IA489428',
-- 'IA489432',
-- 'IA489434',
-- 'IA489412',
-- 'IA489414',
-- 'IA489416',
-- 'IA489418',
-- 'IA489420',
-- 'IA489422',
-- 'IA489424');
--DELETE FROM INGRESO where num_ingreso = 'NC037735';


--CREATE TABLE tem.Nota_3565_det_ING AS 
delete FROM con.ingreso_detalle where num_ingreso in ('IA489436',
'IA489438',
'IA489440',
'IA489442',
'IA489444',
'IA489446',
'IA489448',
'IA489450',
'IA489452',
'IA489454',
'IA489456',
'IA489458',
'IA489394',
'IA489396',
'IA489398',
'IA489400',
'IA489402',
'IA489352',
'IA489354',
'IA489356',
'IA489430',
'IA489350',
'IA489358',
'IA489360',
'IA489362',
'IA489364',
'IA489366',
'IA489368',
'IA489370',
'IA489428',
'IA489432',
'IA489434',
'IA489412',
'IA489414',
'IA489416',
'IA489418',
'IA489420',
'IA489422',
'IA489424'); 
--DELETE FROM con.ingreso_detalle where num_ingreso = 'NC037735'; 

--select * from tem.nota_cab_comp 
--CREATE TABLE tem.nota_CAB_COMP AS 
delete from con.comprobante where  numdoc in ('IA489436',
'IA489438',
'IA489440',
'IA489442',
'IA489444',
'IA489446',
'IA489448',
'IA489450',
'IA489452',
'IA489454',
'IA489456',
'IA489458',
'IA489394',
'IA489396',
'IA489398',
'IA489400',
'IA489402',
'IA489352',
'IA489354',
'IA489356',
'IA489430',
'IA489350',
'IA489358',
'IA489360',
'IA489362',
'IA489364',
'IA489366',
'IA489368',
'IA489370',
'IA489428',
'IA489432',
'IA489434',
'IA489412',
'IA489414',
'IA489416',
'IA489418',
'IA489420',
'IA489422',
'IA489424');
--DELETE FROM COMPROBANTE WHERE NUMDOC = 'NC037735'


--CREATE TABLE tem.nota_DET_COMP AS 
delete from con.comprodet where  numdoc in ('IA489436',
'IA489438',
'IA489440',
'IA489442',
'IA489444',
'IA489446',
'IA489448',
'IA489450',
'IA489452',
'IA489454',
'IA489456',
'IA489458',
'IA489394',
'IA489396',
'IA489398',
'IA489400',
'IA489402',
'IA489352',
'IA489354',
'IA489356',
'IA489430',
'IA489350',
'IA489358',
'IA489360',
'IA489362',
'IA489364',
'IA489366',
'IA489368',
'IA489370',
'IA489428',
'IA489432',
'IA489434',
'IA489412',
'IA489414',
'IA489416',
'IA489418',
'IA489420',
'IA489422',
'IA489424');
--DELETE FROM comprodet WHERE NUMDOC = 'NC037735';


