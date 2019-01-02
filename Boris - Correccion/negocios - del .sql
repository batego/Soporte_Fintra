CREATE TABLE tem.negocios_del_cxp as
SELECT * FROM fin.cxp_doc 
--DELETE FROM fin.cxp_doc 
WHERE documento_relacionado IN (
'MC13126',
'MC14303',
'MC14561',
'MC14693',
'MC14869',
'MC15279',
'MC15399',
'MC15856',
'MC16088',
'MC16345',
'MC15205')

CREATE TABLE tem.negocios_del_cxp_itms as
SELECT * FROM fin.cxp_items_doc 
--DELETE FROM fin.cxp_items_doc 
WHERE documento IN (
'CXP000004507',
'CXP000004600',
'CXP000004790',
'CXP000004246',
'CXP000005329',
'CXP000005239',
'FZT06158',
'MP12815',
'CXP000004901');