SELECT * FROM usuarios WHERE idusuario ='JIBANEZ';--JIBANEZ eg3V1V20UmI=
cABRHtDTbnw=;
--------------cxp
SELECT
    facturas.*, 
    cmc.sigla_comprobante,   
    cmc.cuenta,
    cmc.dbcr,
    get_nombp(facturas.tercero) as proveedor,
    facturas.tercero as nitter,
     ctas.nombre_largo as descrip
FROM (
   SELECT
	  a.dstrct,
	  a.tipo_documento       as tipo_doc,
	  a.proveedor            as tercero,
	  a.documento            as numdoc,
	  a.base,
	  a.handle_code          as  hc,
	  a.moneda ,
	  a.fecha_documento
    FROM      fin.cxp_doc        a
    WHERE     a.dstrct                      = 'FINV'
       AND    a.fecha_documento             <= now()::Date
       AND    a.fecha_contabilizacion       = '0099-01-01 00:00:00'
       AND    a.reg_status                  = ''
) facturas
LEFT JOIN  con.tipo_docto  tdoc ON (  tdoc.dstrct =  facturas.dstrct AND tdoc.codigo_interno  =  facturas.tipo_doc )
LEFT JOIN  con.cmc_doc     cmc  ON (  cmc.dstrct = tdoc.dstrct AND cmc.tipodoc = tdoc.codigo AND cmc.cmc = facturas.hc )
LEFT JOIN  con.cuentas	   ctas	ON ( cmc.cuenta=ctas.cuenta ); 

-- 13070286, 32732773
--


SELECT * FROM fin.cxp_doc WHERE documento IN ('TP00012','TP00011');
SELECT * FROM fin.cxp_items_doc WHERE documento IN ('TP00012','TP00011');


------------cxc
SELECT
    facturas.*, 
    cmc.sigla_comprobante,   
    cmc.cuenta,
    (select codigo_cuenta_contable from con.factura_detalle where documento = facturas.numdoc limit 1) as cc_contable,
    cmc.dbcr,
    get_nombc(facturas.tercero) as nomb_cli
FROM (
   SELECT a.creation_user,
	  a.dstrct   ,
	  a.tipo_documento       as tipo_doc,
	  a.nit                  as tercero,
	  a.documento            as numdoc,
	  a.descripcion,
	  a.base,
	  a.codcli,
	  a.cmc                  as  hc,
	  a.moneda ,
	  a.fecha_factura ,             
	  substr( a.fecha_vencimiento,1,4 ) ||  substr( a.fecha_vencimiento,6,2 )  as periodo,
	  a.valor_factura as debe
    FROM      con.factura        a
    WHERE     a.dstrct                      =  'FINV'
       AND    a.fecha_factura               <=  now()::Date
       AND    a.fecha_contabilizacion       = '0099-01-01 00:00:00'
       AND    a.reg_status                  = ''
) facturas
LEFT JOIN  con.tipo_docto  tdoc ON ( tdoc.dstrct = facturas.dstrct AND tdoc.codigo_interno = facturas.tipo_doc )
LEFT JOIN  con.cmc_doc     cmc  ON ( cmc.dstrct = tdoc.dstrct AND cmc.tipodoc = tdoc.codigo AND cmc.cmc = facturas.hc );

SELECT * FROM CON.factura WHERE documento IN ('PM14387_1');
SELECT * FROM CON.factura_detalle WHERE documento = 'PM14387_1';