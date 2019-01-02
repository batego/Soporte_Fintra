SELECT cxc_corrida,* FROM  etes.manifiesto_carga  WHERE planilla IN ('0241769','0241771','0241764','0241767','0241783','0241776','0241778','0241782','0241775',
'0241795','0241794','0241796','0241784','0241777','0241785','0241233','0241801','0241788','0241822','0241818','0241821','0241824','0241826','0241823',
'0241819','0241827','0241884','0241883','0241887','0241894','0241896','0241898','0241895','0241901','0241902','0241904','0241906','0241952','0241963',
'0241968','0241966','0241970','0241959','0241981','0241987','0241900','0241889');

--UPDATE con.factura AS a SET valor_abonome =  0 , valor_saldome = b.valor_factura
FROM (SELECT * FROM con.factura 
WHERE documento in ('PP02217829',
'PP02217826',
'PP02217828',
'PP02217831',
'PP02217822',
'PP02217823',
'PP02217824',
'PP02217830',
'PP02217833',
'PP02217827',
'PP02217834',
'PP02217825',
'PP02217979',
'PP02217980',
'PP02217981',
'PP02217982',
'PP02217983',
'PP02217984',
'PP02218002',
'PP02218038',
'PP02218039',
'PP02218040',
'PP02218041',
'PP02218042',
'PP02218043',
'PP02218044',
'PP02218045',
'PP02218060',
'PP02218061',
'PP02218062',
'PP02218063',
'PP02218226',
'PP02218227',
'PP02218228',
'PP02218229',
'PP02218230',
'PP02218231',
'PP02218232',
'PP02218233',
'PP02218239',
'PP02218240',
'PP02218241',
'PP02218242',
'PP02218243',
'PP02218244',
'PP02218245') ) AS B WHERE  a.documento =b.documento;


SELECT * FROM con.ingreso WHERE num_ingreso = 'IA536307';--224.732.598

CREATE TABLE tem.IA536307 AS; 
SELECT * FROM con.ingreso_detalle
WHERE num_ingreso = 'IA536307'
AND documento IN ('PP02217829',
'PP02217826',
'PP02217828',
'PP02217831',
'PP02217822',
'PP02217823',
'PP02217824',
'PP02217830',
'PP02217833',
'PP02217827',
'PP02217834',
'PP02217825',
'PP02217979',
'PP02217980',
'PP02217981',
'PP02217982',
'PP02217983',
'PP02217984',
'PP02218002',
'PP02218038',
'PP02218039',
'PP02218040',
'PP02218041',
'PP02218042',
'PP02218043',
'PP02218044',
'PP02218045',
'PP02218060',
'PP02218061',
'PP02218062',
'PP02218063',
'PP02218226',
'PP02218227',
'PP02218228',
'PP02218229',
'PP02218230',
'PP02218231',
'PP02218232',
'PP02218233',
'PP02218239',
'PP02218240',
'PP02218241',
'PP02218242',
'PP02218243',
'PP02218244',
'PP02218245'); 


SELECT * FROM con.factura WHERE documento IN ('R0037224','R0037225');

SELECT ref2, num_ingreso_ultimo_ingreso,* FROM con.factura WHERE ref2 IN ('0241769','0241771','0241764','0241767','0241783','0241776','0241778','0241782','0241775',
'0241795','0241794','0241796','0241784','0241777','0241785','0241233','0241801','0241788','0241822','0241818','0241821','0241824','0241826','0241823',
'0241819','0241827','0241884','0241883','0241887','0241894','0241896','0241898','0241895','0241901','0241902','0241904','0241906','0241952','0241963',
'0241968','0241966','0241970','0241959','0241981','0241987','0241900','0241889');

SELECT * FROM con.ingreso WHERE num_ingreso = 'IA536308';
SELECT * FROM con.ingreso_detalle WHERE num_ingreso = 'IA536308';