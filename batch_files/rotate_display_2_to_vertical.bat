@ECHO OFF
display64.exe /device 2 /rotate 90 /position 0, -1000
display64.exe /device 1 /position 0, 0
nircmd.exe setprimarydisplay 2
ECHO.
EXIT
