@ECHO OFF
ECHO A > romheader
ECHO B > font
ECHO C > Boot
ECHO D > pif2Boot
ECHO Basic Files are created

ECHO.
ECHO makerom -d specx
makerom -d specx > testoutput.txt
ECHO T1: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
pause
ECHO makerom -d specy
makerom -d specy > testoutput.txt
ECHO T2: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -d specz
makerom -d specz > testoutput.txt
ECHO T3: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -d -r blocks.n64 -e blocks.out specy
makerom -d -r blocks.n64 -e blocks.out specy > testoutput.txt
ECHO T4: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -d -r blocks.n64 -e blocks.out specy
makerom -d -r blocks.n64 -e blocks.out specy > testoutput.txt
ECHO T5: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -d -r blocks.n64 -e blocks.out specy
makerom -d -r blocks.n64 -e blocks.out specy > testoutput.txt
ECHO T6: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -d -r blocks.n64 -e blocks.out specy
makerom -d -r blocks.n64 -e blocks.out specy > testoutput.txt
ECHO T7: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -d -r blocks.n64 -e blocks.out specy
makerom -d -r blocks.n64 -e blocks.out specy > testoutput.txt
ECHO T8: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
