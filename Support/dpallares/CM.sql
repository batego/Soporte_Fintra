--select * from apicredit.usuarios_portal where idusuario='APORTILLA';
SELECT cod, fecha_doc, fecha_doc AS fecha_vencimiento FROM ing_fenalco WHERE cod IN ('CM500123305',
'CM500123306',
'CM500128705',
'CM500113805',
'CM500113806',
'CM500127904',
'CM500127905',
'CM500161103',
'CM500161104',
'CM500124205',
'CM500134304',
'CM500134305',
'CM500132404',
'CM500132405',
'CM500124503',
'CM500124504',
'CM500083305',
'CM500080805',
'CM500080806',
'CM500158304',
'CM500158305');

SELECT * FROM con.factura_detalle WHERE documento IN (SELECT * FROM con.factura WHERE negasoc ='FA35330');

SELECT * FROM con.comprodet WHERE numdoc IN ('CM500123305',
'CM500123306',
'CM500128705',
'CM500113805',
'CM500113806',
'CM500127904',
'CM500127905',
'CM500161103',
'CM500161104',
'CM500124205',
'CM500134304',
'CM500134305',
'CM500132404',
'CM500132405',
'CM500124503',
'CM500124504',
'CM500083305',
'CM500080805',
'CM500080806',
'CM500158304',
'CM500158305');