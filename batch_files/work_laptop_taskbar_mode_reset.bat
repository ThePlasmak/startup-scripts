@ECHO OFF
nircmd.exe setprimarydisplay 2
display64.exe /device 2 /position 0, -270
nircmd.exe setprimarydisplay 2
ECHO.
EXIT