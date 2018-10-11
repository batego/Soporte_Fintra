SELECT periodo, creation_date, fecha_contabilizacion,* FROM fin.cxp_doc WHERE documento IN (
'CXP_R0036726', 
'CXP_R0036727', 
'CXP_R0036728', 
'CXP_R0036729', 
'CXP_R0036730', 
'CXP_R0036731', 
'CXP_R0036732', 
'CXP_R0036733', 
'CXP_R0036734', 
'CXP_R0036735', 
'CXP_R0036736');


SELECT creation_date, * FROM fin.cxp_items_doc WHERE documento IN (
'CXP_R0036726', 
'CXP_R0036727', 
'CXP_R0036728', 
'CXP_R0036729', 
'CXP_R0036730', 
'CXP_R0036731', 
'CXP_R0036732', 
'CXP_R0036733', 
'CXP_R0036734', 
'CXP_R0036735', 
'CXP_R0036736');



SELECT periodo, creation_date,fecha_contabilizacion,* FROM con.ingreso WHERE num_ingreso IN (
'IC211018','IC211019','IC211020','IC211021','IC211022','IC211023','IC211024','IC211026','IC211027');

SELECT periodo, creation_date,fecha_contabilizacion,* FROM con.ingreso_detalle WHERE num_ingreso IN (
'IC211018','IC211019','IC211020','IC211021','IC211022','IC211023','IC211024','IC211026','IC211027');



