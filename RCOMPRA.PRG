SET TALK OFF
SET ECHO OFF
SET SAFE OFF
SET ESCA OFF
SET STAT OFF
SET SYSMENU OFF AUTOMATIC
SET PROCEDURE TO C:/LUNA/FUNCION/FUNCI
SET CENTURY ON
V_OB = 1
DO WHILE V_OB <> 5
do menu
@2,65 SAY DATE()
@8,35  GET V_OB picture [@*TV A\<BRIR   ;\<INGRESAR;IM\<PRIMIR;\<VERIFICAR;\<SALIR   ]
READ
	DO CASE
		CASE V_OB = 1
		ON ERROR DO ERRORES WITH ;
		ERROR(), MESSAGE(), MESSAGE(1), PROGRAM(), LINENO()

		clear
			NOM=SPACE(15)
			NOM=dirtabla()
			USE ALLTRIM(NOM) IN 1
			NUC = FCOUNT(1)
			IF NUC > 17 .OR. NUC < 17
				WAIT WINDOWS 'LA TABLA ABIERTA NO ES DE COMPRAS' TIMEOUT 1
				CLOSE DATA NOM
				LOOP
			ELSE
				WAIT WINDOWS 'TABLA DE COMPRAS OKEY' TIMEOUT 1
				index on proveedor tag prove
				do menu	
			ENDIF
			 
		CASE V_OB = 2
				ON ERROR DO ERRORES WITH ;
				ERROR(), MESSAGE(), MESSAGE(1), PROGRAM(), LINENO()

		 		clear
				GO BOTTOM
				APPEND

		CASE V_OB = 3
			ON ERROR DO ERRORES WITH ;
			ERROR(), MESSAGE(), MESSAGE(1), PROGRAM(), LINENO()

			POB =1
			@10,45  GET POB picture [@*TV TO\<TAL;\<PAGINAS;\?\<SALIR]
			READ
			DO CASE 
				CASE POB =2
					clear
					obp1 = space(1)
					obp2	 = space(1)
					V_OBB1 =SPACE(1)
					OPO= SPACE(1)
					DO MARCO WITH 1,1,40,80
					do imagen with 8,15
					@5,15 SAY "Decea Imprimir Algunas Pag. [ N/S ]" GET V_OBB1 PICTURE [@!] VALID V_OBB1 $ "SN"
					READ
				
					DO CASE  
						CASE V_OBB1 = 'S'
							CLEAR 
							DO MARCO WITH 1,1,40,80
			        		DO IMAGEN with 4,15
			      			@19,23 say 'Ingrese pagina Ini. [ ]'
							@20,23 say 'ingrese pagina Fin. [ ]'
							@19,28+19 get obp1 PICTURE [@9]
							@20,28+19 get obp2 PICTURE [@9]
							READ
				
				
								@23,5 SAY 'CONTINUAR N/S' GET OPO PICTURE [@!] VALID OPO $ "SN"
								READ
									DO CASE
										CASE OPO = 'N'
											LOOP
										CASE OPO = 'S' 
			   							SET PRINTER ON
			   							VOP = IMPCON()
			   							IF VOP = .T. 
			   								DO IMPRIME WITH int(val(obp1)),int(val(obp2))       
											do menu
											ELSE
											loop
										ENDIF
									ENDCASE	
							CASE V_OBB1 = 'N'
								DO MARCO WITH 7,2,39,79
								TT ='SALIENDO DEL PRINT [Enter]'
								TT2='***[EPSON FX - 1170]***'
								DO CENTRADO WITH TT2,6
							DO CENTRADO WITH TT,21
							READ
							LOOP	
						ENDCASE
					CASE POB =1
					  ip=impcon()
					  if ip = .t.
					  set escape on
						ON escape DO ERRORES WITH ;
						ERROR(), MESSAGE(), MESSAGE(1), PROGRAM(), LINENO()

					    REPOR FORM C:/LUNA/COMPRAS TO PRINTER
					  else
					  	loop
					  endif          
					ENDCASE	
		CASE V_OB = 4
		ON ERROR DO ERRORES WITH ;
		ERROR(), MESSAGE(), MESSAGE(1), PROGRAM(), LINENO()

		CLEAR
		REPOR FORM C:/LUNA/COMPRAS PREVIE
			
		CASE V_OB = 5
		CLEAR
		close all
		OTHERWISE
		WAIT WINDOWS 'OBCION ERRADA'
	ENDCASE
ENDDO
******************************************************************
FUNCTION DIRTABLA
DO MARCO WITH 1,1,40,80
WAIT WINDOWS 'ESCOGER  ARCHIVO DE BDF'TIMEOUT 1
NA = GETFILE('DBF')
RUT=fullpath(NA)
RETURN RUT
*******************************************************************
procedure menu
TXT ='*** REGISTROS DE COMPRAS ***'
TX  ='*** MENU ***'
CO = (80-LEN(TXT))/2
CO2 = (80-LEN(TX))/2
CLEAR
@01,01,40,80 BOX REPLICATE(CHR(177),9)
@01,01,40,80 BOX
@06,29,15,50 BOX
@02,CO SAY TXT
@05,CO2 SAY TX


**************************************************
PROCEDURE IMPRIME
PARAMETER PAGI,PAGF
set escape on
ON escape DO ERRORES WITH ;
ERROR(), MESSAGE(), MESSAGE(1), PROGRAM(), LINENO()

	   PRINT JOB
	    
	   		_PLENGTH = 47
	   	    _PEJECT = "BOTH"
	   		_PLOFFESET =0
			_Pbpage = PAGI 	   		
	       	_PEPAGE = PAGF
		    REPOR FORM C:/LUNA/COMPRAS        
      ENDPRINTJOB
      SET PRINTER OFF
    
******************************************************
FUNCTION IMPCON
	OP = PRINTSTATUS()
	IF NOT PRINTSTATUS()
		WAIT WINDOWS 'IMPRESORA NO PREPARADA' TIMEOUT 2
	ELSE
		WAIT WINDOWS 'IMPRESORA LISTA ' TIMEOUT 2
	ENDIF
	RETURN OP 	
	
********************************************
procedure imagen
parameter fi,co
@FI-1,CO-1,FI+13,CO+50 BOX
@fi,co SAY '             *******************                  '
@fi+1,co SAY '             *******************                  '
@fi+2,co SAY '             *******************                  '
@fi+3,co SAY '             *******************                  '
@fi+3,co SAY ' ************************************             '
@fi+4,co SAy '*                          ####   *  *            '	
@fi+5,co SAY '*      *********************       *   *          ' 
@fi+6,co SAY '*      *********************        *    *        '
@fi+7,co SAY '*     *********************          *     *      '
@fi+8,co SAY '***************************************      *    '
@fi+9,co SAY '*******.......................**********     *    '
@fi+10,co SAY '***************************************   *       '
@fi+11,co SAY '****************************************          '
@fi+12,co SAY '         ****IMPRESORA****                        '
	     
 ************************************************************

PROCEDURE errores
PARAMETER merror, mens, mens1, mprog, mn£ml¡n
wait windows  'N£mero de error: ' + LTRIM(STR(merror))+ chr(13) +;
 'Mensaje de error: ' + mens + chr(13) +;
 'L¡nea de c¢digo con error: ' + mens1 + chr(13) +;
 'N£mero de l¡nea de error: ' + LTRIM(STR(mn£ml¡n)) + chr(13) +;
 'Programa con error: ' + mprog + chr(13) +;
 'Espere 4 Segundos ' timeout 4


