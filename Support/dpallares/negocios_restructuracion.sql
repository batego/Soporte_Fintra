select * from solicitud_aval;
SELECT estado_neg,* FROM negocios WHERE estado_neg = 'T' AND  cod_cli IN ('8743883',
'8743883',
'7425854',
'8728002',
'8728002',
'32626262',
'1143121982',
'8739340',
'32845873',
'32845873',
'4977380',
'4977380',
'1129532287',
'72254929',
'72127057',
'72127057',
'1032412437',
'72292477',
'72290836',
'72290836',
'32729767');

SELECT n.cod_cli, NR.negocio_base, NR.negocio_reestructuracion, N.id_convenio, C.nombre 
FROM REL_NEGOCIOS_REESTRUCTURACION NR
INNER JOIN negocios N ON (N.cod_neg = NR.negocio_base)
LEFT JOIN convenios C ON (C.id_convenio = N.id_convenio)
where N.cod_cli IN ('8743883',
'8743883',
'7425854',
'8728002',
'8728002',
'32626262',
'1143121982',
'8739340',
'32845873',
'32845873',
'4977380',
'4977380',
'1129532287',
'72254929',
'72127057',
'72127057',
'1032412437',
'72292477',
'72290836',
'72290836',
'32729767');


SELECT * FROM rel_negocios_reestructuracion WHERE negocio_reestructuracion = 'FA18945';
SELECT id_convenio,* FROM negocios WHERE cod_neg = 'FA18442';
