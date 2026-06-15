copia y pega en un documento de texto y luegon crea o guarda en un .bat

-------------
@echo off
:: Validar si el script se esta ejecutando como Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Por favor, ejecuta este archivo haciendo clic derecho y seleccionando "Ejecutar como administrador".
    pause
    exit /b
)

echo =======================================================
echo   REPARANDO MENU INICIO DE WINDOWS 11 (DISEÑO CLASICO)  
echo =======================================================
echo.

echo [1/3] Aplicando directiva de restriccion del Explorador...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuMorePrograms /t REG_DWORD /d 1 /f >nul

echo [2/3] Eliminando carpeta de invalidacion de Microsoft (Feature 14)...
reg delete "HKLM\SYSTEM\ControlSet001\Control\FeatureManagement\Overrides\14" /f >nul 2>&1

echo [3/3] Reiniciando el Explorador de Windows para aplicar cambios...
taskkill /f /im explorer.exe >nul
start explorer.exe

echo.
echo =======================================================
echo   PROCESO TERMINADO CON EXITO
echo =======================================================
echo.
pause
exit

----------------

simplemente haz clic derecho sobre el archivo creado y selecciona Ejecutar como administrador. 

La ventana de cmd hará todo el trabajo en dos segundos, explorer se reiniciara y el menú de tu inicio volverá a la normalidad de forma instantánea.

--------

tambien puedes solo descargar el .bat que ya hice.

disfruta tu menu de unicio clasico 
:)
