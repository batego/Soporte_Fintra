--aGRAGAR USUARIO A LA TABA SERIES_CHEQUE_USUARIOS
SELECT
                       b.id,
                       b.concepto,
                       b.dstrct,
                       b.branch_code,
                       b.bank_account_no,
                       b.account_number,
                       b.agency_id,
                       b.prefix,
                       b.serial_initial_no,
                       b.serial_fished_no,
                       b.last_number  

                FROM   series_cheque_usuarios  a,
                       series                  b
                WHERE
                       a.dstrct            =   'FINV'
                  AND  a.usuario           =   'NGRANADI'
                  AND  a.concepto          =   'CXP'
                  AND  a.reg_status        =  ''
                  AND  b.id                =  a.id
                  AND  b.dstrct            =  a.dstrct
                  AND  b.reg_status        =  ''
                  AND  b.concepto          =  a.concepto
--                  AND  b.branch_code       =   ?
--                  AND  b.bank_account_no   =   ?
                  --AND  (b.agency_id        =   ?  or  b.agency_id in ('YO','DU'))
                  AND  b.document_type     =  '004'
                  AND  b.serial_fished_no::numeric >= b.last_number

                ORDER BY  b.last_number
                LIMIT 1