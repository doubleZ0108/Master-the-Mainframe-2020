//TOPJCL   JOB 1,NOTIFY=&SYSUID
//TOPIGY  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..SOURCE(TOPACCTS),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(TOPACCTS),DISP=SHR
// IF RC = 0 THEN
//TOPRUN EXEC PGM=TOPACCTS
//STEPLIB  DD DSN=&SYSUID..LOAD,DISP=SHR
//TOPFILE  DD DSN=&SYSUID..OUTPUT(TOPACCTS),DISP=SHR
//CUSTRECS DD DSN=MTM2020.PUBLIC.INPUT(CUSTRECS),DISP=SHR
//SYSOUT   DD SYSOUT=*
//CEEDUMP  DD DUMMY
//SYSUDUMP DD DUMMY
// ELSE
// ENDIF

