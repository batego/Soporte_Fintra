CREATE TABLE tem.Desemdoso201904
(
  codneg character varying(10) NOT NULL primary key 
);

SELECT * FROM tem.Desemdoso201904;

insert into tem.Desemdoso201904 values('MC19145');


--Desmarcar diferidos
CREATE TABLE TEM.MC19145 AS
SELECT endosado,* FROM ing_fenalco WHERE codneg = 'MC19145';

---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC19145');

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC19145');
