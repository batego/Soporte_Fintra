select estado_neg, actividad,* from negocios where cod_neg='FE04857';
select * from negocios_trazabilidad where cod_neg='FE04857';

INSERT INTO public.negocios_trazabilidad
(reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios, concepto, causal, comentario_stby)
VALUES('', 'FINV', 147894, 'DEC', 'MCASTANEDA', '2019-03-01 09:21:18.451', 'FE04857', Se envía a reliquidar plazo, debido a que por error del sistema se modificó el plazo a 4 meses. Crédito aprobado por el sistema. Nuevo plazo 12 meses, 'RELIQUIDAR_FINTRA', '', );
