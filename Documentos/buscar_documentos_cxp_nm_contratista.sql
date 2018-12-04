select * FROM con.factura  where documento like 'NM12850%'
-- NM12850
-- NM12831_8

/**BUSCAR CONFORMADA CXP*/
SELECT
	CXP.TIPO_DOCUMENTO,		
	CMC.CUENTA,
	CXP.PROVEEDOR AS NIT,
	0::NUMERIC AS VALOR_DEB,
	ROUND(CXP.VLR_NETO) AS VALOR_CREDT,
	CXP.DESCRIPCION,
	CXP.DOCUMENTO				
	FROM FIN.CXP_DOC CXP
	INNER JOIN CON.CMC_DOC CMC ON (CMC.CMC=CXP.HANDLE_CODE AND CMC.TIPODOC=CXP.TIPO_DOCUMENTO)
	WHERE CXP.TIPO_DOCUMENTO='FAP' 
	AND CXP.REG_STATUS = ''  
	AND CXP.DOCUMENTO =  'CC747-000296';

/**BUSCAR DETALLE CXP*/
SELECT
	TIPO_DOCUMENTO,
	CODIGO_CUENTA AS CUENTA,
	--_DOC.NIT_CLIENTE AS NIT,
	CASE WHEN VLR>0 THEN VLR ELSE 0 END AS  VALOR_DEB, 
	CASE WHEN VLR<0 THEN VLR*-1 ELSE 0 END AS VALOR_CREDT,
	DESCRIPCION,
	DOCUMENTO
FROM FIN.CXP_ITEMS_DOC
WHERE  TIPO_DOCUMENTO='FAP' 
	AND REG_STATUS = '' 
	AND DOCUMENTO = 'CC747-000296' 
	--AND CODIGO_CUENTA = 'I010120064142' 
	
select * from fin.cxp_items_doc where tipo_documento = 'FAP' and documento = 'CC761-000633' and codigo_cuenta = '28151001';

/**BUSCAR DOCUMENTO EN TABLA DE TRASLADO*/
SELECT * FROM con.mc_sl_fac_cc_sel where procesado='N'
	AND MC_____CODIGO____CD_____B = 'CCSL' 
	AND MC_____NUMDOCSOP_B = 'CC747-000296' 
	AND mc_____codigo____pf_____b = '2018'
	AND mc_____numero____period_b = 3;

SELECT PROCESADO FROM con.mc_sl_fac_cc_sel where MC_____CODIGO____CD_____B = 'CCSL' AND mc_____codigo____pf_____b = '2018' 
	AND mc_____numero____period_b = 1 AND MC_____NUMERO____B != 18551;

/**Desmarcar registros*/
-- UPDATE con.mc_sl_fac_cc_sel set procesado = 'N' where MC_____CODIGO____CD_____B = 'CCSL' AND mc_____codigo____pf_____b = '2017' and mc_____numero____period_b = 10 AND MC_____NUMERO____B != 18551;
-- update con.mc_sl_fac_cc_sel set procesado = 'N' where MC_____NUMERO____B != 18551 and MC_____CODIGO____CD_____B = 'CCSL' AND mc_____codigo____pf_____b = '2018' and mc_____numero____period_b = 1;

/** Eliminar registro con debito y credito igual a cero*/
-- delete from con.mc_sl_fac_cc_sel where MC_____NUMERO____B = 18551 and MC_____CODIGO____CD_____B = 'CCSL' and MC_____IDENTIFIC_TERCER_B = '800153993';

SELECT * FROM CON.MC_SL_FAC_CC_SEL WHERE CREATION_DATE::date = '2018-04-26'::DATE;

SELECT * FROM con.mc_sl_fac_cc_sel WHERE mc_____codigo____cpc____b = '28151001' 
	AND mc_____numdocsop_b IN ('CC761-000634', 'CC761-000633','CC761-000632','CC761-000631','CC761-000630','CC761-000629');
	AND mc_____codigo____cd_____b = 'CCSL';

-- delete FROM con.mc_sl_fac_cc_sel where mc_____codigo____pf_____b='2018' 
-- DELETE FROM CON.MC_SL_FAC_SEL WHERE MC_____NUMDOCSOP_B != 'CC761-000628';
-- SELECT * FROM CON.MC_SL_FAC_SEL WHERE MC_____NUMDOCSOP_B != 'CC761-000628';

SELECT MC_____FECHA_____B::DATE FROM CON.MC_SL_FAC_SEL WHERE MC_____NUMDOCSOP_B='NM12831_8'
	AND MC_____CODIGO____CD_____B='NMSL' 
	AND MC_____CODIGO____CPC____B=CON.OBTENER_HOMOLOGACION_APOTEOSYS('CXP_SEL', 'FAP', INFOITEMS_.CUENTA,'', 1)
	AND MC_____IDENTIFIC_TERCER_B=SUBSTRING(REPLACE(INFOITEMS_.NIT,'-',''),1,9)
	GROUP BY MC_____FECHA_____B

-- UPDATE FIN.CXP_DOC SET PROCESADO = 'N' WHERE 
-- 			TIPO_DOCUMENTO		=	'FAP' 
-- 			AND HANDLE_CODE		=	'CI' 
-- 			AND REG_STATUS	=	''		
-- 			AND DOCUMENTO 		LIKE 	'CC%'
-- 			--AND DOCUMENTO 		= 	'CC011-002163'
