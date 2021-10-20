**PANTALLA INICIAL PARA REPORTES***
***********************************

****ATENCION******
*Este programa  debe ser modificado. Para modificarlo copiarlo 
*y  realizar las modificaciones que deseen.....

SET DEFA TO C:\DABSE20\COLARETA
clear
close all
@2,16 SAY "R E P O R T E   D E   R E G I S T R O S"
@4,16 SAY "    (C O M P R A S  -  V E N T A S)"
@6,16 SAY "***************************************"

stor spac(12) to archivo
@9,18 say "Ingrese nombre de tabla a reportar : "
@13,30 get archivo
@20,18 say " (para salir escriba  [0]  <cero>)" 
read

if archivo = "0"
	return
endif

set device to printer
@5,3 say "CIA  COLARETA"
@5,28 say "REGISTRO   DE   COMPRAS"
@5,65 say "MAYO 2000"
@7,1 say "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
set device to screen
do progr2
return
	