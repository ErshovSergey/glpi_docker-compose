@echo off

set result=0

:: sync time
cmdtime3.exe time.windows.com sync > nul

:: settings w32time
sc query "w32time" | find /i "RUNNING" > nul
if (%errorlevel%)==(1) (
  echo Service w32time not running
  echo Starting w32time
  sc config w32time start=auto 
  net start w32time 
  w32tm /resync 
  set result=1
)

exit %result%
