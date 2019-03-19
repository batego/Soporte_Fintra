--error boton ingreso----
-- 1. Se consulta el cheque en egresodet_tsp para encontrar el campo documento.
SELECT document_no,documento,tipo_documento,* FROM egresodet_tsp where document_no ='00504';    --documento  = '0761962'  tipo_documento = '004'
--2. Se consulta el documento encontrado (el cual esta anulado) como document_no  en egresodet_tsp para hallar el documento
SELECT document_no,documento,tipo_documento,* FROM egresodet_tsp where document_no ='0761962';--'161122'
--3. Se consulta el documento en fin.cxp_doc_tsp para verificar que exista.
select tipo_documento,* from fin.cxp_doc_tsp where documento='190214-1';
select * from fin.cxp_items_doc_tsp   where documento='190214-1';
SELECT * FROM fin.anticipos_pagos_terceros  where planilla='190214-1';

--4. Se reemplaza el documento del punto 3 en egresodet_tsp, incluyendo el campo tipo_documento (el cual debe ser igual que en cxp_doc_tsp) 
--donde document_no sea el cheque que se consulta inicialmente.
--update egresodet_tsp set documento ='190214-1',tipo_documento ='010' where document_no ='0761962'

190214-1
-- 

