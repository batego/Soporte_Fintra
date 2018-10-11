-- Se debe hacer el insert de los items que estan descritos debajo

SELECT * FROM sanciones_condonaciones WHERE id_unidad_negocio = '22' AND id_conceptos_recaudo = 200;

INSERT INTO public.sanciones_condonaciones
(id, id_unidad_negocio, id_tipo_acto, id_conceptos_recaudo, periodo, categoria, descripcion, aplicado_a, dias_rango_ini, dias_rango_fin, porcentaje, creation_date, creation_user, last_update, user_update, dstrct)
VALUES(10138, 22, 1, 200, '201812', 'IXM', 'INTERES X MORA', '', 1, 2000, 'CALCULADO', '2017-12-20 08:42:36.777', 'HCUELLO', '2017-12-20 08:42:36.777', 'HCUELLO', '');
INSERT INTO public.sanciones_condonaciones
(id, id_unidad_negocio, id_tipo_acto, id_conceptos_recaudo, periodo, categoria, descripcion, aplicado_a, dias_rango_ini, dias_rango_fin, porcentaje, creation_date, creation_user, last_update, user_update, dstrct)
VALUES(10139, 22, 1, 200, '201812', 'GAC', 'GAC MAYOR 180 DIAS', '', 181, 2000, '20', '2017-12-20 08:42:36.777', 'HCUELLO', '2017-12-20 08:42:36.777', 'HCUELLO', '');
INSERT INTO public.sanciones_condonaciones
(id, id_unidad_negocio, id_tipo_acto, id_conceptos_recaudo, periodo, categoria, descripcion, aplicado_a, dias_rango_ini, dias_rango_fin, porcentaje, creation_date, creation_user, last_update, user_update, dstrct)
VALUES(10140, 22, 1, 200, '201812', 'GAC', 'GAC ENTRE 11 Y 30 DIAS', '', 11, 30, '5', '2017-12-20 08:42:36.777', 'HCUELLO', '2017-12-20 08:42:36.777', 'HCUELLO', '');
INSERT INTO public.sanciones_condonaciones
(id, id_unidad_negocio, id_tipo_acto, id_conceptos_recaudo, periodo, categoria, descripcion, aplicado_a, dias_rango_ini, dias_rango_fin, porcentaje, creation_date, creation_user, last_update, user_update, dstrct)
VALUES(10141, 22, 1, 200, '201812', 'GAC', 'GAC ENTRE 61 Y 180 DIAS', '', 61, 180, '20', '2017-12-20 08:42:36.777', 'HCUELLO', '2017-12-20 08:42:36.777', 'HCUELLO', '');
INSERT INTO public.sanciones_condonaciones
(id, id_unidad_negocio, id_tipo_acto, id_conceptos_recaudo, periodo, categoria, descripcion, aplicado_a, dias_rango_ini, dias_rango_fin, porcentaje, creation_date, creation_user, last_update, user_update, dstrct)
VALUES(10142, 22, 1, 200, '201812', 'GAC', 'GAC ENTRE 31 Y 60 DIAS', '', 31, 60, '10', '2017-12-20 08:42:36.777', 'HCUELLO', '2017-12-20 08:42:36.777', 'HCUELLO', '');


SELECT max(id) FROM public.sanciones_condonaciones;