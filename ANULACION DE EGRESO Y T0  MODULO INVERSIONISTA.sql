CREATE TABLE tem.egreso_EG67150 AS 			--select * from tem.egreso_EG67150;
select * from egreso where document_no='EG67150';

CREATE TABLE tem.egresodet_EG67150 AS 			--select * from tem.egresodet_EG67150;
select * from egresodet where document_no='EG67150';

CREATE TABLE tem.cxp_doc_T08889 AS; 		
select cheque,* from fin.cxp_doc where documento='T08889';

CREATE TABLE tem.cxp_items_doc_T08889 AS; 		
select * from fin.cxp_items_doc where documento='T08889';


------Query-------

select
        no_transaccion, c.reg_status, c.dstrct, c.nit, subcuenta, tasa_ea, fecha,
        saldo_inicial, base_intereses, intereses, retefuente, reteica,
        subtotal, intereses_acomulados, consignacion, retiro, saldo_final,
        tipo_movimiento, estado, banco, sucursal, c.creation_date, c.creation_user,
        c.last_update, c.user_update, cuenta, titular_cuenta, nit_cuenta,
        nombre_beneficiario, c.nit_beneficiario, cheque_cruzado,
        cheque_primer_beneficiario, nombre_beneficiario_cap,
        case
        when c.tipo_transferencia = 'E' then 'Electronica'
        when    c.tipo_transferencia = 'C' then 'Cheque'
        when    c.tipo_transferencia = 'I' then 'Interna'
        end as tipo_transferencia,
        case
        when c.tipo_cuenta = 'CC' then 'Corriente'
        when    c.tipo_cuenta = 'CA' then 'Ahorro'
        end as tipo_cuenta,
        p.payment_name as nombre_inversionista
        from movimientos_captaciones c
        inner join proveedor p on (p.nit = c.nit)
        where c.reg_status!='A' and tipo_movimiento in('RT','RP') and estado ='P' order by fecha;
        
SELECT tipo_movimiento, estado,* FROM movimientos_captaciones WHERE nit = '22320137'; no_transaccion = 'T08889';




-- Obtiene inversionistas----
select
            i.dstrct,
                i.nit,
               i.nit_parentesco,
                n.nombre
            from inversionista i
            join nit n
            on i.nit = n.cedula
            where i.dstrct = 'FINV'
            and i.subcuenta = 0
            and i.reg_status != 'A'
            order by n.nombre;
            
 --Movimientos Inversionista--
           select distinct nit,subcuenta from movimientos_captaciones
        where (dstrct= 'FINV' and nit =  '22320137'   and estado in('','T'))
        
   select *,i.nombre_subcuenta
        from movimientos_captaciones m
        inner join inversionista i on(i.nit=m.nit and i.subcuenta=m.subcuenta)
        where m.dstrct= 'FINV' and m.nit =  '9011566221' and m.subcuenta = '1' and estado in('','T')   order by fecha desc,no_transaccion desc  limit 1