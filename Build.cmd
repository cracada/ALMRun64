@echo off
title ALMRun 自动编译脚本 by chenall http://almrun.chenall.net
setlocal
REM 
REM 如果你的wxWidgets库没有安装在以下位置请删除下一行的REM注释，并修改为正确的位置，否则无法编译
REM set WXWIN=C:\wxWidgets-3.1.4
REM
REM 设置使用静态库编译,这样编译产生的文件将不依赖DLL文件.(目前只有LUA库)
REM 等同于在执行Build.cmd时加上参数static
REM set STATIC=1
REM
REM PARAMS 需要附加的参数
set PARAMS=

if /i "%1"=="STATIC" set STATIC=1
pushd %~dp0
if not exist build md build
cd build
SET VSTOOLS=
FOR /f "usebackq tokens=1* delims==" %%I IN (`SET VS1`) DO SET VSTOOLS=%%J
for %%i in (cmake.exe) do set CMAKE=%%~$PATH:i
if not defined CMAKE goto :ERR_CMAKE
if not DEFINED VSTOOLS goto :END
if defined STATIC set PARAMS=%PARAMS% -DSTATIC=1
%CMAKE% .. -DRTL=MT %PARAMS% || goto :END
if not exist ALMRun.sln goto :END
"%VSTOOLS%\..\IDE\devenv.com" ALMRun.sln /build Release
if errorlevel 1 goto :END
copy /y Release\ALMRun.exe ..\bin\ > nul
popd
if not exist bin\doc md bin\doc
copy /y doc\*.* bin\doc\ >nul
copy /y README.md bin\doc\ > nul
copy /y README.md bin\ > nul
echo.
echo.
echo 编译成功完成，生成的文件在BIN目录下。
echo.
goto :END
:ERR_CMAKE
echo.
echo 系统未安装CMAKE，无启启动编译。
echo.
goto :END
:NEED_VS100
echo.
echo 系统未安装VS2010或以上版本，无启启动编译。
echo.
:END
pause
