//ADD1JCL  JOB 1,NOTIFY=&SYSUID
//***************************************************/
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..SOURCE(ADD1CBL),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(ADD1CBL),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//RUN     EXEC PGM=ADD1CBL
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//PRTDONE   DD DSN=&SYSUID..OUTPUT(PRTDONE),DISP=SHR,SPACE=(TRK,1)
//PRTLINE   DD DSN=&SYSUID..OUTPUT(PRTLINE),DISP=SHR,SPACE=(TRK,1)
//SYSOUT    DD SYSOUT=*,OUTLIM=15000
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//***************************************************/
// ELSE
// ENDIF

