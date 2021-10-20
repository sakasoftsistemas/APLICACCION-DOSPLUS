
SET DEFAULT TO C:\DBASE\CARDINE
set date brit
CLEAR
close all
@ 5,5 SAY "CREACION DE LIBRO DIARIO"
stor spac(12) to nlcompras
stor spac(12) to nlventas
stor spac(12) to nldanterior
stor spac(12) to nldiario

@10,2 say "Ingrese el nombre de la tabla del registro de compras" 
@10,65 get nlcompras
@12,2 say "Ingrese el nombre de la tabla del registro de ventas"
@12,65 get nlventas
@16,2 say "Ingrese el nombre de la tabla de libro diario a crear"
@16,65 get nldiario
read

use cgdi
copy structure to &nldiario
use  &nldiario
select 1
use &nlcompras
select 2
use &nldiario

select 1
stor(6) to n_asi
stor date() to fec
stor spac(4)to t_d
stor spac(12) to factura
stor spac(8) to ruc
stor spac(30)to prov
stor spac(7) to ccta
stor 0.00 to vsa
stor 0.00 to vsna
stor 0.00 to vigv
stor 0.00 to vret
stor 0.00 to vies
stor 0.00 to vtotal

sum IGV to igvtotal
sum RET_4TA TO ret4tatotal
sum IES to iestotal
sum total to tottotal

count to a
stor 1 to b
DO WHILE b<=a
goto b
asi=N_Asi
fec=FECH_M_D_A
td=T_D
factura=NRO_FACTUR
ruc=NRO_RUC
prov=PROVEEDOR
ccta=COD_CTA
vsa=V_SOL_AFEC
vsna=V_SOL_NAFE
vigv=IGV
vret=RET_4TA
vies=IES
vtotal=TOTAL

select 2

go bottom
append blank
replace N_ASI with str(asi)
replace DIA with day(fec)
replace COD_CTA with ccta
replace CONCEPTO with ltrim(rtrim(td))+"/"+ltrim(rtrim(factura)) +"/"+ltrim(rtrim(prov))+"/"+ltrim(rtrim(ruc))
replace M_DEBE with vsa+vsna
replace M_HABER with 0
select 1
b= b+1

enddo
if month(fec)=4 .or. month(fec)=6 .or. month(fec)=9 .or. month(fec)=11
   finmes=30
else
    if month(fec)=2
     finmes=28
else
finmes=31
endif
endif

select 2
go bottom
append blank

replace  N_ASI with str(asi)
replace  DIA with finmes
replace  COD_CTA with "   4011"
replace  CONCEPTO with "IGV registro de compras"
replace  M_DEBE with igvtotal
replace  M_HABER with 0

if ret4tatotal <> 0
go bottom
append blank
replace N_ASI with asi
replace DIA with finmes
replace COD_CTA with "   4014"
replace CONCEPTO with "Retencion 4ta categoria"
replace M_DEBE with 0
replace M_HABER with ret4tatotal
endif
if iestotal <> 0
go bottom
append blank
replace N_ASI with asi
replace DIA with finmes
replace COD_CTA with "   4034"
replace CONCEPTO with "Imp.E.S."
replace M_DEBE with 0
replace M_HABER with iestotal
endif
go bottom
append blank
replace N_ASI with str(asi)
replace DIA with finmes
replace COD_CTA with "    421"
replace CONCEPTO with "REGISTRO DE COMPRAS"
replace M_DEBE with 0
replace M_HABER with tottotal

***REGISTRO DE VENTAS***
select 3
use &nlventas
select 3
sum V_SOL_AFEC TO tvsa
sum V_SOL_NAFE TO tvsn
sum IGV TO tigv
sum TOTAL TO ttotal
stor 0 to sumafec
sumafec=tvsa+tvsn
select 2
go bottom
append blank
replace N_ASI with str(asi)
replace DIA with finmes
replace COD_CTA with "    121"
replace CONCEPTO with "REGISTRO DE VENTAS"
replace M_DEBE with ttotal
replace M_HABER with 0
go bottom
append blank
replace N_ASI with str(asi)
replace DIA with finmes
replace COD_CTA with "   4011"
replace CONCEPTO with "REGISTRO DE VENTAS(IGV)"
replace M_DEBE with 0
replace M_HABER with tigv
go bottom
append blank
replace N_ASI with str(asi)
replace DIA with finmes
replace COD_CTA with "    703"
replace CONCEPTO with "REGISTRO DE VENTAS(sin IGV)"
replace M_DEBE with 0
replace M_HABER with sumafec
close all
clear
