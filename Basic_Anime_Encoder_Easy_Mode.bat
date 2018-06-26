@echo off
Title Basic Anime Encoder Easy Mode

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

REM SET chroma=--input-csp i444 --output-csp i444 --chroma-qp-offset -3
REM Turned off by default
REM Activates 444 chroma encoding
REM To activate remove the REM in front of SET

SET fps=24000/1001
REM Sets the frame rate for the video
REM 24000/1001 means 23.976 fps
REM I would suggest keeping it as is, but changing it is up to you

SET crf=16
REM If you don't know what to do here, go no further and delete this bat file

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

REM SET cropNresize=--video-filter crop:0,0,0,0/resize:width=1280,height=720,sar=1:1,method=bicubic
REM Turned off by default
REM Used to crop AND resize
REM See above for details
REM SAR was added if you plan to do both
REM Sets the SAR and resizes frames to a new resolution to avoid stretching
REM SAR is storage aspect ratio, which is the ratio of pixel dimensions
REM To activate remove the REM in front of SET
REM DO NOT ACTIVATE resize AND crop SEPARATELY! USE cropNresize INSTEAD! ONE OF THE THREE SHOULD BE USED! NOT MORE THAN ONE

FOR %%A in (*.mkv) DO "%bpath%\%binary%" "%%A" --demuxer %demuxer% -o "%odestination%\%%~nA.mkv" - %bitdepth% %chroma% --force-cfr --fps %fps% --tune animation --preset veryslow --keyint 240 --min-keyint 24 --crf %crf% %crop% %resize% %cropNresize%