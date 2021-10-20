*	PROGRAMA DE REPORTE DE REGISTROS DE COMPRAS
* ADVERTENCIA:	Este programa funciona 
*				perfectamente, si desea 
*				efectuar alguna modificacion,
*				grabe el archivo con un 
*				nombre diferente.

*	Nota:		De preferencia, ejecutar este 
*				programa en dbase III

set status on
SET DEFA TO C:\DABSE20\COLARETA
clear
@2,16 SAY "REPORTE DE REGISTROS"
@3,18 SAY "(VENTAS)"
@1,15 TO 4,35 DOUBLE
stor spac(12) to archivo
stor spac(30) to empresa
stor spac(10) to mes
stor year(date()) to anho

@6,10 say "Ingrese nombre de tabla a reportar: "
@6,45 get archivo
@7,13 say "(presione [ESC] para salir)"
@8,10 say "Ingrese mes y a¤o del reporte:"
@8,45 get mes
@8,60 get anho
@10,10 say "Ingrese el nombre de la empresa: "
@10,45 get empresa
on escape cancel
read

set device to printer
@1,3 say empresa
@1,180 say mes + " " + str(anho)
@2, 100 say "REGISTRO DE VENTAS"
@3,1 say "______________________________________________________________________________________________________________________________________________________________________________________________________"
set device to screen
clear
@11,30 to 13,45
@12,31 say "Imprimiendo cabecera..."
set console off
set device to printer
@4,2 say "Nro."
@4,8 say "Fecha"
@4,16 say "Tipo"
@4,22 say "Nro de"
@4,34 say "Nro"
@4,48 say "Cliente"
@4,80 say "Codigo"
@4,90 say "Articulo"
@4,115 say "V.dolares"
@4,125 say "V.dolares"
@4,135 say "Tipo"
@4,145 say "V.soles"
@4,155 say "V.soles"
@4,165 say "IGV"
*!*	@4,175 say "Retenc."
*!*	@4,185 say "IES"
@4,190 say "Total"

@5,1 say "asient."
@5,16 say "Doc"
@5,22 say "factura"
@5,34 say "RUC"
@5,80 say "de Cta."
@5,115 say "afecto"
@5,125 say "no afecto"
@5,135 say "cambio"
@5,145 say "afecto"
@5,155 say "no afecto"
*!*	@5,175 say "4ta cat."


@6,1 say "______________________________________________________________________________________________________________________________________________________________________________________________________"

stor spac(6) to a
stor spac(8) to b
stor spac(4) to c
stor spac(12) to d
stor spac(8) to e
stor spac(30) to f
stor spac(7) to g
stor spac(40) to h
stor 0 to i
stor 0 to j
stor 0 to k
stor 0 to l
stor 0 to m
stor 0 to n
stor 0 to o
stor 0 to p
stor 0 to q
use &archivo
stor 7 to fila
do while .not. eof()
	a = ltrim(rtrim(NRO_ASIENT))
	b = FECH_M_D_A
	c = ltrim(rtrim(TIPO_DOCUM))
	d = ltrim(rtrim(NRO_FACTUR))
	e = ltrim(rtrim(NRO_RUC))
	f = ltrim(rtrim(CLIENTE))
	g = ltrim(rtrim(COD_CTA))
	h = ltrim(rtrim(ARTICULO))
	i = V_DOL_AFEC
	j = V_DOL_NAFE
	k = TIPO_CAMBI
	l = V_SOL_AFEC
	m = V_SOL_NAFE
	n = IGV
*!*		o = RET_4TA
*!*		p = IES
	q = TOTAL
	
	
	@fila,2 say a

	@fila,8 say b

	@fila,17 say c

	@fila,22 say d
	
	@fila,34 say e

	@fila,48 say f

	@fila,80 say g

	@fila,90 say h

	@fila,105 say i

	@fila,115 say j

	@fila,125 say k

	@fila,135 say l

	@fila,145 say m

	@fila,155 say n

*!*		@fila,165 say o

*!*		@fila,175 say p

	@fila,185 say q

	fila=fila+1
	skip
*!*		IF PROW() > 15
*!*	      EJECT
*!*	   ENDIF
enddo
@fila,1 say "______________________________________________________________________________________________________________________________________________________________________________________________________"
set console on
set device to screen
clear
@11,30 to 13,45
@12,31 say "Imprimiendo detalles..."
sum V_DOL_AFEC to i
sum V_DOL_NAFE to j
sum V_SOL_AFEC to k
sum V_SOL_NAFE to l
sum IGV to m
*!*	sum RET_4TA to n
*!*	sum IES to o
sum TOTAL to p

set device to printer
@ fila + 1,80 say "TOTAL:"
@ fila + 1,105 say i
@ fila + 1,115 say j
@ fila + 1,135 say k
@ fila + 1,145 say l
@ fila + 1,155 say m
@ fila + 1,165 say n
@ fila + 1,175 say o
@ fila + 1,185 say p
@ fila + 2,1 say "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
set device to screen
clear
@11,30 to 13,55
@12,31 say "Imprimiendo totales..."

eject
clear memory
close all
return
