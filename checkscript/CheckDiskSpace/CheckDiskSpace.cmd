@echo off
set PorogProcent=15

for /f "usebackq delims== tokens=2" %%x in (`wmic logicaldisk where "DeviceID='C:'" get FreeSpace /format:value`) do set FreeSpace=%%x
for /f "usebackq delims== tokens=2" %%x in (`wmic logicaldisk where "DeviceID='C:'" get Size /format:value`) do set Size=%%x
set FreeMB=%FreeSpace:~0,-6%
set SizeMB=%Size:~0,-6%
set /a Percentage=100 * FreeMB / SizeMB
echo C: is %Percentage% % free

if %Percentage% LEQ %PorogProcent% (
  set result=1
) else (
  set result=0
)

::echo %result%
exit %result%
