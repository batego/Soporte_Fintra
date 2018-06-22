select  cmc.cuenta, * from con.factura f
inner join CON.CMC_DOC as cmc on (CMC.TIPODOC = f.TIPO_DOCUMENTO and cmc.cmc = f.cmc)
where documento = 'PM11210_12'


select * from con.factura where documento in ('PM11210_12','PM11292_11')
update con.factura set cmc = 'SV' where documento in ('PM11210_12','PM11292_11')



select * from fin.cxp_doc limit 5

select * from con.comprobante where numdoc = 'PM11210_12'
select * from con.comprodet  where numdoc = 'PM11210_12'


FROM FIN.CXP_ITEMS_DOC AS ITM
INNER JOIN FIN.CXP_DOC AS CXP ON (CXP.DOCUMENTO = ITM.DOCUMENTO AND CXP.TIPO_DOCUMENTO = ITM.TIPO_DOCUMENTO)
INNER JOIN OPAV.ACCIONES AS B	ON (ITM.REFERENCIA_1 = B.ID_ACCION)
INNER JOIN OPAV.OFERTAS  AS C	ON (B.ID_SOLICITUD = C.ID_SOLICITUD)
INNER JOIN CON.CMC_DOC AS CMC ON (CMC.TIPODOC = CXP.TIPO_DOCUMENTO AND CMC.CMC = CXP.HANDLE_CODE)