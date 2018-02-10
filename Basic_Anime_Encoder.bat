@echo off
Title Basic Anime Encoder

REM Read all REM line!

REM This is to be use to encode Anime ONLY
REM If you want to encode anything else, use something else to enocde it

REM Read the descriptions for each settings
REM Edit the modifiable settings to your liking and to match what you're encoding
REM Once you're done, put the BAT file in the same folder as the video/videos you are encoding with those setting
REM Videos must be in MKV format
REM Then run the BAT and it will encode ALL MKV videos in said folder

REM For all the settings (lines starting with SET) below, ONLY edit what is AFTER the =

SET bpath=D:\Encode-Pack\Scripts
REM Path to where the binary you are using is located
REM Make sure there is not a \ at the end of the path

SET binary=x264-r2901-7d0ff22.exe
REM Binary used
REM Get the latest binary from a link below if you do not have one
REM 64bit Windows: https://download.videolan.org/x264/binaries/win64/
REM 32bit Windows: https://download.videolan.org/x264/binaries/win32/
REM Binaries with '10b' in the name can only do 10 bit
REM Newest one without '10b' in the name can do both 8 and 10 bit
REM Just get the newest one

SET demuxer=lavf
REM Demuxer used
REM Leave it as lavf
REM If lavf fails, use y4m or auto

SET odestination=C:\Users\ricky\Desktop
REM Output file destination
REM Make sure there is not a \ at the end of the path

SET bitdepth=--colormatrix bt709 --input-depth 10 --output-depth 10
REM Turned on by default
REM Activates 10 bit encoding
REM To turn off, add REM in front of SET

REM SET chroma=--input-csp i444 --output-csp i444 --chroma-qp-offset -4
REM Turned off by default
REM Activates 444 chroma encoding
REM To activate remove the REM in front of SET

SET fps=24000/1001
REM Sets the frame rate for the video
REM 24000/1001 means 23.976 fps
REM I would suggest keeping it as is, but changing it is up to you

SET deblock=-1:-1
REM -2:-2 for BD, -1:-1 for WEB, 0:-1 for MPEG2

SET psyrd1=0.70
REM 0.80 for BD, 0.70 for WEB, 0.60 for MPEG2

SET psyrd2=0.00
REM 0.00 for Clean, 0.10 for Grain

SET crf=16
REM If you don't know what to do here, go no further and delete this bat file

SET qcomp=0.70
REM Value range 0.60 - 0.90

SET aqstrength=0.85
REM 0.60 for Grain, 0.75 for Normal, 0.90 for Static grain

REM SET crop=--video-filter crop:0,0,0,0
REM Turned off by default
REM Used to crop pixels off the video
REM crop:left,top,right,bottom
REM You must crop in multiples of 2
REM To activate remove the REM in front of SET
REM DO NOT ACTIVATE resize SEPARATELY! USE cropNresize INSTEAD! ONE OF THE THREE SHOULD BE USED! NOT MORE THAN ONE

REM SET resize=--video-filter resize:width=1280,height=720,method=bicubic
REM Turned off by default
REM For video resizing. width and height are common sense.
REM methods; fastbilinear, bilinear, bicubic, experimental, point, area, bicublin, gauss, sinc, lanczos, spline
REM Make sure to use the proper method!
REM To activate remove the REM in front of SET
REM DO NOT ACTIVATE crop SEPARATELY! USE cropNresize INSTEAD! ONE OF THE THREE SHOULD BE USED! NOT MORE THAN ONE

REM SET cropNresize=--video-filter crop:0,0,0,0/resize:width=1280,height=720,method=bicubic
REM Turned off by default
REM Used to crop AND resize
REM See above for details
REM To activate remove the REM in front of SET
REM DO NOT ACTIVATE resize AND crop SEPARATELY! USE cropNresize INSTEAD! ONE OF THE THREE SHOULD BE USED! NOT MORE THAN ONE

ECHO Binary Path: [92m%bpath%[0m
ECHO Binary: [92m%binary%[0m
ECHO Demuxer used: [92m%demuxer%[0m
ECHO Output destination: [92m%odestination%[0m
IF DEFINED bitdepth (ECHO 10 bit encoding [92menabled[0m) ELSE (ECHO 10 bit encoding [91mdisabled[0m)
IF DEFINED chroma (ECHO chroma encoding [92menabled[0m) ELSE (ECHO chroma encoding [91mdisabled[0m)
ECHO FPS is set to [92m%fps%[0m
ECHO Deblock is set to [92m%deblock%[0m
ECHO psy-rd is set to [92m%psyrd1%:%psyrd2%[0m
ECHO CRF is set to [92m%crf%[0m
ECHO qcompis set to [92m%qcomp%[0m
ECHO aq-strength is set to [92m%aqstrength%[0m
ECHO.
ECHO [1m!!! If more than one of the three options below are enabled, you fucked up and need to abort! !!![0m
IF DEFINED crop (ECHO Video cropping is [92menabled[0m) ELSE (ECHO Video cropping is [91mdisabled[0m)
IF DEFINED resize (ECHO Video resizing is [92menabled[0m) ELSE (ECHO Video resizing is [91mdisabled[0m)
IF DEFINED cropNresize (ECHO Video cropping and resizing is [92menabled[0m) ELSE (ECHO Video cropping and resizing is [91mdisabled[0m)
ECHO.

pause

FOR %%A in (*.mkv) DO "%bpath%\%binary%" "%%A" --demuxer %demuxer% -o "%odestination%\%%~nA.mkv" - %bitdepth% %chroma% --force-cfr --fps %fps% --ref 16 --deblock %deblock% --me umh --subme 10 --psy-rd %psyrd1%:%psyrd2% --merange 32 --trellis 2 --no-dct-decimate --bframes 16 --b-adapt 2 --direct auto --slow-firstpass --no-fast-pskip --keyint 240 --min-keyint 24 --rc-lookahead 48 --crf %crf% --qcomp %qcomp% --aq-mode 3 --aq-strength %aqstrength% --qpmax 81 %crop% %resize% %cropNresize%