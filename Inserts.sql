
Insert Into RONS.USP003 (U3USR, U3ROLE, U3STAT, U3CRUSR, U3CRDTE, U3CRTME, U3CHUSR, U3STMP) Select U3USR, U3ROLE, U3STAT, U3CRUSR, U3CRDTE, U3CRTME, U3CHUSR, U3STMP From BEAU.USP003 Where U3USR='RONS';


Insert Into camssamp.cnp140 (CN4SID, CN4CID, CN4STS, CN4TX1, CN4TX2, CN4TX3, CN4TX4, CN4TX5, CN4TX6, CN4TX7, CN4TX8, CN4TX9) Select CN4SID, CN4CID, 'A', CN4TX1, CN4TX2, CN4TX3, CN4TX4, CN4TX5, CN4TX6, CN4TX7, CN4TX8, CN4TX9 From rons.cnp140 ;

-- SQL to populate SIP010EXT
Insert Into CAMS.sip010ext (E1SGRP, E1SLS#, E1EVPID, E1SRVPID, E1DVPID, E1RLVPID, E1RLID, E1TMID, E1LSTUSR) 
 	Select S1GRP#, S1SLS#, 'KBIEDERMAN', 'JWASKIN', GRUSER, '', rl.SUUSER, tm.SUUSER, 'RONS' 
 
 	From CAMS.SIP010 
 	join cams.sip215 rl on s1RMGR=rl.suweb# 
 	join cams.sip215 tm on s1grp#=tm.susgrp and s1sls#=tm.susls#
 	join cams.gpp110 on s1grp#=grgp01 or s1grp#=grgp02 or s1grp#=grgp03 or s1grp#=grgp04 or s1grp#=grgp05 or s1grp#=grgp06 or s1grp#=grgp07 or s1grp#=grgp08 or s1grp#=grgp09 or s1grp#=grgp10 or
 		s1grp#=grgp11 or s1grp#=grgp12 or s1grp#=grgp13 or s1grp#=grgp14 or s1grp#=grgp15 or s1grp#=grgp16 or s1grp#=grgp17 or s1grp#=grgp18 or s1grp#=grgp19 or s1grp#=grgp20 or
 		s1grp#=grgp21 or s1grp#=grgp22 or s1grp#=grgp23 or s1grp#=grgp24 or s1grp#=grgp25 or s1grp#=grgp26 or s1grp#=grgp27 or s1grp#=grgp28 or s1grp#=grgp29 or s1grp#=grgp30
 
	Where s1terr='TER' and s1act = 'A' ;