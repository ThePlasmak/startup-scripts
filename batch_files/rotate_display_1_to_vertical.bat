@ECHO OFF
display64.exe /device 1 /rotate 90
display64.exe /device 2 /position -5000, 1000
nircmd.exe setprimarydisplay 2
ECHO.
EXIT