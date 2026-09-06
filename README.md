restaura el menu inicio de windows 11 a solo 6 iconos

09- 2026

quita el nuevo menu de wndows 11 conocido como new menu experience y restaura el menu original de windows 11

copia y pega este script en un bloc de notas y luego nombralo como un archivo .bat

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

lo guardas en un carpeta y pega el vivetools de https://github.com/thebookisclosed

y ejecutas como administrador, reinicias windows, despues vas a panel de control, menu ( start ) y ya tienes opcion de menu pequeña y grande :-)

o baja los archivos que dejo en un .rar

<img width="1067" height="1155" alt="Captura de pantalla 2026-09-06 114127" src="https://github.com/user-attachments/assets/0ee24341-c98d-44de-afee-a5f1321c8d4b" />
<img width="861" height="1057" alt="Captura de pantalla 2026-09-06 121903" src="https://github.com/user-attachments/assets/ee9b8342-9fa5-4117-a94e-b577d759c572" />
<img width="1112" height="610" alt="Captura de pantalla 2026-09-06 122016" src="https://github.com/user-attachments/assets/4f286003-ce37-4fe3-b09c-a0ab3d06a7e8" />

disfruta, tu menú de inicio restaurado

gracias a [thebookisclosed](https://github.com/thebookisclosed) y su proyecto de vivetool

**Full Changelog**: https://github.com/Dupre486DX/restaurar-menu-clasico-windows-11/compare/restore-new-menu-start-windows11...start
