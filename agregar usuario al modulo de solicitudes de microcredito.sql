 SELECT 
    a.idusuario,
    nombre,
    u.nit,
    prd.convenio
FROM asesores a 
inner join usuarios u on (a.idusuario = u.idusuario)
inner join administrativo.empleados emp on (u.nit = emp.identificacion)
inner join administrativo.productos  prd on (emp.id_producto = prd.id)
WHERE emp.reg_status ='' AND a.reg_status =''
AND a.idusuario = 'ADIAZS'
--and convenio ilike '%'||||'%'
ORDER BY a.idusuario ASC;
