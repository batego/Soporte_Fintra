
CORE SELECTRIK 
--IA491860 $180,000 NM14511_1
--IA491862 $45,000 NM14511_1
--IA491866 $27,000 NM14512_1

Fintra
IA538991 $154 	 PM14513_1
IA538992 $8,366  PM14513_1
IA538993 $668 	 PM14513_1

IA539000 $154 	 PM14517_1
IA539001 $8,366  PM14517_1
IA539002 $668 	 PM14517_1
	      9188

SELECT * FROM con.ingreso where num_ingreso in ('IA539000','IA539001','IA539002');--27000
SELECT factura,* FROM con.ingreso_detalle where num_ingreso in ('IA539000','IA539001','IA539002');

SELECT * FROM con.factura WHERE documento = 'PM14517_1';--173250
select * from con.comprobante where  numdoc in ('IA539000','IA539001','IA539002');
select * from con.comprodet where  numdoc in ('IA539000','IA539001','IA539002');
