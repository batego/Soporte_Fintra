 SELECT 
            a.idusuario
            ,upper(a.idusuario||' - '||nombre) as asesor 
            FROM asesores a 
            inner join usuarios u on (a.idusuario = u.idusuario)
            inner join administrativo.empleados emp on (u.nit = emp.identificacion)
            inner join administrativo.productos  prd on (emp.id_producto = prd.id)
            WHERE emp.reg_status ='' AND a.reg_status =''
            and id_producto = 5
            ORDER BY a.idusuario ASC;
            
select * from asesores where idusuario='YACEVEDO';
SELECT * FROM usuarios WHERE idusuario = 'YACEVEDO';
select id_producto,* from administrativo.empleados where identificacion='22732035';
select * from administrativo.productos where id ='5';