@ECHO OFF
display64.exe /device 2 /rotate 0 /position -1000, 1000
nircmd.exe setprimarydisplay 2
ECHO.
EXIT