select * from solicitud_aval sa  inner join solicitud_persona sp
    on(sp.numero_solicitud=sa.numero_solicitud)
    where identificacion =73183623 and estado_sol not in ('A','R','T','D')