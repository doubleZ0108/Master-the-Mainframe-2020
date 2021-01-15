       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID.    TOPACCTS.
       AUTHOR.        STUDENT.
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUST-RECS ASSIGN TO CUSTRECS.
           SELECT TOP-FILE ASSIGN TO TOPFILE.
       DATA DIVISION.
      *
       FILE SECTION.
       FD CUST-RECS RECORD CONTAINS 80 CHARACTERS RECORDING MODE F.
       01 CUST-REC.
           05 CUST-FIRST-NAME          PIC X(11).
           05 CUST-LAST-NAME           PIC X(22).
           05 CUST-FIRST-NUM           PIC 9(8).
           05 FILLER                   PIC X(3).
           05 CUST-LAST-NUM            PIC 9(8).
           05 FILLER                   PIC X(9).
           05 CUST-BALANCE             PIC Z,ZZZ,ZZ9.99.
           05 FILLER                   PIC X(7).
       FD TOP-FILE RECORD CONTAINS 80 CHARACTERS RECORDING MODE F.
       01 TOP-HEAD.
           05 PRT-HEADING             PIC X(80) VALUE SPACES.
       01 TOP-REC.
           05 PRT-NAME                PIC X(28) VALUE SPACES.
           05 PRT-BALANCE             PIC Z,ZZZ,ZZ9.99 VALUE SPACES.
           05 FILLER                  PIC X(40) VALUE SPACES.
       WORKING-STORAGE SECTION.
       01 CUST-RECS-EOF               PIC X.
       01 CUST-LARGE                  PIC 999.
       01 CUST-LARGE-Z                PIC ZZ9.
       01 CURRENT-DATE-DATA.
           05  CURRENT-DATE.
              10  CURRENT-YEAR       PIC 9999.
              10  CURRENT-MONTH      PIC 99.
              10  CURRENT-DAY        PIC 99.
       PROCEDURE DIVISION.
      *
           OPEN INPUT CUST-RECS
           MOVE 0 TO CUST-LARGE
           MOVE "N" TO CUST-RECS-EOF
           PERFORM UNTIL CUST-RECS-EOF = "Y"
              READ CUST-RECS
                 AT END MOVE "Y" TO CUST-RECS-EOF
              END-READ
              IF FUNCTION NUMVAL-C(CUST-BALANCE) > 8500000 THEN
                 ADD 1 TO CUST-LARGE
              END-IF
           END-PERFORM
           CLOSE CUST-RECS
           OPEN OUTPUT TOP-FILE
           MOVE SPACES TO PRT-HEADING
           MOVE "REPORT OF TOP ACCOUNT BALANCE HOLDERS" TO PRT-HEADING
           WRITE TOP-HEAD
           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-DATA
           MOVE SPACES TO PRT-HEADING
           STRING "PREPARED FOR PAT STANARD ON "
              CURRENT-MONTH "." CURRENT-DAY "." CURRENT-YEAR
              DELIMITED BY SIZE INTO PRT-HEADING
           END-STRING
           WRITE TOP-HEAD
           MOVE CUST-LARGE TO CUST-LARGE-Z
           MOVE SPACES TO PRT-HEADING
           STRING "# OF RECORDS:", CUST-LARGE-Z
              DELIMITED BY SIZE INTO PRT-HEADING
           END-STRING
           WRITE TOP-HEAD
           MOVE ALL "=" TO PRT-HEADING
           WRITE TOP-HEAD
           OPEN INPUT CUST-RECS
           MOVE "N" TO CUST-RECS-EOF
           PERFORM UNTIL CUST-RECS-EOF = "Y"
              READ CUST-RECS
                 AT END MOVE "Y" TO CUST-RECS-EOF
              END-READ
              IF FUNCTION NUMVAL-C(CUST-BALANCE) > 8500000 THEN
                 MOVE SPACES TO PRT-HEADING
                 STRING CUST-FIRST-NAME DELIMITED BY SPACE
                    " "
                    CUST-LAST-NAME DELIMITED BY SIZE
                    INTO PRT-NAME
                 END-STRING
                 MOVE CUST-BALANCE TO PRT-BALANCE
                 DISPLAY TOP-REC
                 WRITE TOP-REC
              END-IF
           END-PERFORM
           CLOSE CUST-RECS
           CLOSE TOP-FILE
           STOP RUN.

