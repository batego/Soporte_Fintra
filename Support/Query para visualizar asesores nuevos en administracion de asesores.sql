-- SELECT * FROM asesores WHERE idusuario = 'AMACHADO';
-- SELECT * FROM usuarios WHERE idusuario = 'AMACHADO';

SELECT 
                sa.responsable_cuenta AS idusuario
                ,upper(a.idusuario||' - '||nombre) AS asesor 
            FROM solicitud_aval sa
            INNER JOIN negocios neg ON (sa.cod_neg = neg.cod_neg)
            INNER  JOIN con.factura fac on (neg.cod_neg = fac.negasoc AND fac.reg_status ='')
            LEFT JOIN asesores a  on (a.idusuario = sa.responsable_cuenta)
            LEFT JOIN usuarios u on (a.idusuario = u.idusuario)
            WHERE sa.
            neg.estado_neg in ('T')
            AND neg.id_convenio in (select id_convenio FROM rel_unidadnegocio_convenios WHERE id_unid_negocio in (SELECT id FROM unidad_negocio WHERE id = 1) AND id_convenio NOT IN (40,41))
            AND valor_saldo > 0
            GROUP BY sa.responsable_cuenta,a.idusuario,u.nombre
            ORDER BY sa.responsable_cuenta;
            
   select responsable_cuenta, * from solicitud_aval 
   where responsable_cuenta != '' 
   and responsable_cuenta IN ('AMACHADO','JSALCEDO1','KMARTINEZ1')      


   SELECT 
            a.idusuario
            ,upper(a.idusuario||' - '||nombre) as asesor 
            FROM asesores a 
            inner join usuarios u on (a.idusuario = u.idusuario)
            inner join administrativo.empleados emp on (u.nit = emp.identificacion)
            inner join administrativo.productos  prd on (emp.id_producto = prd.id)
            WHERE a.reg_status =''
            AND A.IDUSUARIO IN ('AMACHADO','JSALCEDO1','KMARTINEZ1')
            --and id_producto = ?
            ORDER BY a.idusuario ASC;

--SELECT * FROM administrativo.empleados WHERE IDENTIFICACION = '1045701541';