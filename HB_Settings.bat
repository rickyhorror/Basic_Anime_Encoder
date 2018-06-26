@ECHO OFF

SET deblock=-2,-2
REM -2,-2 for BD, -1,-1 for WEB, 0,-1 for MPEG2

SET psyrd1=0.80
REM 0.80 for BD, 0.70 for WEB, 0.60 for MPEG2

SET psyrd2=0.00
REM 0.00 for Clean, 0.10 for Grain

SET qcomp=0.70
REM Value range 0.60 - 0.90

SET aqstrength=0.75
REM 0.60 for Grain, 0.75 for Normal, 0.90 for Static grain

ECHO Deblock is set to [92m%deblock%[0m
ECHO psy-rd is set to [92m%psyrd1%:%psyrd2%[0m
ECHO qcomp is set to [92m%qcomp%[0m
ECHO aq-strength is set to [92m%aqstrength%[0m
TIMEOUT 2 >NUL
ECHO|SET /P="ref=16:deblock=%deblock%:psy-rd=%psyrd1%,%psyrd2%:merange=32:trellis=2:no-dct-decimate:bframes=16:direct=auto:no-fast-pskip:no-dct-decimate:keyint=240:min-keyint=24:rc-lookahead=48:qcomp=%qcomp%:aq-mode=3:aq-strength=%aqstrength%:qpmax=81:me=umh:subme=10">"%cd%\settings.txt"
START notepad "%cd%\settings.txt" && TIMEOUT 1 >NUL
DEL "%cd%\settings.txt" && EXIT