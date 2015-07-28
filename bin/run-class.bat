@echo off

rem Using pushd popd to set BASE_DIR to the absolute path

pushd %~dp0..
set BASE_DIR=%CD%
popd

echo %BASE_DIR%

set CLASSPATH=

rem Classpath addition for release
for %%i in (%BASE_DIR%\*.jar) do (
	call :concat %%i
)

for %%i in (%BASE_DIR%\lib\*.jar) do (
	call :concat %%i
)

rem Which java to use
IF ["%JAVA_HOME%"] EQU [""] (
	set JAVA=java
) ELSE (
	set JAVA="%JAVA_HOME%/bin/java"
)

echo %CLASSPATH%

echo -------------------------

IF ["%CLASSPATH%"] EQU [""] (
	echo Classpath is empty. error.
	EXIT /B 2
)

set CFGDIR=%BASE_DIR%\conf
echo %CFGDIR%

java -cp "%CLASSPATH%" me.hynd.cmd.Cmd %CFGDIR% %*

rem pause

goto :eof
:concat
IF ["%CLASSPATH%"] EQU [""] (
  set CLASSPATH="%1"
) ELSE (
  set CLASSPATH=%CLASSPATH%;"%1"
)

