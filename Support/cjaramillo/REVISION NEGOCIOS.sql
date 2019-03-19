/*REVISION NEGOCIOS
Boris por favor revisar estos negocios me comenta daniela que estan rechazados o desistidos pero los diferidos me estan causando, de ser asi por favor elimar esa causacion y marcarlos como anulados:

FE00681
FE00900
FE00970
FE01074
FE01253
FE01296
FE01325
FE01344
FE01347
FE01374
FE01535
FE01751*/

select fecha_contabilizacion,* 
from ing_fenalco 
where codneg IN ('FE00681','FE00900','FE00970','FE01074','FE01253','FE01296','FE01325','FE01344','FE01347','FE01374','FE01535','FE01751');


CREATE TABLE tem.dif_neg_08_03_19_cab AS;
select * 
from con.comprobante 
where numdoc IN (select cod 
				from ing_fenalco 
				where codneg IN ('FE00681',
			          'FE00900',
			         'FE00970',
			        'FE01074',
			       'FE01253',
			      'FE01296',
			     'FE01325',
			    'FE01344',
			   'FE01347',
			  'FE01374',
			 'FE01535',
			'FE01751'));

CREATE TABLE tem.dif_neg_08_03_19_detT AS;		
select * from con.comproDET where numdoc IN (select cod 
				from ing_fenalco 
				where codneg IN ('FE00681',
			          'FE00900',
			         'FE00970',
			        'FE01074',
			       'FE01253',
			      'FE01296',
			     'FE01325',
			    'FE01344',
			   'FE01347',
			  'FE01374',
			 'FE01535',
			'FE01751'));
				