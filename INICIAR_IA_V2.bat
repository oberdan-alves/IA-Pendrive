@echo off
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0"
title IA Pendrive V2 - PDF e Historico
set "NODE=%~dp0runtime\node.exe"
set "SERVER=%~dp0programa\llama-server.exe"
set "MODEL=%~dp0modelo\Qwen3-4B-Q4_K_M.gguf"
if not exist "%NODE%" (
  echo [ERRO] runtime\node.exe nao encontrado. Baixe a versao Windows x64 de Node.js.
  pause & exit /b 1
)
if not exist "%SERVER%" (
  echo [ERRO] programa\llama-server.exe nao encontrado. Extraia llama.cpp Windows x64 CPU.
  pause & exit /b 1
)
if not exist "%MODEL%" (
  echo [ERRO] modelo\Qwen3-4B-Q4_K_M.gguf nao encontrado.
  pause & exit /b 1
)
if not exist "%~dp0programa\poppler\pdftotext.exe" (
  echo [AVISO] pdftotext.exe ausente: chat funcionara, mas leitura PDF nao.
)
echo Iniciando motor de IA na porta 8080...
start "Motor IA - nao fechar" /min "%SERVER%" --model "%MODEL%" --ctx-size 4096 --threads 6 --host 127.0.0.1 --port 8080 --n-gpu-layers 0
if errorlevel 1 echo [AVISO] Nao foi possivel iniciar motor de IA.
echo Iniciando interface e historico na porta 8787...
start "Abrir IA Pendrive" /min cmd /c "timeout /t 4 /nobreak >nul & start http://127.0.0.1:8787"
"%NODE%" "%~dp0app\server.js"
if errorlevel 1 (echo [ERRO] Interface encerrada com erro. & pause)
endlocal
