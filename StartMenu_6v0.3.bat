@echo off
setlocal EnableExtensions

:: =======================================================
:: Windows 11 - Restaurar Menu de Inicio pequeno
:: Desactiva las flags antiguas y nuevas relacionadas
:: con el nuevo Menu de Inicio.
:: =======================================================

:: Validar si el script se ejecuta como Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Por favor, ejecuta este archivo como Administrador.
    echo.
    pause
    exit /b 1
)

:: Cambiar al directorio donde esta este script
cd /d "%~dp0"

echo =======================================================
echo DESACTIVANDO FLAGS DEL NUEVO MENU DE INICIO
echo =======================================================
echo.

:: Validar ViVeTool
if not exist "vivetool.exe" (
    echo [ERROR] No se encontro 'vivetool.exe' en esta carpeta.
    echo Coloca vivetool.exe junto a este script.
    echo.
    pause
    exit /b 1
)

echo [1/2] Desactivando flags anteriores del nuevo Menu...
echo.

vivetool.exe /disable /id:47205210
vivetool.exe /disable /id:48433719
vivetool.exe /disable /id:49221331
vivetool.exe /disable /id:49402389
vivetool.exe /disable /id:49820095
vivetool.exe /disable /id:55495322

echo.
echo [2/2] Desactivando las nuevas flags de tamano y personalizacion...
echo.

vivetool.exe /disable /id:61225604
vivetool.exe /disable /id:61596616
vivetool.exe /disable /id:61596617
vivetool.exe /disable /id:61596618
vivetool.exe /disable /id:61596619
vivetool /disable /id:61161244,61754985

vivetool /enable /id:61161244,61754985,62353331,62762248

echo.
echo =======================================================
echo FLAGS DESACTIVADAS
echo =======================================================
echo.
echo Recargando el Explorador de Windows...

taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

echo.
echo =======================================================
echo PROCESO TERMINADO
echo =======================================================
echo.
echo No se modifico Windows Update.
echo Si el cambio no aparece inmediatamente, reinicia Windows.
echo.
pause
exit /b 0
