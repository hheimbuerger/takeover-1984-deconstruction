5 REM 'MILITARYCOUP'WALWYN10 GOSUB700012 DIM W$(5),WF$(5)13 FORJ=1TO5:READW$(J):NEXTJ14 DATA COMMUNIST,SOCIALIST,LIBERAL,RIGHTWING,FASCIST15 FORJ=1TO5:READWF$(J):NEXTJ16 DATA WILL,PROBABLY WILL17 DATA MIGHT,PROBABLY WON'T18 DATA WILL NOT19 GOSUB6000:REM INSTR. & QUESTIONS20 REM *** SET UP INITIAL DATA ***22 DIM B$(15),L(15),G(15),S(15),B(15)24 REM B$...THE NAME OF THE BUILDINGS26 REM L....THE POLITICAL LEANING (1-5)28 REM G....PRO-GOVERNMENT (-2 TO +6)30 REM S....POINTS32 REM B....RESULTANT LOYALTY TO XERXES (1-5)35 DIM M5(8,12),B5(8,12)36 REM M5=+1:GOVT -1:ME. B5=BUILDING SUBSCRIPT NUMBER39 POKEUG,U140 PRINTUF$;"AT THE START OF THE GAME, WILL ANY OF "41 PRINT"THE FOLLOWING BUILDINGS JOIN THE REBELS?"42 PRINTU5$"(MAKE A NOTE OF THE LIKELY TARGETS!)"44 PRINT:FORJ=1TO1545 READ B$(J),L(J),G(J),S(J)50 D$=U3$:B(J)=3-ABS(L(J)-G1)+ABS(L(J)-P1)+G(J)52 B=INT(B(J)+G2-P2):IFB>=5THENB=5:D$=UN$53 IFB<=1THENB=1:D$=UM$55 PRINTD$;"THE ";LEFT$(B$(J),1);"";57 PRINT RIGHT$(B$(J),LEN(B$(J))-1);" "WF$(B)58 NEXTJ61 DATA GOVERNMENT BUILDING,3,2,362 DATA RADIO STATION,3,0,363 DATA NEWSPAPER OFFICE,3,0,264 DATA POLICE STATION,4,2,565 DATA MILITARY HQ,5,1,866 DATA TRADES UNION,1,0,567 DATA XERXES PALACE,3,6,968 DATA UNIVERSITY,1,-2,469 DATA AIRPORT,4,1,370 DATA HOSPITAL,3,0,271 DATA BANK,3,3,172 DATA SHOPPING CENTRE,4,2,173 DATA CATHEDRAL,3,-1,274 DATA FACTORY,2,1,375 DATA JAIL,3,-2,178 FORJ=1TO7:FORK=1TO11:M5(J,K)=0:B5(J,K)=0:NEXTK,J80 D1$="©ί ΝΞίί"81 D2$=CHR$(172)+CHR$(162)+CHR$(187)+""+CHR$(161)82 D2$=D2$+CHR$(32)+""+CHR$(161)+""+CHR$(188)83 D2$=D2$+""+CHR$(162)+""+CHR$(190)84 X$=""85 Y$=""86 REM SET UP MAP87 FORJ=1TO1588 X=INT(RND(1)*5+1)*2:Y=INT(RND(1)*3+1)*2:IFB5(Y,X)<>0THEN8889 B5(Y,X)=J:NEXTJ:PRINT"PRESS ANY KEY TO START"90 GOSUB8000:PRINT"":POKEUB,U3:POKEUG,U1:GOSUB810095 GOSUB8300:GOTO9896 GOSUB3000:REM NEWS98 FORQ=1TO4100 GOSUB8200:A$="":B$="":N1=0:GOSUB9000145 X=0:Y=0150 GOSUB8000180 IFASC(A$)>64ANDASC(A$)<76THENX=ASC(A$)-64:GOTO196185 IFX<>0ANDA>0ANDA<8THENY=A:GOTO200190 IFA$=""THEN400:REM FUNC.1 PRESSED192 IFA$=""THEN500:REM FUNC.3 PRESSED194 IFA$=""THEN600:REM FUNC.5 PRESSED195 GOTO150196 PRINTU0$;""A$:B$=A$197 GOTO150198 NEXTQ:GOTO1000200 GOSUB8200:PRINTU6$"";205 IFB5(Y,X)<>0THEN210206 GOTO215210 PRINT"THERE'S A BUILDING ON SQUARE "B$;A$:GOSUB8050212 GOTO100215 IFM5(Y,X)<0THEN220216 GOTO225220 PRINT"YOU ALREADY HOLD SQUARE "B$;A$:GOSUB8050222 GOTO100225 REM OK TO TAKE230 FORK=1TO2:D9$=U1$:GOSUB8110:D9$="":GOSUB8110:NEXTK235 B=M5(Y-1,X)+M5(Y+1,X)+M5(Y,X+1)+M5(Y,X-1)237 B=B+M5(Y-1,X-1)+M5(Y+1,X+1)+M5(Y-1,X+1)+M5(Y+1,X-1)240 IFB<0THEN300250 PRINTU0$"SQUARE "B$;A$" DOES NOT JOIN THE REVOLUTION"260 GOSUB8050:GOTO1000300 REM SQUARE CHANGES HANDS310 M5(Y,X)=-1:GOSUB8110320 GOTO198400 REM ACTIVATE A BUILDING UNLESS N=1 THEN INFORMATION410 GOSUB8200415 IFN1=0THEN420416 PRINTU6$"INFORMATION ABOUT WHICH BUILDING?"417 GOTO425420 PRINTUF$"WHICH BUILDING DO YOU WISH TO ACTIVATE? "425 PRINT"(TYPE INITIAL LETTER OF BUILDING ONLY)  "430 GOSUB8000435 FORJ=1TO15:IFLEFT$(B$(J),1)=A$THEN440436 NEXTJ:PRINTU0$"THERE IS NO SUCH BUILDING AS '"A$"'        "437 GOSUB8050:GOTO100440 FORX=2TO10STEP2:FORY=2TO6STEP2441 IFB5(Y,X)=JTHEN443442 NEXTY:NEXTX:GOTO100443 B=M5(Y-1,X)+M5(Y+1,X)+M5(Y,X+1)+M5(Y,X-1)444 B=B+M5(Y-1,X-1)+M5(Y+1,X+1)+M5(Y-1,X+1)+M5(Y+1,X-1)448 B=INT(B(J)+B/2+G2-P2):IFB<1THENB=1449 IFB>5THENB=5450 GOSUB8200455 PRINTUF$"THE "B$(J)456 IFM5(Y,X)>=0THEN460457 PRINT"IS ALREADY ON YOUR SIDE!"458 GOSUB8050:GOTO100460 PRINT""WF$(B);" JOIN THE REBELS."462 GOSUB8050:IFN1=1THEN100470 FORK=1TO3:D9$=U1$:GOSUB8110:D9$=U0$:GOSUB8110:NEXTK472 GOSUB8200:D9$=""473 K=INT(RND(1)*3+2)474 IFB<KTHEN480475 IFB>KTHEN490476 PRINTUF$"THE "B$(J)477 PRINT"WISHES TO BE NEUTRAL FOR THE MOMENT."478 IFM5(Y,X)>0THENG3=G3-S(J):G2=G2-.15479 M5(Y,X)=0:GOSUB8110:GOSUB8350:GOSUB8050:GOTO1000480 PRINTUM$"THE "B$(J)482 PRINT"VOTES TO JOIN THE REBELS!"483 P3=P3+S(J):IFM5(Y,X)>0THENG3=G3-S(J)484 M5(Y,X)=-1:GOSUB8110485 P2=P2+.125:G2=G2-.125:GOSUB8350486 GOSUB8050:GOTO198490 PRINTUN$"THE "B$(J)492 PRINT"SIDES WITH THE GOVERNMENT FORCES."493 G3=G3+S(J):IFM5(Y,X)<0THENP3=P3-S(J)494 M5(Y,X)=1:GOSUB8110495 G2=G2+.125:P2=P2-.125:GOSUB8350496 GOSUB8050:GOTO1000500 REM INFORMATION510 N1=1:GOTO400600 GOTO1000999 END1000 REM END OF MY GO2000 REM COMPUTER GO2001 GOSUB3000:REM NEWS2002 FORQ=1TO42005 GOSUB82002010 PRINTUN$"GOVERNMENT MOVE NO."Q2020 FORL=1TO152030 X=INT(RND(1)*5+1)*2:Y=INT(RND(1)*3+1)*22035 J=B5(Y,X)2036 IFM5(Y,X)>0THEN20302038 B=M5(Y-1,X)+M5(Y+1,X)+M5(Y,X+1)+M5(Y,X-1)2039 B=B+M5(Y-1,X-1)+M5(Y+1,X+1)+M5(Y-1,X+1)+M5(Y+1,X-1)2040 B=INT(B(J)+B/2+G2-P2):IFB<1THENB=12045 IFB>5THENB=52050 IFB>=(5-Q/2)THEN22002090 NEXTL:GOTO21002097 NEXTQ:GOTO962100 REM GOVERNMENT CALCULATES A SQUARE2102 FORL=1TO1002105 X=INT(RND(1)*11)+1:Y=INT(RND(1)*7)+12110 IFM5(Y,X)>0ORB5(Y,X)>0THEN21052115 B=M5(Y-1,X)+M5(Y+1,X)+M5(Y,X+1)+M5(Y,X-1)2117 B=B+M5(Y-1,X-1)+M5(Y+1,X+1)+M5(Y-1,X+1)+M5(Y+1,X-1)2120 IFB>0THEN26002125 NEXTL2130 GOTO20972200 REM COMPUTER ACTIVATES A BUILDING2210 PRINTUF$"...IS TO ACTIVATE"2220 PRINT"THE "B$(J)" WHICH IT THINKS"2230 PRINT""WF$(6-B)" JOIN THE GOVERNMENT."2250 FORK=1TO6:D9$=U1$:GOSUB8110:D9$=U0$:GOSUB8110:NEXTK2252 GOSUB8200:D9$=""2255 K=INT(RND(1)*3+2)2256 IFB<KTHEN22702257 IFB>KTHEN22802260 PRINTUF$"THE "B$(J)2262 PRINT"WISHES TO BE NEUTRAL FOR THE MOMENT."2263 IFM5(Y,X)<0THENP3=P3-S(J):P2=P2-.152264 M5(Y,X)=0:GOSUB81102267 GOSUB83502268 GOSUB8050:GOTO962270 PRINTUM$"THE "B$(J)2272 PRINT"VOTES TO JOIN THE REBELS!"2274 P3=P3+S(J):IFM5(Y,X)>0THENG3=G3-S(J)2275 M5(Y,X)=-1:GOSUB81102276 P2=P2+.125:G2=G2-.125:GOSUB83502278 GOSUB8050:GOTO962280 PRINTUN$"THE "B$(J)2282 PRINT"SIDES WITH THE GOVERNMENT FORCES."2284 G3=G3+S(J):IFM5(Y,X)<0THENP3=P3-S(J)2286 M5(Y,X)=1:GOSUB81102287 G2=G2+.125:P2=P2-.125:GOSUB83502288 GOSUB8050:GOTO20972600 REM COMPUTER TAKES OVER A SQUARE2610 FORK=1TO2:D9$=U1$:GOSUB8110:D9$="":GOSUB8110:NEXTK2620 M5(Y,X)=1:GOSUB8110:GOSUB80502630 GOTO20973000 REM NEWS EVENT3002 GOSUB82003005 N$="AND NOW HERE IS THE NEWS................"3010 FORJ=1TOLEN(N$):PRINTU0$;MID$(N$,J,1);3012 POKEUV,15:POKEUA,9:POKEUD,0:POKEUH,303014 POKEUL,0:POKEUW,1293020 POKEUV,0:POKEUA,0:POKEUD,0:POKEUH,0:POKEUL,0:POKEUW,03025 NEXTJ3050 K=INT(RND(1)*10+1)3055 PRINT:GOSUB82003060 ONKGOSUB3090,3090,3090,3092,3092,3094,3096,3097,3098,30993070 FORX=2TO10STEP2:FORY=2TO6STEP23072 IFB5(Y,X)=JTHEN30803074 NEXTY:NEXTX:GOTO30503080 FORL=1TO4:D9$=U1$:GOSUB8110:D9$="":GOSUB8110:NEXTL3083 IFM5(Y,X)=0ANDJ<>13THEN38003085 M5=0:PRINT""UM$;:IFM5(Y,X)>0THENPRINTUN$;:M5=13086 PRINT"THE "B$(J)"                           "3089 ONKGOTO3100,3100,3100,3200,3200,3300,3400,3500,3600,37003090 J=2:RETURN3092 J=3:RETURN3094 J=9:RETURN3096 J=13:RETURN3097 J=10:RETURN3098 J=7:RETURN3099 J=11:RETURN3100 REM RADIO STATION3110 IFM5=1THEN31303120 PRINT"MAKES A PRO-REBEL BROADCAST"3125 GOTO31403130 PRINT"MAKES A PRO-GOVERNMENT BROADCAST"3140 GOSUB8050:GOSUB82003150 IFM5=1THEN31703160 FORK=1TO20:GOSUB4200:NEXTK:GOSUB8050:RETURN3170 FORK=1TO20:GOSUB4300:NEXTK:GOSUB8050:RETURN3200 REM NEWSPAPER OFFICE3210 IFM5=1THEN32303220 PRINT"RELEASES A PRO-REBEL NEWSFLASH"3225 GOTO32403230 PRINT"RELEASES A PRO-GOVERNMENT NEWSFLASH"3240 GOSUB8050:GOSUB82003250 IFM5=1THEN32703260 FORK=1TO12:GOSUB4200:NEXTK:GOSUB8050:RETURN3270 FORK=1TO12:GOSUB4300:NEXTK:GOSUB8050:RETURN3300 REM AIRPORT3310 IFM5=1THEN33303320 PRINT"FLIES SUPPLIES IN TO THE REBELS"3325 GOTO33403330 PRINT"FLIES SUPPLIES IN TO THE GOVERNMENT"3340 GOSUB8050:GOSUB82003350 IFM5=1THEN33703360 GOSUB4000:GOSUB8050:RETURN3370 GOSUB4100:GOSUB8050:RETURN3400 REM CATHEDRAL3402 IFM5(Y,X)<>0THEN34103405 PRINTUF$"MAKES A PLEA FOR AN END TO HOSTILITIES"3408 GOTO34403410 IFM5=1THEN34303420 PRINT"PREACHES A PRO-REBEL SERMON"3425 GOTO34403430 PRINT"PREACHES A PRO-GOVERNMENT SERMON"3440 GOSUB8050:GOSUB82003450 IFM5(Y,X)=0THENFORK=1TO20:GOSUB4400:NEXTK:GOSUB8050:RETURN3455 IFM5=1THEN34703460 FORK=1TO10:GOSUB4200:NEXTK:GOSUB8050:RETURN3470 FORK=1TO10:GOSUB4300:NEXTK:GOSUB8050:RETURN3500 REM HOSPITAL3510 IFM5=1THEN35303520 PRINT"GIVES HELP TO THE REBEL FORCES"3525 GOTO35403530 PRINT"GIVES HELP TO THE GOVERNMENT FORCES"3540 GOSUB8050:GOSUB82003550 IFM5=1THEN35703560 GOSUB4000:GOSUB8050:RETURN3570 GOSUB4100:GOSUB8050:RETURN3600 REM XERXES PALACE3610 IFM5=1THEN36303620 PRINT"RECEIVES REBEL REINFORCEMENTS"3625 GOTO36403630 PRINT"RECEIVES GOVERNMENT REINFORCEMENTS"3640 GOSUB8050:GOSUB82003650 IFM5=1THEN36703660 FORK=1TO12:GOSUB4200:NEXTK:GOSUB8050:RETURN3670 FORK=1TO12:GOSUB4300:NEXTK:GOSUB8050:RETURN3700 REM BANK3710 IFM5=1THEN37303720 PRINT"FREEZES GOVERNMENT ASSETS"3725 GOTO37403730 PRINT"FREEZES REBEL ASSETS"3740 GOSUB8050:GOSUB82003750 IFM5=1THEN37703760 GOSUB4000:GOSUB8050:RETURN3770 GOSUB4100:GOSUB8050:RETURN3800 REM NO NEWS3805 GOSUB82003810 PRINTUF$"";3820 PRINT"THE "B$(J)" REPORTS THAT"3830 PRINT"ALL REMAINS CALM."3840 GOSUB80503850 RETURN4000 REM GOVERNMENT POPULARITY DROPS4010 PRINTUM$"GOVERNMENT POPULARITY FALLS..........."4020 G2=G2-.2:P2=P2+.2:GOSUB8350:RETURN4100 REM REBEL POPULARITY DROPS4110 PRINTUN$"REBEL POPULARITY FALLS..........."4120 P2=P2-.2:G2=G2+.2:GOSUB8350:RETURN4200 REM GOVERNMENT FORCES CHANGE SIDES4210 PRINTUM$"SOME GOVERNMENT FORCES MAY CHANGE SIDES"4220 X=INT(RND(1)*11)+1:Y=INT(RND(1)*7)+14225 IFM5(Y,X)<=0ORB5(Y,X)>0THENRETURN4240 D9$=U1$:GOSUB8110:D9$="":GOSUB81104245 M5(Y,X)=-14250 D9$=U1$:GOSUB8110:D9$="":GOSUB81104260 RETURN4300 REM REBEL FORCES CHANGE SIDES4310 PRINTUN$"SOME REBEL FORCES MAY CHANGE SIDES"4320 X=INT(RND(1)*11)+1:Y=INT(RND(1)*7)+14325 IFM5(Y,X)>=0ORB5(Y,X)>0THENRETURN4340 D9$=U1$:GOSUB8110:D9$="":GOSUB81104345 M5(Y,X)=14350 D9$=U1$:GOSUB8110:D9$="":GOSUB81104360 RETURN4400 REM RANDOM FORCES DESERT4410 PRINTUF$"SOME FORCES FROM EITHER SIDE MAY DESERT"4420 X=INT(RND(1)*11)+1:Y=INT(RND(1)*7)+14425 IFM5(Y,X)=0ORB5(Y,X)>0THENRETURN4440 D9$=U1$:GOSUB8110:D9$="":GOSUB81104445 M5(Y,X)=04450 D9$=U1$:GOSUB8110:D9$="":GOSUB81104460 RETURN6000 REM *** INSTRUCTIONS ***6010 POKEUG,UF:POKEUB,U6:PRINT"";U7$;6020 PRINT"M I L I T A R Y   C O U P"6050 PRINTU8$"IN THIS GAME YOU ATTEMPT TO TAKE OVER"6060 PRINT"THE GOVERNMENT HEADED BY THE EVIL"6062 PRINT"PRESIDENT XERXES. THE GAME IS PLAYED ON"6065 PRINT"A CITY MAP WHICH FEATURES STREETS"6070 PRINT"AND BUILDINGS. YOU ARE THE REBEL FORCES6075 PRINT"AND THE GOVERNMENT IS PLAYED BY THE "6080 PRINT"COMPUTER. POINTS ARE GAINED BY"6085 PRINT"CAPTURING KEY BUILDINGS AND THE FIRST"6090 PRINT"PLAYER TO REACH 35 POINTS IS THE WINNER."6095 PRINTU9$;"             PRESS ANY KEY              "6097 GOSUB80006100 PRINTU8$;"YOU AND I EACH TAKE ALTERNATE TURNS."6110 PRINT"EACH TURN CONSISTS OF FOUR CONSECUTIVE"6120 PRINT"MOVES. IF EITHER IS UNSUCCESSFUL IN ANY"6130 PRINT"MOVE, PLAY REVERTS TO THE OTHER."6140 PRINT"AT EACH MOVE YOU MAY EITHER:"6145 PRINTU7$;"1) TRY TO TAKE OVER A BUILDING SQUARE "6150 PRINTU8$;"   EACH BUILDING HAS A TRADITIONAL   "6152 PRINT"   POLITICAL LEANING, LOYALTY AND"6155 PRINT"   PRO/ANTI GOVERNMENT BIAS BUT THIS"6160 PRINT"   WILL CHANGE AS THE GAME PROGRESSES"6165 PRINT"   ACCORDING TO YOUR POPULARITY."6170 PRINT"   THE MORE POPULAR YOU ARE, THE BETTER"6175 PRINT"   THE CHANCE OF A BUILDING COMING OVER"6180 PRINT"   TO YOUR SIDE.6185 PRINTU7$;"2) TRY TO TAKE OVER A STREET SQUARE"6190 PRINTU8$;"   THIS WILL ALSO HELP YOU TO TAKE   "6191 PRINTU8$;"   OVER BUILDINGS AT A LATER DATE."6192 PRINTU8$;"   IT WILL ALSO HELP STOP GOVERNMENT"6194 PRINTU8$;"   FORCES FROM ADVANCING TOO FAR."6195 PRINT"             PRESS ANY KEY              ";6197 GOSUB80006200 PRINTU5$:PRINT"TAKING OVER A STREET SQUARE IS ONLY"6210 PRINT"POSSIBLE IF YOU ALREADY OCCUPY MORE"6220 PRINT"SURROUNDING SQUARES (UP TO "U8$"8 "U5$;"BUILDINGS"6230 PRINT"OR STREETS) THAN THE OPPOSING COLOUR."6240 PRINT"GREY NEUTRAL SQUARES DO NOT COUNT."6250 PRINT"THE MORE SQUARES YOU OCCUPY SURROUNDING"6255 PRINT"A BUILDING, THE MORE CHANCE YOU HAVE OF"6260 PRINT"OVERCOMING RESISTANCE IN A BUILDING."6270 PRINTU8$;"SOME BUILDINGS ARE PARTICULARLY "6275 PRINT"IMPORTANT SINCE THEY CAN ALTER THE "6280 PRINT"COURSE OF THE GAME IF YOU OCCUPY THEM."6290 PRINT"THESE INCLUDE: "U3$;"THE RADIO STATION (R)6292 PRINT"               THE NEWSPAPER OFFICE (N)6294 PRINT"               THE CATHEDRAL (C)6296 PRINT"               THE BANK (B)"6298 PRINT"               THE HOSPITAL (H)"6300 PRINT"               THE AIRPORT (A)"6305 PRINT"           AND XERXES' PALACE (X)"6310 PRINTU7$"THE RADIO STATION, NEWSPAPER OFFICE AND"6315 PRINT"CATHEDRAL ARE THE MOST IMPORTANT"6320 PRINT"BUILDINGS TO HOLD BUT YOU WILL PROBABLY"6325 PRINT"NEVER MANAGE TO CAPTURE XERXES' PALACE!"6330 PRINTU5$;"             PRESS ANY KEY              ";6335 GOSUB80006350 PRINT:PRINT"BEFORE EACH TURN, ONE OF THESE"6355 PRINT"BUILDINGS MAY RELEASE A NEWSFLASH"6360 PRINT"WHICH MAY BE DAMAGING IF IT IS"6365 PRINT"HELD BY ENEMY FORCES."6370 PRINT"TO HELP YOU FIND OUT IF A BUILDING"6375 PRINT"MAY BE RIPE FOR CAPTURE, YOU HAVE A"6380 PRINT"FREE OPTION TO EXAMINE INTELLIGENCE"6385 PRINT"REPORTS BY PRESSING 'F3'."6390 PRINTU7$"GOOD LUCK. THE POINTS FOR CAPTURING6395 PRINTU7$"OR SUCCESSFULLY RESISTING AN ATTACK"6400 PRINTU7$"ON A BUILDING ARE PRINTED ON THE "6410 PRINTU7$"FRONT OF THE BUILDING NEXT TO THE "6420 PRINTU7$"LETTER OF IDENTIFICATION."6422 PRINT"EACH TIME A BUILDING CHANGES HANDS, "6424 PRINT"THE POPULARITY CHART WILL BE AFFECTED."6425 PRINT"             PRESS ANY KEY              ";6427 GOSUB8000:PRINT6430 PRINTU8$"EACH GAME WILL BE A DIFFERENT SCENARIO."6432 PRINT"NOT ONLY WILL THE CITY MAP BE CHANGED,"6435 PRINT"YOU CAN CHOOSE WHETHER YOU WISH TO BE"6440 PRINT"LEFT OR RIGHT WING. REMEMBER THAT THE"6445 PRINT"ALLEGIANCES OF EACH BUILDING WILL"6450 PRINT"BE DIFFERENT. IT ALL DEPENDS ON YOUR"6455 PRINT"POLITICAL COLOUR AS WELL AS THE"6460 PRINT"GOVERNMENT'S POLITICS AND STRENGTH."6470 PRINT"WATCH OUT. THE GOVERNMENT WILL PLAY"6475 PRINT"A MEAN GAME! NOBODY LIKES TO LOSE."6495 PRINT"             PRESS ANY KEY              ";6497 GOSUB80006500 PRINT""6505 PRINTU5$;"SO FIRST OF ALL, DEFINE THE SCENARIO..."6510 PRINT"DO YOU WANT TO TRY TO OVERTHROW A..."6520 PRINTUU$;"1...COMMUNIST GOVERNMENT"6530 PRINT"2...SOCIALIST GOVERNMENT"6540 PRINT"3...LIBERAL   GOVERNMENT"6550 PRINT"4...RIGHTWING GOVERNMENT"6560 PRINT"5...FASCIST   GOVERNMENT"6570 PRINTUE$;"PRESS RELEVANT NUMBER NOW."6580 GOSUB80006585 IFA<1ORA>5THEN65806590 G1=A6600 PRINTU5$;"YOUR GROUP IS ATTEMPTING TO OVERTHROW"6610 PRINT"A "W$(G1)" GOVERNMENT....IS IT A..."6620 PRINTUU$;"1...COMMUNIST TAKEOVER BID"6630 PRINT"2...SOCIALIST TAKEOVER BID"6640 PRINT"3...LIBERAL   TAKEOVER BID"6650 PRINT"4...RIGHTWING TAKEOVER BID"6660 PRINT"5...FASCIST   TAKEOVER BID"6670 PRINTUE$;"PRESS RELEVANT NUMBER NOW."6680 GOSUB80006685 IFA<1ORA>5THEN66806686 IFA<>G1THEN66906687 PRINT"YOU CAN'T "U5$;"BOTH "UE$;"BE "W$(A)"!"6688 PRINT"THERE WOULDN'T BE ANY POINT IN HAVING"6689 PRINT"ANY SORT OF TAKEOVER.  TRY AGAIN.":GOTO66806690 P1=A6700 PRINTU5$;"SO, YOU REPRESENT A "W$(P1)" GROUP"6705 PRINT"ATTEMPTING TO OVERTHROW A "W$(G1)6710 PRINT"GOVERNMENT HEADED BY PRESIDENT XERXES."6715 PRINTUE$;"RIGHT? (PRESS 'Y' OR 'N')6720 GOSUB80006722 IFA$="N"THENPRINT"":GOTO65006724 IFA$="Y"THEN67306726 GOTO67206730 PRINTUE$"";:IFG1>P1GOTO67426735 PRINT"SINCE THE GOVERNMENT IS MORE TO"6736 UN$=U2$:UM$=U4$:UN=U2:UM=U46737 PRINT"THE LEFT THAN YOUR TAKE OVER BID,"6738 PRINT"THE GOVERNMENT FORCES WILL BE "U7$;"RED"6739 PRINTUE$;"    WHILE YOUR FORCES WILL BE "U9$;"BLUE."6740 GOTO67506742 PRINT"SINCE THE GOVERNMENT IS MORE TO"6744 PRINT"THE RIGHT THAN YOUR TAKE OVER BID,"6746 PRINT"THE GOVERNMENT FORCES WILL BE "U9$;"BLUE6748 PRINTUE$;"    WHILE YOUR FORCES WILL BE "U7$;"RED."6749 UN$=U4$:UM$=U2$:UN=U4:UM=U26750 PRINTUE$;6760 PRINT"DO YOU WANT AN EASY GAME OR A HARD ONE?"6765 PRINT"IS PRESIDENT XERXES' GOVERNMENT...."6770 PRINTU3$"1.....VERY WEAK AND ABOUT TO FALL."6772 PRINT"2.....WEAK AND UNPOPULAR."6774 PRINT"3.....REASONABLY SECURE."6776 PRINT"4.....STABLE AND STRONG."6777 PRINT"5.....VERY SECURE AND HIGHLY POPULAR."6778 PRINTUE$;"PRESS RELEVANT NUMBER NOW."6780 GOSUB80006785 IFA<1ORA>5THEN67806790 G2=(A-1)/2+1.5+ABS(3-G1)/26795 P2=2.5+ABS(3-P1)/2:PRINT""6900 RETURN7000 REM *****************************7002 REM COLOUR CODES FOR COMMODORE 64.7005 REM (ONLY USE THESE COLOURS)7010 U0=0:U0$="":REM BLACK7020 U1=1:U1$="":REM WHITE7030 U2=2:U2$="":REM DARK RED7040 U3=5:U3$="":REM GREEN7050 U4=6:U4$="":REM DARK BLUE7060 U5=8:U5$="":REM ORANGE7070 U6=9:U6$="":REM BROWN7080 U7=10:U7$="":REM PINK7090 U8=13:U8$="":REM LIGHT GREEN7100 U9=14:U9$="":REM LIGHT BLUE7110 UU=4:UU$="":REM PURPLE7120 UR=12:UR$="":REM LIGHT GREY7130 UE=7:UE$="":REM LIGHT YELLOW7140 UF=0:UF$="":REM BLACK7150 UQ=3:UQ$="":REM CYAN7200 REM SCREEN 'POKE' CODES FOR 64.7210 US=1024:REM SCREEN POKE CHARACTER7220 UC=55296:REM SCREEN POKE COLOUR7230 UG=53281:REM BACKGROUND COLOUR7240 UB=53280:REM SCREEN BORDER COLOUR7300 REM SOUND 'POKE' CODES FOR 64.7310 UV=54296:REM VOLUME FOR 3 VOICES7320 UA=54277:REM ATTACK FOR VOICE 17330 UD=54278:REM SUSTAIN FOR VOICE 17340 UH=54273:REM HIGH BYTE FOR VOICE 17350 UL=54272:REM LOW BYTE FOR VOICE 17360 UW=54276:REM WAVEFORM FOR VOICE 17390 PRINTCHR$(142)7400 RETURN7500 REM *****************************8000 GETA$:IFA$<>""THEN80008010 GETA$:IFA$=""THEN80108020 A=VAL(A$):RETURN8050 PRINTU6$;"        PRESS ANY KEY TO CONTINUE       "8055 POKEUV,15:POKEUA,154:POKEUD,128056 POKEUH,5:POKEUL,15:POKEUW,178060 GOSUB80008065 POKEUV,0:POKEUA,0:POKEUD,08066 POKEUH,0:POKEUL,0:POKEUW,08070 GOSUB8200:RETURN8100 REM DRAW MAP OF BUILDINGS8105 K9=1:FORY=1TO7:FORX=1TO118110 D$="":J=B5(Y,X):IFK9=1THEN81158112 POKEUV,12:POKEUA,11:POKEUD,08113 POKEUH,90-SGN(J)*60:POKEUL,20:POKEUW,178115 IFM5(Y,X)=0THEND$=UR$+D9$8116 IFM5(Y,X)>0THEND$=UN$+D9$8117 IFM5(Y,X)<0THEND$=UM$+D9$8118 IFJ=0THEND$=D$+D2$:GOTO81508120 D$=D$+D1$+LEFT$(B$(J),1)+MID$(STR$(S(J)),2,1)8150 PRINTLEFT$(Y$,Y*3+2);LEFT$(X$,(X-1)*3);D$;"";8155 IFK9=0THEN81708160 NEXTX:PRINTU3$;" ";RIGHT$(STR$(Y),1);" ";:NEXTY8170 POKEUV,0:POKEUA,0:POKEUD,08172 POKEUH,0:POKEUL,0:POKEUW,08175 PRINT"":IFK9=0THENRETURN8180 K9=08185 PRINTLEFT$(Y$,4);U3$;" A  B  C  D  E  F  G  H  I  J  K  "8190 RETURN8200 PRINT"                                        "8210 PRINT"                                        "8220 PRINT"                                        "8230 RETURN8300 PRINTU5$;LEFT$(Y$,7);LEFT$(X$,35);"POPULARITY"8310 A$="HIGHMEDIUMLOW"8320 PRINTU5$;LEFT$(Y$,10);LEFT$(X$,35);A$;""8350 REM DISPLAY POPULARITY BAR CHART8351 IFG2>5THENG2=58352 IFP2>5THENP2=58353 IFG2<1THENG2=18354 IFP2<1THENP2=18355 K=0:FORJ=1TO5STEP0.258360 IFG2>=JTHENPOKEUS+997-K,160:POKEUC+997-K,UN:GOTO83708362 IFG2<JTHENPOKEUS+997-K,32:POKEUC+997-K,UN8365 IFJ-G2<=.125THENPOKEUS+997-K,98:POKEUC+997-K,UN8370 IFP2>=JTHENPOKEUS+999-K,160:POKEUC+999-K,UM:GOTO83808372 IFP2<JTHENPOKEUS+999-K,32:POKEUC+999-K,UM8375 IFJ-P2<=.125THENPOKEUS+999-K,98:POKEUC+999-K,UM8380 K=K+40:NEXTJ8390 PRINTUR$;LEFT$(Y$,4);LEFT$(X$,34);"POINTS";8392 PRINTLEFT$(Y$,5);LEFT$(X$,35);"";8393 PRINTUN$;RIGHT$(STR$(G3),2);" ";UM$;RIGHT$(STR$(P3),2)8394 IFG3>=35ORP3>=35THEN120008395 IFG3<0THENG3=0:GOTO83908396 IFP3<0THENP3=0:GOTO83908399 RETURN9000 PRINTUM$;"MOVE NO."Q;9005 PRINTUF$;"TYPE LETTER/NO. FOR STREET"9010 PRINT"PRESS KEY 'F1' TO ACTIVATE A BUILDING"9020 PRINT"'F3':INTELLIGENCE REPORTS   'F5':NO MOVE"9030 RETURN12000 REM VICTORY12100 POKEUV,15:POKEUA,155:POKEUD,216:POKEUW,3312110 FORK=1TO100:POKEUB,U012120 POKEUH,K*2:POKEUH,0:POKEUB,U112130 NEXTK12135 POKEUV,0:POKEUA,0:POKEUD,0:POKEUW,012137 POKEUH,0:POKEUH,0:GOSUB820012140 IFG3>=35THEN1250012200 PRINTUM$;"WELL DONE. YOU HAVE REACHED 35 POINTS"12210 PRINT"AND THE GOVERNMENT HAS SURRENDERED"12220 GOSUB8050:RUN12500 PRINTUN$;"END OF GAME. THE GOVERNMENT HAS REACHED"12510 PRINT"35 POINTS AND YOU WILL NOW BE SHOT!"12520 GOSUB8050:RUN