
---------------------------------
SELECT * FROM asesores a 
INNER JOIN usuarios u on (a.idusuario = u.idusuario)
inner join administrativo.empleados emp on (u.nit = emp.identificacion)
inner join administrativo.productos  prd on (emp.id_producto = prd.id)
WHERE emp.reg_status ='' AND a.reg_status =''
AND a.idusuario IN ('LGALLECO')
--and convenio ilike '%'||12||'%'
ORDER BY A.idusuario ASC;

SELECT * FROM USUARIOS WHERE idusuario = 'LGALLECO';
SELECT * FROM administrativo.empleados WHERE nombre_completo ILIKE '%LORGIA%';
SELECT convenio,* FROM administrativo.productos WHERE id = '4';

SELECT 
    a.idusuario,
    nombre,
    u.nit
FROM asesores a 
inner join usuarios u on (a.idusuario = u.idusuario)
inner join administrativo.empleados emp on (u.nit = emp.identificacion)
inner join administrativo.productos  prd on (emp.id_producto = prd.id)
WHERE emp.reg_status ='' AND a.reg_status =''
and convenio ilike '%'||12||'%'
ORDER BY a.idusuario ASC;
