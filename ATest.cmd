@ECHO OFF
set helpsize=1374
ECHO.
ECHO makerom
makerom > testoutput.txt
ECHO T1: %ERRORLEVEL%
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -?
makerom -? > testoutput.txt
ECHO T2: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -b
makerom -b > testoutput.txt
ECHO T3: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -B
makerom -B > testoutput.txt
ECHO T4: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -d
makerom -d > testoutput.txt
ECHO T5: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -D
makerom -D > testoutput.txt
ECHO T6: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -DD64
makerom -DD64 > testoutput.txt
ECHO T7: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -E
makerom -E > testoutput.txt
ECHO T8: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -f
makerom -f > testoutput.txt
ECHO T9: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -F
makerom -F > testoutput.txt
ECHO T10: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -h
makerom -h > testoutput.txt
ECHO T11: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -I
makerom -I > testoutput.txt
ECHO T12: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -L
makerom -L > testoutput.txt
ECHO T13: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -m
makerom -m > testoutput.txt
ECHO T14: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -o
makerom -o > testoutput.txt
ECHO T15: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -p
makerom -p > testoutput.txt
ECHO T16: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -r
makerom -r > testoutput.txt
ECHO T17: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -s
makerom -s > testoutput.txt
ECHO T18: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -U
makerom -U > testoutput.txt
ECHO T19: %ERRORLEVEL%
set helpsize=1428
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -w
makerom -w > testoutput.txt
ECHO T20: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)
ECHO.
ECHO makerom -JAMES
makerom -JAMES > testoutput.txt
ECHO T21: %ERRORLEVEL%
set helpsize=1395
FOR /F "usebackq" %%A IN ('testoutput.txt') DO set size=%%~zA
if %size% EQU %helpsize% (
	ECHO PASS
) ELSE (
	ECHO FAIL : Actual Size %size%
)