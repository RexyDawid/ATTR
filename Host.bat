@echo off
title 

echo            ,.-:~:-.                .:'/*/'`:,·:~·–:.,               .:'/*/'`:,·:~·–:.,                    ,.-~·-.,__,.-::^·- .,'   ‘
echo            /':::::::::'`,             /::/:/:::/:::;::::::/`':.,'        /::/:/:::/:::;::::::/`':.,'            /:::::::::::::::::::::::::/'; '
echo          /;:-·~·-:;':::',          /·*'`·´¯'`^·-~·:–-'::;:::'`;     /·*'`·´¯'`^·-~·:–-'::;:::'`;         /;:·–– :;:::::_ ;: – .,/::;i'‘
echo        ,'´          '`:;::`,        '\                       '`;::'i‘   '\                       '`;::'i‘      /´          ¯¯           ';::/
echo       /                `;::\         '`;        ,– .,        'i:'/      '`;        ,– .,        'i:'/     ,:                          ,:/
echo     ,'                   '`,::;         i       i':/:::';       ;/'         i       i':/:::';       ;/'      ';_,..–-.,_     _    _,.·´‘
echo    i'       ,';´'`;         '\:::', ‘     i       i/:·'´       ,:''           i       i/:·'´       ,:''                 ,·´'    '`·;'i¯
echo  ,'        ;' /´:`';         ';:::'i‘     '; '    ,:,     ~;'´:::'`:,        '; '    ,:,     ~;'´:::'`:,              i         'i:i'       ’
echo  ;        ;/:;::;:';         ',:::;     'i      i:/\       `;::::/:'`;'     'i      i:/\       `;::::/:'`;'           ';        ';:i'     ’
echo 'i        '´        `'         'i::'/      ;     ;/   \       '`:/::::/'      ;     ;/   \       '`:/::::/'            i        i:/' 
echo ¦       '/`' *^~-·'´\         ';'/'‚      ';   ,'       \         '`;/'       ';   ,'       \         '`;/'              ;      i/
echo '`., .·´              `·.,_,.·´  ‚       `'*´          '`~·-·^'´           `'*´          '`~·-·^'´                  \   '/'     
echo  
color 0a

:: Pfad zu den Update Dateien
set UPDATE_DIR=%~dp0Update

:: Überprüfen, ob die notwendigen DLL-Dateien existieren
if not exist "%UPDATE_DIR%\Host.dll" (
    echo ERROR: Host.dll fehlt! Das Skript kann nicht ausgefuehrt werden.
    cscript //nologo "%UPDATE_DIR%\FalseVersion.vbs"
    exit /b
)

if not exist "%UPDATE_DIR%\Server.dll" (
    echo ERROR: Server.dll fehlt! Das Skript kann nicht ausgefuehrt werden.
    cscript //nologo "%UPDATE_DIR%\FalseVersion.vbs"
    exit /b
)

if not exist "%UPDATE_DIR%\Linux.dll" (
    echo ERROR: Linux.dll fehlt! Das Skript kann nicht ausgefuehrt werden.
    cscript //nologo "%UPDATE_DIR%\FalseVersion.vbs"
    exit /b
)

if not exist "%UPDATE_DIR%\Connect.dll" (
    echo ERROR: Connect.dll fehlt! Das Skript kann nicht ausgefuehrt werden.
    cscript //nologo "%UPDATE_DIR%\FalseVersion.vbs"
    exit /b
)

:: Alle notwendigen Dateien sind da. Ladebalken Funktion.
call :loading

:: Hauptmenü
:menu
cls
echo ============================
echo        ATTR Antivirus
echo ============================
echo 1. Sichere meine Daten
echo 2. PC durchsuchen
echo 3. README anzeigen
echo 4. Exit
echo ============================
set /p choice=Bitte wähle eine Option (1-4):

if "%choice%"=="1" goto safe_data
if "%choice%"=="2" goto scan_pc
if "%choice%"=="3" goto readme
if "%choice%"=="4" goto exit

:: README anzeigen
:readme
start notepad "%~dp0README.txt"
goto menu

:: Sichere meine Daten
:safe_data
md "C:\Safe-Ordner"
echo Der Safe-Ordner wurde erstellt.
pause
goto menu

:: PC durchsuchen
:scan_pc
echo Der Antivirus durchsucht jetzt deinen PC. Dies kann 3-5 Minuten dauern...
:: Simulierte Scan-Zeit
timeout /t 180
echo Der Scan wurde abgeschlossen. Es wurden keine Bedrohungen gefunden.
pause
goto menu

:: Exit
:exit
echo Vielen Dank, dass du ATTR Antivirus benutzt hast.
pause
exit

:: Ladebalken Funktion
:loading
cls
echo Bitte warten, ATTR Antivirus wird geladen...
setlocal enabledelayedexpansion
set bar=
for /L %%i in (1,1,50) do (
    set bar=!bar!█
    cls
    echo !bar!
    ping -n 1 -w 50 127.0.0.1 >nul
)
endlocal
goto menu

