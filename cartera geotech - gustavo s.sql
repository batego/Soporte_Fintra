
SELECT 
      SCDMC__NUMDOCSOP_B as FACTURA_APOTEOSYS, 
      SCDMC__NUMERO____MC_____B as FACTURA_GEOTECH, 
      SCDMC__CODIGO____TD_____B AS TIPO_DOCUMENTO, 
      SCDMC__CODIGO____CU_____B AS CENTRO_COSTO, 
      CU.CU_____NOMBRE____B AS NOMBRE_CENTRO_COSTO,
      SCDMC__IDENTIFIC_TERCER_B, P.TERCER_NOMBEXTE__B AS NOMBRE_TERCERO,
      SCDMC__FECHORCRE_B AS FECHA_CREACION,SCDMC__FECHA_____MC_____B AS FECHA_FACTURACION, 
      VDV____FECHVENC AS FECHA_VENCIMIENTO, 
      CASE  WHEN round((TO_DATE(sysdate)-VDV____FECHVENC)) >= 365 THEN '017 - > A 1 AÑO'
            WHEN  round((TO_DATE(sysdate)-VDV____FECHVENC)) >= 181 THEN '006 - 180 Y 360'	
            WHEN  round((TO_DATE(sysdate)-VDV____FECHVENC)) >= 121 THEN '005 - 121 Y 180'
            WHEN  round((TO_DATE(sysdate)-VDV____FECHVENC)) >= 91 THEN '004 - 91 Y 120'
            WHEN  round((TO_DATE(sysdate)-VDV____FECHVENC)) >= 61 THEN '003 - 61 Y 90'
            WHEN  round((TO_DATE(sysdate)-VDV____FECHVENC)) >= 31 THEN '002 - 31 Y 60'
            WHEN  round((TO_DATE(sysdate)-VDV____FECHVENC)) >= 1 THEN '001 - CTE'
            WHEN  round((TO_DATE(sysdate)-VDV____FECHVENC)) <= 0 THEN '001 - CTE'
            WHEN  round((TO_DATE(sysdate)-VDV____FECHVENC)) is null  THEN '001- CTE'
       ELSE '0' END AS RANGO_VCTO,
      DVX.DV_____VALMONLOC_B AS VALOR_BASE, 
      DVX.DV_____VALOIVA___B AS VALOR_IVA, 
      DVX.DV_____VALORETE__B AS VALOR_RETEFUENTE, 
      DVX.DV_____VALRETICA_B AS VALOR_RETEICA, 
      DVX.DV_____VALRETIVA_B AS VALOR_RETEIVA,
      (DVX.DV_____VALMONLOC_B + DVX.DV_____VALOIVA___B - DVX.DV_____VALORETE__B - DVX.DV_____VALRETICA_B - DVX.DV_____VALRETIVA_B) AS VALOR_FACTURA,
      SCDMC__OBSERVACI_B AS OBSERVACION, 
      T.SALDO as COMPARA,
      CASE 
          WHEN T.SALDO = 0 THEN SCDMC__DEBMONLOC_B
          WHEN T.SALDO > 0 AND T.SALDO < SCDMC__DEBMONLOC_B THEN (SCDMC__DEBMONLOC_B-T.SALDO)
          WHEN T.SALDO = SCDMC__DEBMONLOC_B THEN 0
          WHEN T.SALDO IS NULL THEN 0
      END AS ABONO,
      COALESCE(T.SALDO,SCDMC__DEBMONLOC_B) AS SALDO,
      --PERIODO
      (SELECT REPLACE(SUBSTR(TO_CHAR(MAX(MC_____FECHA_____B), 'YYYY-MM'),1,7),'-','') AS PERIODO 
       FROM MC____ 
       WHERE MC_____NUMDOCSOP_B = TO_CHAR(SCDMC.SCDMC__NUMERO____MC_____B) AND MC_____CODIGO____TD_____B = 'INGR' AND MC_____CODIGO____CONTAB_B = 'GEOT') AS PERIODO,
      --FECHA RECAUDO
      (SELECT TO_CHAR(MAX(MC_____FECHA_____B), 'DD/MM/YY') AS PERIODO 
       FROM MC____ 
       WHERE MC_____NUMDOCSOP_B = TO_CHAR(SCDMC.SCDMC__NUMERO____MC_____B) AND MC_____CODIGO____TD_____B = 'INGR' AND MC_____CODIGO____CONTAB_B = 'GEOT') AS FECHA_RECAUDO
FROM APOTEOSYS.SCDMC_ SCDMC
LEFT JOIN (
            SELECT   SCD____NUMDOCSOP_B, SCD____FECHVENC__B, SCD____NUMEVENC__B, COALESCE(SCD____FECHCANC__B,TO_DATE('01/01/01 00:00:00')) as SCD____FECHCANC__B, (SCD____SALINILOC_B + SCD____ACUDEBLOC_B) - SCD____ACUCRELOC_B AS SALDO
            FROM APOTEOSYS.SCD___ SCD
            WHERE SCD____CODIGO____DS_____B not in ('ANUL', 'FAPR')
            AND SCD____CODIGO____PC_____B = 'PUCG'
           ) T ON (
                    SCD____NUMDOCSOP_B = TO_CHAR(SCDMC.SCDMC__NUMERO____MC_____B)
                    AND SCD____NUMEVENC__B = 1
                    )
LEFT JOIN (
      SELECT FAC.DV_____IDENTIFIC_TERCER_B, FAC.DV_____NUMERO____B, FAC.DV_____VALMONLOC_B, FAC.DV_____VALOIVA___B, FAC.DV_____VALORETE__B, FAC.DV_____VALRETICA_B, FAC.DV_____VALRETIVA_B
      FROM APOTEOSYS.DV____ FAC
      WHERE FAC.DV_____CODIGO____DS_____B = 'FACL'
     ) DVX ON (DVX.DV_____NUMERO____B = SCDMC.SCDMC__NUMDOCSOP_B)
JOIN APOTEOSYS.VDV___ VDV ON (VDV____NUMERO____DV_____B = SCDMC__NUMERO____MC_____B AND VDV____NUMEVENC__B = 1 AND VDV____CODIGO____DS_____B = 'FACL')
JOIN APOTEOSYS.CU____ CU ON (CU.CU_____CODIGO____B = SCDMC__CODIGO____CU_____B)
INNER JOIN APOTEOSYS.TERCER P ON (P.TERCER_IDENTIFIC_B = SCDMC__IDENTIFIC_TERCER_B)
WHERE SCDMC__NUMDOCSOP_B in (
                                  select x.FACTURA FROM (
                                        SELECT TO_CHAR(DV.DV_____NUMERO____B) as FACTURA, count(0)
                                        FROM APOTEOSYS.DV____ DV
                                        WHERE DV_____CODIGO____DS_____B in ('ANUL', 'FACL') 
                                        GROUP BY TO_CHAR(DV.DV_____NUMERO____B)
                                        HAVING count(0) = 1
                                  ) x
                            )
AND SCDMC__NUMEVENC__B = 1                             
AND SCDMC__CODIGO____TD_____B = 'FACN'
AND REPLACE(SUBSTR(TO_CHAR(SCDMC__FECHORCRE_B, 'YYYY-MM-DD'),1,7),'-','') BETWEEN '201709' AND REPLACE(SUBSTR(TO_CHAR(SYSDATE, 'YYYY-MM-DD'),1,7),'-','')
ORDER BY SCDMC__SECINTDOC_SCD____B, SCDMC__FECHA_____MC_____B

