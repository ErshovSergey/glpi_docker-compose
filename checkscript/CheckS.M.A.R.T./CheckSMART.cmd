@echo off

set result=0
for /l %%a in (0,1,20) do (
  smartctl -H /dev/pd%%a | find /i "health" | findstr /i /c:": FAILED!" > nul  && (echo !!!! Physical Drive %%a failed test !!!! & set result=1 & smartctl -H /dev/pd%%a --quietmode=errorsonly & echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!) 
)

exit %result%
