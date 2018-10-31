select 
distinct 
mc_____codigo____contab_b,
mc_____codigo____td_____b,
MC_____CODIGO____CD_____B,
--MC_____NUMDOCSOP_B,
mc_____fecha_____b,
mc_____numero____b ,
'EXECUTE APOTEOSYS.ELIMINARCOMPROBANTECONTABLE('''||mc_____codigo____contab_b||''','''||mc_____codigo____td_____b||''','''||to_char(mc_____fecha_____b,'dd/mm/YYYY')||''','||mc_____numero____b||');' delete_query 
--*
from 
apoteosys.mc____ 
where 
mc_____codigo____contab_b='FINT' 
--and mc_____codigo____td_____b='ICAU' --and 
--AND mc_____codigo____cd_____b in ('EGMC') 
--and MC_____NUMDOCSOP_B in ('MI96811','MI96810')
--and MC_____FECHA_____B='20/12/2017'
--and MC_____NUMERO____B in (1012212,716390)
--and mc_____numero____period_b=6
--and mc_____observaci_b LIKE '%IC314806%'
--and mc_____observaci_b in ('MI96811')
and mc_____referenci_b in ('MC16088')
--AND MC_____NUMDOCSOP_B IN ('NM14218_1','NM14219_1','NM14220_1','NM14221_1')
--mc_____codigo____cu_____b in('A1111F14201','A1311F14201')
--AND MC_____AUTOCREA__B='COREFINTRA'
order by mc_____numero____b desc;