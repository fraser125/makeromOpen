@ECHO OFF
ECHO.
ECHO makerom -b bootstrap
makerom -b bootstrap > testoutput.txt
ECHO T1: %ERRORLEVEL%
set helpsize=1421
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -B -1
makerom -B -1 > testoutput.txt
ECHO T2: %ERRORLEVEL%
set helpsize=1427
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -B 0
makerom -B 0 > testoutput.txt
ECHO T3: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -B 1
makerom -B 1 > testoutput.txt
ECHO T4: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -B 2
makerom -B 2 > testoutput.txt
ECHO T5: %ERRORLEVEL%
set helpsize=1426
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -D A=B
makerom -D A=B > testoutput.txt
ECHO T6: %ERRORLEVEL%
set helpsize=1407
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -f 0xA5
makerom -f 0xA5 > testoutput.txt
ECHO T7: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -F font
makerom -F font > testoutput.txt
ECHO T8: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -h header
makerom -h header > testoutput.txt
ECHO T9: %ERRORLEVEL%
set helpsize=1418
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -I c:\gcc\bin
makerom -I "c:\gcc\bin 32" > testoutput.txt
ECHO T10: %ERRORLEVEL%
set helpsize=1421
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -o gameo.n64
makerom -o gameo.n64 > testoutput.txt
ECHO T11: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -p pif
makerom -p pif > testoutput.txt
ECHO T12: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -r gamer.n64
makerom -r gamer.n64 > testoutput.txt
ECHO T13: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -s 1
makerom -s 1 > testoutput.txt
ECHO T14: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -s 300
makerom -s 300 > testoutput.txt
ECHO T15: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -s -1
makerom -s -1 > testoutput.txt
ECHO T16: %ERRORLEVEL%
set helpsize=1427
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -t -1
makerom -t -1 > testoutput.txt
ECHO T17: %ERRORLEVEL%
set helpsize=1427
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -t 0
makerom -t 0 > testoutput.txt
ECHO T18: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -t 1
makerom -t 1 > testoutput.txt
ECHO T19: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -t 2
makerom -t 2 > testoutput.txt
ECHO T20: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -t 3
makerom -t 3 > testoutput.txt
ECHO T21: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -t 4
makerom -t 4 > testoutput.txt
ECHO T22: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -t 5
makerom -t 5 > testoutput.txt
ECHO T23: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -t 6
makerom -t 6 > testoutput.txt
ECHO T24: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -t 7
makerom -t 7 > testoutput.txt
ECHO T25: %ERRORLEVEL%
set helpsize=1426
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom
makerom -U name > testoutput.txt
ECHO T26: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom spec
makerom spec > testoutput.txt
ECHO T27: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)