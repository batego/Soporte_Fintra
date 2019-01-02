SELECT num_ingreso, fecha_ingreso, nitcli, get_nombc(nitcli), * FROM con.ingreso WHERE num_ingreso in ('IA448673');

SELECT * FROM con.factura WHERE documento ilike 'NM09923_36%' LIMIT 100;
SELECT * FROM con.comprobante WHERE numdoc ilike 'NM09923_36%';

SELECT documento, fecha_factura, fecha_vencimiento, nit, get_nombc(nit) FROM con.factura WHERE documento IN ('R0030350',
'R0028423',
'R0030511',
'R0029510',
'R0028522',
'R0029629',
'R0031171',
'R0032133',
'R0024073',
'R0025266',
'R0027558',
'R0027559',
'R0027561',
'R0027902',
'R0027904',
'R0028213',
'R0028216',
'R0028552',
'R0028740',
'R0029687',
'R0029694',
'R0029698',
'R0029954',
'R0030355',
'R0030356',
'R0030619',
'R0030620',
'R0030621',
'R0030622',
'R0030623',
'R0030833',
'R0030834',
'R0030835',
'R0030836',
'R0030837',
'R0031069',
'R0031070',
'R0031071',
'R0031072',
'R0031489',
'R0031922',
'R0031923',
'R0031924',
'R0031925',
'R0032203',
'R0032204',
'R0032205',
'R0032206',
'R0032207',
'R0032208',
'R0032209',
'R0032210',
'R0032211',
'R0032212',
'R0016305',
'R0016395',
'R0016580',
'R0017311',
'R0018499',
'R0018501',
'R0018727',
'R0018796',
'R0019834',
'R0020065',
'R0020463',
'R0020464',
'R0020862',
'R0020875',
'R0021039',
'R0021095',
'R0021749',
'R0022416',
'R0024582',
'NM09865_13',
'NM09865_14',
'NM09865_15',
'NM09865_16',
'NM09865_17',
'NM09865_18',
'NM09865_19',
'NM09865_20',
'NM09865_21',
'NM09865_22',
'NM09865_23',
'NM09865_24',
'NM09865_25',
'NM09865_26',
'NM09865_27',
'NM09865_28',
'NM09865_29',
'NM09865_30',
'NM09865_31',
'NM09865_32',
'NM09865_33',
'NM09865_34',
'NM09865_35',
'NM09865_36',
'NM09868_34',
'NM09868_35',
'NM09868_36',
'NM09877_33',
'NM09877_34',
'NM09877_35',
'NM09877_36',
'NM09883_36',
'NM09886_36',
'NM09888_21',
'NM09888_22',
'NM09888_23',
'NM09888_24',
'NM09888_25',
'NM09888_26',
'NM09888_27',
'NM09888_28',
'NM09888_29',
'NM09888_30',
'NM09888_31',
'NM09888_32',
'NM09888_33',
'NM09888_34',
'NM09888_35',
'NM09888_36',
'NM09901_35',
'NM09901_36',
'NM09902_36',
'NM09903_36',
'NM09905_36',
'NM09906_36',
'NM09912_36',
'NM09913_35',
'NM09913_36',
'NM09916_34',
'NM09916_35',
'NM09916_36',
'NM09965_36',
'NM09975_34',
'NM09975_35',
'NM09975_36',
'NM09978_25',
'NM09978_26',
'NM09978_27',
'NM09978_28',
'NM09978_29',
'NM09978_30',
'NM09978_31',
'NM09978_32',
'NM09978_33',
'NM09978_34',
'NM09978_35',
'NM09978_36',
'NM09979_35',
'NM09979_36',
'NM09981_36',
'NM09982_35',
'NM09982_36',
'NM09984_31',
'NM09984_32',
'NM09984_33',
'NM09984_34',
'NM09984_35',
'NM09984_36',
'NM09994_34',
'NM09994_35',
'NM09994_36',
'NM09995_31',
'NM09995_32',
'NM09995_33',
'NM09995_34',
'NM09995_35',
'NM09995_36',
'NM09997_6',
'NM10010_25',
'NM10010_26',
'NM10010_27',
'NM10010_28',
'NM10010_29',
'NM10010_30',
'NM10010_31',
'NM10010_32',
'NM10010_33',
'NM10010_34',
'NM10010_35',
'NM10010_36',
'NM10015_32',
'NM10015_33',
'NM10015_34',
'NM10015_35',
'NM10015_36',
'NM10018_17',
'NM10018_18',
'NM10018_19',
'NM10018_20',
'NM10018_21',
'NM10018_22',
'NM10018_23',
'NM10018_24',
'NM10025_15',
'NM10025_16',
'NM10025_17',
'NM10025_18',
'R0024699',
'NM09832_36',
'NM09841_36',
'NM09863_36',
'NM09876_36',
'NM09892_36',
'NM09900_36',
'NM09901_34',
'NM09913_34',
'NM09916_33',
'NM09921_27',
'NM09921_28',
'NM09921_29',
'NM09921_31',
'NM09921_32',
'NM09921_33',
'NM09921_34',
'NM09923_36',
'NM09925_36',
'NM09933_27',
'NM09933_28',
'NM09933_29',
'NM09933_31',
'NM09933_32',
'NM09933_33',
'NM09933_34',
'NM09950_36',
'NM09955_36',
'NM09966_36',
'NM09980_24',
'NM09985_9',
'NM10025_14',
'R0024696',
'RE00622',
'RE00627',
'RE00632',
'RE00635',
'RE00640',
'RE00657',
'RE00540',
'RE00554',
'RE00557',
'RE00567',
'RE00581',
'RE00585',
'RE00590',
'RE00597',
'RE00599',
'RE00602',
'RE00605',
'RE00609',
'RE00613',
'RE00616',
'RE00617',
'RE00618',
'RE00621',
'RE00626',
'RE00631',
'RE00636',
'RE00641',
'RE00645',
'RE00648',
'RE00658',
'RE00662',
'RE00683',
'RE00689',
'RE00693',
'RE00696',
'RE00700',
'RE00706',
'RE00711'
);