select * from cliente where nit = '50938580'
select * from cliente limit 100

create table tem.del_50938580_nit as 
select * from nit where cedula = '50938580'
delete from nit where cedula = '50938580'


create table tem.del_50938580 as 
select * from proveedor where nit = '50938580'
--delete from proveedor where nit = '50938580'

{"respuesta":"ERROR DURANTE LA TRANSACCION LOS CAMBIOS NO SE PRODUJERON EL LA BASE DE DATOS Batch entry 1 
INSERT INTO proveedor(nit,payment_name,creation_date,creation_user,tipo_doc,banco_transfer,tipo_cuenta,no_cuenta,nit_beneficiario,tipo_proveedor)
VALUES ('50938580','VALENCIA TAMARA YENIS YECIT',now(),'CURUETA',(select cod from administrativo.tipo_doc where id = 1),(select table_code from tablagen where descripcion = '07'),'CA','0','50938580',5) was aborted.  

Call getNextException to see the cause. 0 <br> La siguiente exception es : ----org.postgresql.util.PSQLException: ERROR: duplicate key violates unique constraint "proveedor_idx""}



{"respuesta":"ERROR DURANTE LA TRANSACCION LOS CAMBIOS NO SE PRODUJERON EL LA BASE DE DATOS Batch entry 2 
INSERT INTO nit(cedula,nombre,direccion,codciu,coddpto,codpais,telefono,celular,e_mail,fechacrea,usuariocrea,sexo,fechanac,tipo_iden,est_civil,lugarnac,libmilitar,expced,clasificacion) 
VALUES ('50938580','VALENCIA TAMARA YENIS YECIT','CRA 17C 17C-09','MT','COR','CO','0','3014898344','YENIS1027@HOTMAIL.COM',now(),'CURUETA','F','1982-10-27'::date,
(select cod from administrativo.tipo_doc where id = 1), (select cod from estado_civil where id = 1),'SH','N/A','MT','000V0') 

was aborted.  Call getNextException to see the cause. 0 <br> La siguiente exception es : ----org.postgresql.util.PSQLException: ERROR: duplicate key violates unique constraint "nit_pk""}
