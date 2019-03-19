
-- se cambia estado a avalado
SELECT actividad, estado_neg,* FROM negocios WHERE cod_neg = 'MC18723';--DEC	V

--se eliminan las cxp asociadas al negocio
CREATE TABLE TEM.MC18723 AS;
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC18723';

CREATE TABLE TEM.MC18723_DET AS;
SELECT * FROM fin.cxp_items_doc WHERE documento IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MC18723');

--Notas
CREATE TABLE TEM.MP15984_not AS;
SELECT * FROM FIN.cxp_doc WHERE documento_relacionado = 'MP15984';

CREATE TABLE TEM.MP15984_notdet AS;			--insert into fin.cxp_doc select * from TEM.MP15984_notdet
SELECT * FROM FIN.cxp_items_doc WHERE documento IN ('MP15984-FZ1','MP15984-FZ2');


--se obtiene el numero de la solicitud
SELECT numero_solicitud, estado_sol,* FROM solicitud_aval WHERE cod_neg = 'MC18723';
--se actuaiza con el numero de la solicitud el campo de negocio
SELECT * FROM detalle_poliza_negocio WHERE cod_neg = 'MC18723';--141696 --Ok

--anular la cxp en esta tabla
SELECT * FROM administrativo.historico_deducciones_fianza WHERE documento_relacionado = 'MP15984'; -- No existe reg



 
 