# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2019-amd64

WORKDIR /install

SHELL ["powershell"]

ARG CHANNEL_URL=https://aka.ms/vs/16/release
ADD ${CHANNEL_URL}/channel VisualStudio.chman
ADD ${CHANNEL_URL}/vs_buildtools.exe vs_buildtools.exe

RUN Start-Process .\vs_buildtools.exe -NoNewWindow -Wait `
    -ArgumentList '--quiet --wait --norestart --nocache `
    --installPath C:\BuildTools `
    --channelUri C:\install\VisualStudio.chman `
    --installChannelUri C:\install\VisualStudio.chman `
    --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 `
    --add Microsoft.VisualStudio.Component.Windows10SDK.18362'; `
    Remove-Item -Force -Recurse \"${Env:TEMP}\"; `
    Remove-Item -Force -Recurse \"${Env:ProgramData}\Package Cache\"; `
    Remove-Item -Force -Recurse \"${Env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\"

ADD https://chocolatey.org/install.ps1 install.ps1
RUN .\install.ps1; `
    choco install -f -y sysinternals --params "/InstallDir:c:\si"; `
    choco install -f -y cmake --installargs 'ADD_CMAKE_TO_PATH=System'

ADD sample /sample
ADD compile.cmd /compile.cmd

CMD ["cmd.exe","/c","\\compile.cmd"]
