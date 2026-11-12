# IA-Pendrive — IA offline portátil para Windows

Assistente local baseado em **llama.cpp** + **Qwen3 4B Q4_K_M**, planejado para Windows x64 e computadores com 16 GB de RAM.

## Instalação
1. Baixe este repositório como ZIP e extraia no pendrive USB 3.0 (16 GB ou mais).
2. Baixe a distribuição **Windows x64 (CPU)** em https://github.com/ggml-org/llama.cpp/releases e extraia todo seu conteúdo, inclusive DLLs, na pasta `programa/`. Deve existir `programa/llama-server.exe`.
3. Baixe https://huggingface.co/Qwen/Qwen3-4B-GGUF/resolve/main/Qwen3-4B-Q4_K_M.gguf e salve na pasta `modelo/`.
4. Execute `INICIAR_IA.bat` e abra http://127.0.0.1:8080. Não é necessária internet após a preparação.

## Requisitos
Windows 10/11 x64; 16 GB RAM recomendados; política de segurança que permita executáveis locais. Não requer Python nem instalação administrativa, mas a compatibilidade depende do PC.

## Limitações
- O modelo e os binários são baixados separadamente: **não estão incluídos** no repositório.
- A primeira versão oferece chat local, redação e programação; não lê PDF, DOCX ou XLSX diretamente.
- Conversas não são automaticamente salvas no pendrive.
- Informações legais e técnicas precisam ser verificadas com fontes confiáveis.
- Servidor restrito a `127.0.0.1` (sem acesso externo).

## Estrutura
```
IA-Pendrive/
  INICIAR_IA.bat
  README.md
  .gitignore
  programa/
  modelo/
  documentos/
  conversas/
```
As pastas `documentos` e `conversas` são reservas para futuras funcionalidades. Não coloque dados pessoais ou sensíveis em repositórios públicos.

## Licenças
Motor: https://github.com/ggml-org/llama.cpp
Modelo: https://huggingface.co/Qwen/Qwen3-4B-GGUF

Respeite as licenças originais para redistribuição.
