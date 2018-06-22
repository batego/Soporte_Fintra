SELECT id, cod, descripcion FROM unidad_negocio WHERE --cod_central_riesgo ='' AND 
cod != ''  AND ref_1  = 'und_proc_ejec'
SELECT * FROM unidad_negocio WHERE cod_central_riesgo ='' AND cod != '' 



SELECT  cedula, nombre, ciudad, direccion, barrio,  telefono, celular,email, negocio,coalesce(id_demanda,'0') as id_demanda, id_und_negocio, und_negocio,id_convenio,
	convenio, fecha_inicio, fecha_marcacion,  dias_transcurridos, num_pagare, niter, vr_negocio,  vr_desembolso, valor_saldo, mora, estado_cartera, coalesce(id_juzgado,0) as id_juzgado, 
	coalesce(radicado,'') as radicado, coalesce(docs_generados,'N') as docs_generados 
from  administrativo.sp_lista_procesos_juridicos('WHERE etapa_proc_ejec = ''1''') as f (id_etapa varchar, cedula varchar, nombre varchar, ciudad varchar, direccion varchar, barrio varchar, telefono varchar, 
    celular varchar,email varchar, negocio varchar,id_demanda integer, id_und_negocio integer, und_negocio varchar,id_convenio integer,
    convenio varchar, fecha_inicio date, fecha_marcacion date, dias_transcurridos integer, num_pagare varchar, niter varchar, 
    vr_negocio numeric, vr_desembolso numeric, valor_saldo numeric, mora varchar, estado_cartera varchar, id_juzgado integer, radicado varchar, docs_generados varchar);
