@echo off
cd /d "%~dp0"
copy /Y baserom.sfc out.sfc
%~dp0/asar/asar.exe %~dp0/src/main.asm out.sfc
%~dp0/flips/flips.exe -c -i baserom.sfc out.sfc mxf-item-rando-patches.ips
