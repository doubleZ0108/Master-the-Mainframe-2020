/* REXX */
/************************************************************************/
/* Final code to generate Luhn Compatible CC Numbers */
/* Author: doubleZ */
/************************************************************************/
count=0
incmplt_cc.=0
credit_card.=0
cc.=0
ints.=0
svaps=''
sum=0
enough=0
do WHILE(count<500)
    part1=RANDOM(0,9)||RANDOM(0,9)|| RANDOM(0,9)||RANDOM(0,9)|| RANDOM(0,9)
    part2=RANDOM(0,9)||RANDOM(0,9)|| RANDOM(0,9)||RANDOM(0,9)|| RANDOM(0,9)
    part3=RANDOM(0,9)||RANDOM(0,9)|| RANDOM(0,9)
    incmplt_cc.count= 88 ||part1||part2||part3
    cd.count = generate_checksum(incmplt_cc.count)
    credit_card.count = cd.count
    cc.count = incmplt_cc.count||credit_card.count
    say '000'cc.count
    m = LUHN(cc.count)
    count=count+1
end
do i = 1 to 500
    if length(cc.i) = 16 then
       say '000'cc.i
end
EXIT

generate_checksum:
  PARSE ARG incmplt_cc
  sum=0
  len_of_incomplt_ccard = LENGTH(incmplt_cc)
  do i = 1 to len_of_incomplt_ccard
    ints.i = SUBSTR(incmplt_cc,i,1)
    svaps = svaps || ints.i
  end
  do i = len_of_incomplt_ccard to 0 by -2
    j = ints.i
    j = j*2
    if j>9 then
      j = j//10 + 1
    ints.i =j
  end
  do i=0 to len_of_incomplt_ccard
    sum= sum + ints.i
  end
  if sum//10 = 0 then
    return 0
  else
    return 10-(sum//10)


LUHN:
  Parse Arg ccn
  sum2=0
  even=0
  Do i=length(ccn) To 1 By -1
    c=substr(ccn,i,1)
    If even Then Do
      c=c*2
      If c>=10 Then
        c=c-9
      end
    even=\even
    sum2=sum2+c
  END
  Return right(sum2,1)=9

