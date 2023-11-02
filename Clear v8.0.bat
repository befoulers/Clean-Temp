@shift /0
@echo off
chcp 65001
cls

REM  --> Verifique as permissões.
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> Se o sinalizador de erro estiver definido, não temos admin.
if '%errorlevel%' NEQ '0' (
    echo.[39m %date%. %time%.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo               [31m[/] WARNING, %username%. É necessário executar como administrador!
	timeout 10 >nul
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
title Cleaner v8.0 (By DouG) - github.com/DGS1337
cls
echo.
echo.
echo               [61mBASE LOADING...
timeout 1 >nul
echo.
echo.
echo               [61m[/] Bem vindo, %username%.
echo               [61m[/] %date%. %time%.
echo.
timeout 1 >nul
echo               [61m[/]  Iniciando...
timeout 1 >nul
echo.
cls
goto MENU
:MENU
cls
echo.
echo.
echo               [90m██████╗  █████╗ ██╗   ██╗ ██████╗          [92m  ███╗  ██████╗ ██████╗ ███████╗[0m 
echo               [90m██╔══██╗██╔══██╗██║   ██║██╔════╝          [92m ████║  ╚════██╗╚════██╗╚════██║[0m
echo               [90m██║  ██║██║  ██║██║   ██║██║  ██╗          [92m██╔██║   █████╔╝ █████╔╝    ██╔╝[0m
echo               [90m██║  ██║██║  ██║██║   ██║██║  ╚██╗         [92m╚═╝██║   ╚═══██╗ ╚═══██╗   ██╔╝ [0m
echo               [90m██████╔╝╚█████╔╝╚██████╔╝╚██████╔╝         [92m███████╗██████╔╝██████╔╝  ██╔╝  [0m
echo               [90m╚═════╝  ╚════╝  ╚═════╝  ╚═════╝          [92m╚══════╝╚═════╝ ╚═════╝   ╚═╝   [0m
echo.
echo.
echo.
echo.
echo.
echo                                    [32m1[0m - [32mCLEAN CACHE[0m                 [32m2[0m - [32mSHUTDOWN[0m
echo.
echo.
echo                                    [32m3[0m - [32mREGEDIT[0m                     [32m4[0m - [32mSYSTEM INFO[0m
echo.
echo.
echo                                    [32m5[0m - [32mHIGH PRIORITY[0m
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==1 goto CLEAN
if %key%==2 goto SHUTDOWNPC
if %key%==3 goto REGEDIT
if %key%==4 goto SYSTEM
if %key%==5 goto HIGH
if %key%==6 goto OPCAO_INVALIDO
if %key%==7 goto OPCAO_INVALIDO
if %key%==8 goto OPCAO_INVALIDO
if %key%==9 goto OPCAO_INVALIDO
if %key%==10 goto OPCAO_INVALIDO


:CLEAN
cls
echo.
echo               [32m █████╗ ██╗     ███████╗ █████╗ ██████╗ [0m    [90m █████╗  █████╗  █████╗ ██╗  ██╗███████╗[0m 
echo               [32m██╔══██╗██║     ██╔════╝██╔══██╗██╔══██╗[0m    [90m██╔══██╗██╔══██╗██╔══██╗██║  ██║██╔════╝[0m
echo               [32m██║  ╚═╝██║     █████╗  ███████║██████╔╝[0m    [90m██║  ╚═╝███████║██║  ╚═╝███████║█████╗  [0m
echo               [32m██║  ██╗██║     ██╔══╝  ██╔══██║██╔══██╗[0m    [90m██║  ██╗██╔══██║██║  ██╗██╔══██║██╔══╝  [0m
echo               [32m╚█████╔╝███████╗███████╗██║  ██║██║  ██║[0m    [90m╚█████╔╝██║  ██║╚█████╔╝██║  ██║███████╗[0m
echo               [32m ╚════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝[0m    [90m ╚════╝ ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝╚══════╝[0m
echo.                   
echo.
echo.
echo.
echo.
echo                                                     [90m10[0m - [38mCLEAN TEMP.[0m 
echo                                                     [90m11[0m - [38mCLEAN DISCORD.[0m 
echo                                                     [90m12[0m - [38mCLEAN REDE.[0m 
echo.
echo                                                     [90m0[0m  -  [38mVOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==10 goto TEMP
if %key%==11 goto CLEANDISCORD
if %key%==12 goto REDE
if %key%==0 goto MENU


:TEMP
cls

cls
del /s /f /q "%windir%\temp"\*.*
rd /s /q "%windir%\temp"
md "%windir%\temp"
del /s /f /q "%windir%\Prefetch"\*.*
rd /s /q "%windir%\Prefetch"
md "%"windir%\Prefetch"
del /s /f /q "%windir%\system32\dllcache"\*.*
rd /s /q "%windir%\system32\dllcache"
md "%windir%\system32\dllcache"
del /s /f /q "%temp%"\*.*
rd /s /q "%temp%"
md "%temp%"
del /s /f /q "%USERPROFILE%\Local Settings\History"\*.*
rd /s /q "%USERPROFILE%\Local Settings\History"
md "%USERPROFILE%\Local Settings\History"
del /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.*
rd /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files"
md "%USERPROFILE%\Local Settings\Temporary Internet Files"
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*
rd /s /q "%USERPROFILE%\Local Settings\Temp"
md "%USERPROFILE%\Local Settings\Temp"
del /s /f /q "%USERPROFILE%\Recent"\*.*
rd /s /q "%USERPROFILE%\Recent"
md "%USERPROFILE%\Recent"
del /s /f /q "%USERPROFILE%\Cookies"\*.*
rd /s /q "%USERPROFILE%\Cookies"
md "%USERPROFILE%\Cookies"
del /s /f /q "%windir%\SoftwareDistribution\Download"\*.*
rd /s /q "%windir%\SoftwareDistribution\Download"
md "%windir%\SoftwareDistribution\Download"


taskkill /F /IM "ccleaner64.exe"
taskkill /F /IM "ccleaner.exe"
REM ***************** BABO CLEAN Navegadores ******************
REM ******************** WINDOWS ********************

REM Apaga todas as pastas temporárias e arquivos temporários do usuário
takeown /A /R /D Y /F C:\Users\%USERNAME%\AppData\Local\Temp\
icacls C:\Users\%USERNAME%\AppData\Local\Temp\ /grant administradores:F /T /C
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Temp\
md C:\Users\%USERNAME%\AppData\Local\Temp\
del /s /f /q  c:\windows\Downloaded Program Files\*.*
del /s /f /q  c:\windows\Installer\*.*

REM Apaga os arquivos de \Windows\Temp
takeown /A /R /D Y /F C:\windows\temp
icacls C:\windows\temp /grant administradores:F /T /C
rmdir /q /s c:\windows\temp
md c:\windows\temp

REM Apaga arquivos de log
del c:\windows\logs\cbs\*.log
del C:\Windows\Logs\MoSetup\*.log
del C:\Windows\Panther\*.log /s /q
del C:\Windows\inf\*.log /s /q
del C:\Windows\logs\*.log /s /q
del C:\Windows\SoftwareDistribution\*.log /s /q
del C:\Windows\Microsoft.NET\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\WebCache\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\SettingSync\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\"Terminal Server Client"\Cache\*.bin /s /q
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\

REM ******************** EDGE ********************
taskkill /F /IM "msedge.exe"
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\GrShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\ShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Storage\ext\

del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Storage\ext\

del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Storage\ext\

REM ******************** FIREFOX ********************
taskkill /F /IM "firefox.exe"
REM define qual é a pasta Profile do usuário e apaga os arquivos temporários dali
set parentfolder=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles\
for /f "tokens=*" %%a in ('"dir /b "%parentfolder%"|findstr ".*\.default-release""') do set folder=%%a
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\entries\*.
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.bin
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.lz*
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\index*.*
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.little
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\*.log /s /q

REM ******************** CHROME ********************
taskkill /F /IM "chrome.exe"
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\GrShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\ShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Storage\ext\

del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Cache\f*.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Storage\ext\

del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Cache\f*.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Storage\ext\

REM ******************** BRAVE ********************
taskkill /F /IM "brave.exe"
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\Cache_Data\data*.
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\"User Data"\Default\Cache\Cache_Data\f*.
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\"User Data"\Default\Cache\Cache_Data\index.
rmdir /q /s C:\Users\DouG\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\GrShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\ShaderCache\GPUCache\
echo.
cls
echo.
echo.
echo.
echo                                                     [32m [-] PROCURANDO POR ARQUIVOS *.tmp...
echo.
echo.
echo.
del /f /s /q %systemdrive%\*.tmp
echo.
echo                                                     [32m [-] PROCURANDO POR ARQUIVOS *.temp...
echo.
del /f /s /q %systemdrive%\*.temp
echo.
echo                                                     [32m [-] PROCURANDO POR ARQUIVOS *.old...
echo.
del /f /s /q %systemdrive%\*.old
echo.
echo                                                     [32m [-] PROCURANDO POR ARQUIVOS *.log...
echo.
del /f /s /q %systemdrive%\*.log
echo.
echo.
cls
echo.
echo.
echo.
echo                                                     [32m [-] CACHE LIMPO COM SUCESSO.
timeout 3 >nul
goto CLEAN


:CLEANDISCORD
REM CLOSE DISCORD E CANARY
taskkill /F /IM "discord.exe"
taskkill /F /IM "discordcanary.exe"
taskkill /F /IM "discordptb.exe"
REM APAGAR CACHE DISCORD
takeown /A /R /D Y /F "C:\Users\%USERNAME%\AppData\Roaming\discord\"
icacls "C:\Users\%USERNAME%\AppData\Roaming\discord\Cache" /grant administradores:F /T /C
rmdir /q /s "C:\Users\%USERNAME%\AppData\Roaming\discord\Cache"
md "C:\Users\%USERNAME%\AppData\Roaming\discord\Cache"
icacls "C:\Users\%USERNAME%\AppData\Roaming\discord\GPUCache" /grant administradores:F /T /C
rmdir /q /s "C:\Users\%USERNAME%\AppData\Roaming\discord\GPUCache"
md "C:\Users\%USERNAME%\AppData\Roaming\discord\GPUCache"
REM APAGAR CACHE CANARY
takeown /A /R /D Y /F "C:\Users\%USERNAME%\AppData\Roaming\discordcanary\"
icacls "C:\Users\%USERNAME%\AppData\Roaming\discordcanary\Code Cache" /grant administradores:F /T /C
rmdir /q /s "C:\Users\%USERNAME%\AppData\Roaming\discordcanary\Code Cache"
md "C:\Users\%USERNAME%\AppData\Roaming\discordcanary\Code Cache"
REM APAGAR CACHE POWERCORD
takeown /A /R /D Y /F "C:\Users\%USERNAME%\powercord\.cache"
icacls "C:\Users\%USERNAME%\powercord\.cache" /grant administradores:F /T /C
rmdir /q /s "C:\Users\%USERNAME%\powercord\.cache"
md "C:\Users\%USERNAME%\powercord\.cache"
REM APAGAR CACHE PTB
takeown /A /R /D Y /F "C:\Users\%USERNAME%\AppData\Roaming\discordptb\"
icacls "C:\Users\%USERNAME%\AppData\Roaming\discordptb\Code Cache" /grant administradores:F /T /C
rmdir /q /s "C:\Users\%USERNAME%\AppData\Roaming\discordptb\Code Cache"
md "C:\Users\%USERNAME%\AppData\Roaming\discordptb\Code Cache"
REM Abrir Canary/Discord
C:\Users\%USERNAME%\AppData\Local\DiscordCanary\Update.exe --processStart DiscordCanary.exe
C:\Users\%USERNAME%\AppData\Local\Discord\Update.exe --processStart Discord.exe
C:\Users\%USERNAME%\AppData\Local\DiscordPTB\Update.exe --processStart DiscordPTB.exe
timeout 1 >nul
cls
echo.
echo.
echo                                                     [32m [-] CACHE LIMPO COM SUCESSO.
timeout 3 >nul
goto CLEAN


:REDE
cls
sfc /purgecache
sfc /cachesize=50
ipconfig /release
ipconfig /flushdns
netsh winsock reset all
netsh int 6to4 reset all
netsh int ipv4 reset all
netsh int ipv6 reset all
netsh int httpstunnel reset all
netsh int isatap reset all
netsh int portproxy reset all
netsh int tcp reset all
netsh int teredo reset all
NET STOP DNSCACHE
NET STOP DHCP
NET START DNSCACHE
NET START DHCP
            arp -d *
            net stop dps
            del /f/s/q/a "%windir%\System32\sru\*"
            net start dps
ipconfig /registerdns
ipconfig /renew
arp -a -d
netsh interface ip delete arpcache
netsh interface ip delete destinationcache
nbtstat -R
nbtstat -RR
netsh int ip reset
netsh winsock reset catalog
timeout 1 >nul
cls
echo.
echo.
echo                                                     [32m [-] CACHE REDE LIMPO COM SUCESSO.
timeout 3 >nul
goto CLEAN





:SHUTDOWNPC
cls
echo.
echo               [32m ██████╗██╗  ██╗██╗   ██╗████████╗██████╗  █████╗  ██╗       ██╗███╗  ██╗
echo               [32m██╔════╝██║  ██║██║   ██║╚══██╔══╝██╔══██╗██╔══██╗ ██║  ██╗  ██║████╗ ██║
echo               [32m╚█████╗ ███████║██║   ██║   ██║   ██║  ██║██║  ██║ ╚██╗████╗██╔╝██╔██╗██║
echo               [32m ╚═══██╗██╔══██║██║   ██║   ██║   ██║  ██║██║  ██║  ████╔═████║ ██║╚████║
echo               [32m██████╔╝██║  ██║╚██████╔╝   ██║   ██████╔╝╚█████╔╝  ╚██╔╝ ╚██╔╝ ██║ ╚███║
echo               [32m╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═════╝  ╚════╝    ╚═╝   ╚═╝  ╚═╝  ╚══╝
echo.                   
echo.
echo.
echo.
echo.
echo                                                     [90m21[0m - [38mSHUTDOWN PC 1h.[0m
echo                                                     [90m22[0m - [38mSHUTDOWN PC 2h.[0m
echo                                                     [90m23[0m - [38mCANCELAR SHUTDOWN.[0m
echo.
echo                                                     [90m0[0m - [38mVOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==21 goto 1H
if %key%==22 goto 2H
if %key%==23 goto CANCELARSHUTDOWN
if %key%==0 goto MENU

:1H
cls
shutdown -a
shutdown -s -t 3600
timeout 1 >nul
cls
echo.
echo.
echo                                                     [32m [-] DESLIGAMENTO EM 1H.
timeout 2 >nul
goto MENU


:2H
shutdown -a
shutdown -s -t 7200
timeout 1 >nul
cls
echo.
echo.
echo                                                     [32m [-] DESLIGAMENTO EM 2H.
timeout 2 >nul
goto MENU


:CANCELARSHUTDOWN
shutdown -a
timeout 1 >nul
cls
echo.
echo.
echo                                                     [32m [-] SHUTDOWN CANCELADO!
timeout 2 >nul
goto MENU






:REGEDIT
cls
echo.
echo               [32m██████╗ ███████╗ ██████╗ ███████╗██████╗ ██╗████████╗[0m     
echo               [32m██╔══██╗██╔════╝██╔════╝ ██╔════╝██╔══██╗██║╚══██╔══╝[0m     
echo               [32m██████╔╝█████╗  ██║  ██╗ █████╗  ██║  ██║██║   ██║   [0m     
echo               [32m██╔══██╗██╔══╝  ██║  ╚██╗██╔══╝  ██║  ██║██║   ██║   [0m
echo               [32m██║  ██║███████╗╚██████╔╝███████╗██████╔╝██║   ██║   [0m     
echo               [32m╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚══════╝╚═════╝ ╚═╝   ╚═╝   [0m     
echo.                   
echo.
echo.
echo.
echo.
echo                                                     [39m30[0m - [38m DESATIVAR CENTRAL DE AÇÕES[0m
echo                                                     [39m31[0m - [38m GPU PRIORIDADE[0m
echo                                                     [39m32[0m - [38m TECLADO SEM DELAY[0m
echo                                                     [39m33[0m - [38m REMOVER TELEMATRIA E COLETA DE DADOS[0m
echo                                                     [39m34[0m - [38m RESTAURAR TUDO[0m
echo.
echo                                                     [39m0[0m  - [38mVOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==30 goto CENTRAL
if %key%==31 goto REGEDIT_GPU
if %key%==32 goto KEYBOARD
if %key%==33 goto COLETA_DADOS
if %key%==34 goto RESTAURAR_COLETA
if %key%==0 goto MENU

:CENTRAL
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f
echo.
echo.
echo                                                     [90m61[0m - [38m REGEDIT APLICADO COM SUCESSO.
timeout 3 >nul
goto REGEDITs

:REGEDIT_GPU
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD  /d "8" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD  /d "6" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
echo.
echo.
echo                                                     [90m61[0m - [38m REGEDIT APLICADO COM SUCESSO.
timeout 3 >nul
goto REGEDIT


:KEYBOARD
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t REG_SZ /d "210" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatRate" /t REG_SZ /d "10" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "BounceTime" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "27" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last BounceKey Setting" /t REG_DWORD /d "00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Delay" /t REG_DWORD /d "00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Repeat" /t REG_DWORD /d "00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Wait" /t REG_DWORD /d "1000" /f
echo.
echo.
echo                                                     [90m61[0m - [38m REGEDIT APLICADO COM SUCESSO.
timeout 3 >nul
goto REGEDIT


:COLETA_DADOS
REM *** Remover Teletria/Coleta De Dados ***
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d 0 /f
echo.
echo.
echo                                                     [90m61[0m - [38m REGEDIT APLICADO COM SUCESSO.
timeout 3 >nul
goto REGEDIT


:RESTAURAR_COLETA
REM *** RESTAURAR COLETA E TELEMATRIA ***
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d 1 /f
REM *** RESTAURAR KEYBOARD ***
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t REG_SZ /d "1000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatRate" /t REG_SZ /d "500" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "BounceTime" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t REG_SZ /d "1000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "126" /f

reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last BounceKey Setting" /t REG_DWORD /d "00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Delay" /t REG_DWORD /d "00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Repeat" /t REG_DWORD /d "00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Wait" /t REG_DWORD /d "1000" /f
REM ((Remover GPU PRIORIDADE))
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD  /d "8" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD  /d "2" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
REM ***RESTAURAR CENTRAL DE NOTIFICAÇÕES
reg delete "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /f

echo.
echo.
echo                                                     [90m61[0m - [38m REGEDIT APLICADO COM SUCESSO.
timeout 3 >nul
goto REGEDIT






:SYSTEM
cls
echo.
echo               [32m ██████╗██╗   ██╗ ██████╗████████╗███████╗███╗   ███╗[0m     
echo               [32m██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║[0m     
echo               [32m╚█████╗  ╚████╔╝ ╚█████╗    ██║   █████╗  ██╔████╔██║[0m     
echo               [32m ╚═══██╗  ╚██╔╝   ╚═══██╗   ██║   ██╔══╝  ██║╚██╔╝██║[0m
echo               [32m██████╔╝   ██║   ██████╔╝   ██║   ███████╗██║ ╚═╝ ██║[0m     
echo               [32m╚═════╝    ╚═╝   ╚═════╝    ╚═╝   ╚══════╝╚═╝     ╚═╝[0m     
echo.                   
echo.
echo.
echo.
echo.
echo                                                     [39m42[0m - [38m SYSTEM INFO[0m
echo.
echo                                                     [39m0[0m  - [38mVOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==42 goto system_info
if %key%==0 goto MENU


:system_info
cls
:: SYSTEM INFO
systeminfo
echo.
echo.
echo                                                     [32m [-] SUCESSO SYSTEM INFO.
echo.
echo                                                     [32m [-] VOLTANDO AO MENU (9s).
timeout 9 >nul
goto MENU





:HIGH
cls
echo.
echo               [32m██╗  ██╗██╗ ██████╗ ██╗  ██╗[0m    [90m██████╗ ██████╗ ██╗ █████╗ ██████╗ ██╗████████╗██╗   ██╗[0m 
echo               [32m██║  ██║██║██╔════╝ ██║  ██║[0m    [90m██╔══██╗██╔══██╗██║██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝[0m
echo               [32m███████║██║██║  ██╗ ███████║[0m    [90m██████╔╝██████╔╝██║██║  ██║██████╔╝██║   ██║    ╚████╔╝ [0m
echo               [32m██╔══██║██║██║  ╚██╗██╔══██║[0m    [90m██╔═══╝ ██╔══██╗██║██║  ██║██╔══██╗██║   ██║     ╚██╔╝  [0m
echo               [32m██║  ██║██║╚██████╔╝██║  ██║[0m    [90m██║     ██║  ██║██║╚█████╔╝██║  ██║██║   ██║      ██║   [0m
echo               [32m╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝[0m    [90m╚═╝     ╚═╝  ╚═╝╚═╝ ╚════╝ ╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝   [0m
echo.                   
echo.
echo.
echo.
echo.
echo                [90m51[0m - [38m LISTA.[0m
echo                [90m52[0m - [38m INICIAR.[0m
echo                [90m53[0m - [38m RESTAURAR.[0m
echo                [90m0[0m  - [38m VOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==51 goto JOGOS
if %key%==52 goto HIGHINICIAR
if %key%==53 goto RESTAURAR
if %key%==0 goto MENU

:JOGOS
cls
echo.
echo.
@echo off
echo.
echo                                                     [31m [-] Total: Discord
echo                                                     [31m [-] Total: Discord Canary
echo                                                     [31m [-] Total: FiveM
echo                                                     [31m [-] Total: Brawlhalla
echo.
echo                                                     [31m [-] Total: 4
echo.
echo                                                     [32m [-] VOLTANDO AO MENU EM 5 SEGUNDOS....
timeout 5 >nul
goto HIGH


:HIGHINICIAR
echo.
echo.
cls
@echo on
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BrawlhallaGame.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discord.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DiscordCanary.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
@echo off
echo.
echo.
echo                                                     [32m [-] PRIORIDADE DEFINIDADES COMO ALTA.
echo.
echo                                                     [32m [-] REINICIE SEU COMPUTADOR.
echo.
timeout 6 >nul
goto HIGH


:RESTAURAR
echo.
echo.
cls
@echo on
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BrawlhallaGame.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discord.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DiscordCanary.exe\PerfOptions" /f
@echo off
echo.
echo.
echo                                                     [32m [-] RESTAURADO COM SUCESSO.
echo.
echo                                                     [32m [-] REINICIE SEU COMPUTADOR.
echo.
timeout 6 >nul
goto HIGH





:OPCAO_INVALIDO
cls
echo.
echo.
echo                                                     [31m [-] OPÇÃO INVÁLIDO!
echo.
echo                                                     [31m [-] RETORNANDO EM 5 SEGUNDOS...
timeout 5 >nul
goto MENU