select estado_sol, asesor,* from apicredit.pre_solicitudes_creditos where numero_solicitud = '137293';
select * from solicitud_persona where numero_solicitud = '137248';--Mz 32 Lt 21

 SOLICITUD REVISION PLANILLAS TRANS SOID
/*
 * SOLICITUD REVISION PLANILLAS TRANS SOID
 * Buenas tardes, Boris por favor revisar ya que las planillas relacionadas a continuacion 
 * estan transferidas operativamente y tienen egreso pero contablemente no les encuentro la factura PP 
 * que quedo cancelada en la corrida R0037003 pero no se encuentra el la nota IA536020: 
 * planillas 0239691 - 0239695 
  * 
 */

SELECT cxc_corrida, documento_cxp,* FROM etes.manifiesto_carga WHERE planilla in('0239691','0239695');
SELECT * FROM etes.manifiesto_descuentos WHERE planilla in('0239691','0239695');

-- R operativa
SELECT * FROM con.factura WHERE documento = 'R0037003';
SELECT * FROM con.factura_detalle WHERE documento = 'R0037003';

-- R Contable
SELECT * FROM con.comprobante WHERE numdoc = 'R0037003';
SELECT * FROM con.comprodet WHERE numdoc = 'R0037003';

-- ingreso
SELECT * FROM con.ingreso WHERE num_ingreso = 'IA536020'; 
SELECT * FROM con.ingreso_detalle WHERE num_ingreso = 'IA536020' AND descripcion ILIKE '%0239691%';

--Egreso
SELECT * FROM egreso WHERE document_no = 'PT01413_1';
SELECT * FROM egresodet WHERE document_no = 'PT01413_1';


------------------------------------------------------------------------




