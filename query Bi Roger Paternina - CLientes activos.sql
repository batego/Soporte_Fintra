SELECT t.*,ciu.coddpt FROM(
            select codcli,nomcli,nit,tipo,ciudad,direccion,nomcontacto,telcontacto,cargo_contacto,
            nombre_representante,tel_representante,celular_representante,email_contacto,cel_contacto,
            email_representante,clasificacion,digito_verificacion  from cliente
            union all
select cod_agencia,nom_agencia,nit,'', ciudad,direccion,nomcontacto,telcontacto,cargo_contacto,
nombre_representante,tel_representante,celular_representante,email_contacto,cel_contacto,
email_representante,id_cliente_padre,digito_verificacion  from opav.agencias) t
inner join ciudad as ciu
on (ciu.codciu = t.ciudad)
WHERE t.codcli = 'CS32041';