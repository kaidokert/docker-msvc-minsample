REM With msbuild
cd \sample
\buildtools\msbuild\current\bin\msbuild myproject.vcxproj ^
    /p:configuration=release /p:platform=x64 /p:PlatformToolset=v142
\sample\x64\release\myproject.exe

REM With cmake
mkdir \build
cd \build
cmake ..\sample -DCMAKE_VERBOSE_MAKEFILE=On
cmake --build .
\build\Debug\myproject.exe