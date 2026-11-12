@echo off
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0"
title IA Portatil - Offline
set "SERVER=%~dp0programa\llama-server.exe"
set "MODEL=%~dp0modelo\Qwen3-4B-Q4_K_M.gguf"
if not exist "%SERVER%" (
  echo [ERRO] O arquivo programa\llama-server.exe nao foi encontrado.
  echo Extraia TODOS os arquivos Windows x64 CPU do llama.cpp na pasta programa.
  pause
  exit /b 1
)
if not exist "%MODEL%" (
  echo [ERRO] O arquivo modelo\Qwen3-4B-Q4_K_M.gguf nao foi encontrado.
  echo Baixe o modelo e salve-o na pasta modelo.
  pause
  exit /b 1
)
echo Iniciando IA offline em http://127.0.0.1:8080
echo Para encerrar, pressione CTRL+C nesta janela.
start "Abrir chat" /min cmd /c "timeout /t 8 /nobreak >nul & start http://127.0.0.1:8080"
"%SERVER%" --model "%MODEL%" --ctx-size 4096 --threads 6 --host 127.0.0.1 --port 8080 --n-gpu-layers 0
if errorlevel 1 (
  echo [ERRO] O servidor foi encerrado com erro.
  pause
)
endlocal
