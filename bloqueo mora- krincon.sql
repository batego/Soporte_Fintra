select mora, NIT, CODCLI from CLIENTE where codcli in ('CL01342');,
'CL04116',
'CL01342',
'CL04168',
'CL01655',
'CL03613',
'CL03231',
'CL02636',
'CL02580',
'CL03634',
'CL01221',
'CL02493',
'CL00002',
'CL03993',
'CL03099',
'CL04171',
'CL04216',
'CL04129',
'CL02132',
'CL01299',
'CL01357',
'CL04152',
'CL00118',
'CL01500',
'CL02455',
'CL00869',
'CL01524',
'CL00513',
'CL00889',
'CL02478',
'CL03015',
'CL04020',
'CL04219',
'CL03637',
'CL03785',
'CL01582',
'CL02421',
'CL02173',
'CL00104',
'CL04207',
'CL03573',
'CL03925',
'CL01557',
'CL04062',
'CL03413',
'CL03654',
'CL00576',
'CL01226',
'CL03052',
'CL03538',
'CL03951',
'CL02630'
);
update CLIENTE set MORA = 'N' where codcli in ('CL01342');,
'CL04116',
'CL01342',
'CL04168',
'CL01655',
'CL03613',
'CL03231',
'CL02636',
'CL02580',
'CL03634',
'CL01221',
'CL02493',
'CL00002',
'CL03993',
'CL03099',
'CL04171',
'CL04216',
'CL04129',
'CL02132',
'CL01299',
'CL01357',
'CL04152',
'CL00118',
'CL01500',
'CL02455',
'CL00869',
'CL01524',
'CL00513',
'CL00889',
'CL02478',
'CL03015',
'CL04020',
'CL04219',
'CL03637',
'CL03785',
'CL01582',
'CL02421',
'CL02173',
'CL00104',
'CL04207',
'CL03573',
'CL03925',
'CL01557',
'CL04062',
'CL03413',
'CL03654',
'CL00576',
'CL01226',
'CL03052',
'CL03538',
'CL03951',
'CL02630');

select * from DATOSOPER where cliente in ('CL01342') and CODICONCEPTO = '4146';,
'CL04116',
'CL01342',
'CL04168',
'CL01655',
'CL03613',
'CL03231',
'CL02636',
'CL02580',
'CL03634',
'CL01221',
'CL02493',
'CL00002',
'CL03993',
'CL03099',
'CL04171',
'CL04216',
'CL04129',
'CL02132',
'CL01299',
'CL01357',
'CL04152',
'CL00118',
'CL01500',
'CL02455',
'CL00869',
'CL01524',
'CL00513',
'CL00889',
'CL02478',
'CL03015',
'CL04020',
'CL04219',
'CL03637',
'CL03785',
'CL01582',
'CL02421',
'CL02173',
'CL00104',
'CL04207',
'CL03573',
'CL03925',
'CL01557',
'CL04062',
'CL03413',
'CL03654',
'CL00576',
'CL01226',
'CL03052',
'CL03538',
'CL03951',
'CL02630') and CODICONCEPTO = '4146';
-- update DATOSOPER set mora = 'S' where cliente in ('CL01342') and CODICONCEPTO = '4146';,
'CL04116',
'CL01342',
'CL04168',
'CL01655',
'CL03613',
'CL03231',
'CL02636',
'CL02580',
'CL03634',
'CL01221',
'CL02493',
'CL00002',
'CL03993',
'CL03099',
'CL04171',
'CL04216',
'CL04129',
'CL02132',
'CL01299',
'CL01357',
'CL04152',
'CL00118',
'CL01500',
'CL02455',
'CL00869',
'CL01524',
'CL00513',
'CL00889',
'CL02478',
'CL03015',
'CL04020',
'CL04219',
'CL03637',
'CL03785',
'CL01582',
'CL02421',
'CL02173',
'CL00104',
'CL04207',
'CL03573',
'CL03925',
'CL01557',
'CL04062',
'CL03413',
'CL03654',
'CL00576',
'CL01226',
'CL03052',
'CL03538',
'CL03951',
'CL02630') and CODICONCEPTO = '4146';