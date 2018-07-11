select 
                negocio
                ,cedula
                ,nombre_cliente
                ,cuota
                ,fecha_vencimiento
                , now()::date - fecha_vencimiento as dias_vencido_hoy
                ,vencimiento_mayor
                ,dias_vencidos
                ,status
                ,sum(valor_asignado) as valor_asignado
                ,sum(debido_cobrar) as debido_cobrar
                ,sum(interes_mora) as interes_mora
                ,sum(gasto_cobranza) as gasto_cobranza
            from sp_detallecarteraxsancion(201807,'10','FB00379') as coco(negocio varchar, cedula varchar, nombre_cliente varchar, cuota varchar, documento varchar, fecha_vencimiento date, dias_vencidos numeric, vencimiento_mayor varchar, status varchar, valor_asignado numeric, debido_cobrar numeric, interes_mora numeric,gasto_cobranza numeric )  
                group by 
                negocio
                ,cedula
                ,nombre_cliente
                ,cuota
                ,fecha_vencimiento
                ,vencimiento_mayor
                ,status 
                ,dias_vencidos           
                order by cuota::numeric

                select num_doc_fen,* from con.foto_cartera 
--		update con.foto_cartera set num_doc_fen = '8'
                where negasoc = 'FB00379' and fecha_vencimiento = '2014-10-09'