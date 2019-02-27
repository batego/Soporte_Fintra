

SELECT * FROM negocios WHERE cod_neg  = 'FE04080';
SELECT * FROM solicitud_aval WHERE cod_neg  = 'FE04080';
SELECT * FROM con.factura WHERE negasoc = 'FE04080';

select id_perfil from perfilopcion_trf where id_opcion in (933)--,1580)
group by id_perfil

select usuarios, nombre,  p.perfil
from perfilusuarios  p
inner join usuarios u on u.idusuario=p.usuarios
where p.perfil in ('AST CONTABIL'
'AUXILIARCONT'
'CONTABILIDAD'
'TODO1X');


SELECT * FROM perfilusuarios WHERE 
and u.estado= 'A'
order by usuarios
