# IA-Pendrive V2 — PDF e Histórico Offline

Projeto portátil para **Windows x64**, 16 GB de RAM recomendados, sem instalação administrativa, usando llama.cpp e Qwen3 4B.

## Novidades da V2
- Interface de chat própria em http://127.0.0.1:8787;
- Importação de **PDF com texto selecionável** (até 12 MB), usando Poppler/pdftotext;
- Conversas gravadas em `conversas/*.json`, no próprio pendrive;
- Texto extraído dos documentos em `documentos/*.txt`;
- Consulta do histórico e exclusão de conversas, inclusive dos textos associados.

## Instalação no pendrive (uma única vez, com internet)
1. Baixe este repositório como ZIP, extraia no pendrive USB 3.0 (de preferência 16 GB ou mais).
2. Baixe o pacote **Windows x64 CPU** do [llama.cpp](https://github.com/ggml-org/llama.cpp/releases) e extraia **todo seu conteúdo, inclusive DLLs** na pasta `programa/`. Deve existir `programa/llama-server.exe`.
3. Baixe [Qwen3-4B-Q4_K_M.gguf](https://huggingface.co/Qwen/Qwen3-4B-GGUF/resolve/main/Qwen3-4B-Q4_K_M.gguf) e grave em `modelo/`.
4. Baixe o **Windows x64 Binary ZIP** (LTS) do [Node.js](https://nodejs.org/en/download) e copie `node.exe` para `runtime/`. **Não é necessário instalar Node.js** nem usar npm.
5. Baixe [Poppler Windows](https://github.com/oschwartz10612/poppler-windows/releases). Extraia **todo o conteúdo de `Library/bin`**, incluindo `pdftotext.exe` e DLLs, para `programa/poppler/`.
6. Execute `INICIAR_IA_V2.bat` e abra http://127.0.0.1:8787. Espere o motor carregar. Para encerrar, feche as duas janelas do programa.

## Pastas
```
IA-Pendrive/
  INICIAR_IA_V2.bat
  app/
    server.js
    index.html
    app.js
    style.css
  runtime/node.exe                  (download externo)
  programa/llama-server.exe        (download externo)
  programa/poppler/pdftotext.exe   (download externo)
  modelo/Qwen3-4B-Q4_K_M.gguf      (download externo)
  conversas/                       (histórico local)
  documentos/                      (texto extraído)
```

## Observações
- PDFs digitalizados/escaneados ainda exigem OCR, não incluído.
- Apenas os **primeiros 9.000 caracteres** do PDF são enviados ao modelo em cada pergunta. O texto extraído completo fica salvo em TXT; PDFs grandes não são analisados integralmente nesta versão.
- Um PDF associado por conversa, e anexar outro substitui o anterior.
- Histórico salvo em texto sem criptografia. Cuide do pendrive e não publique documentos ou conversas no GitHub.
- O programa é acessível apenas pelo endereço local 127.0.0.1; arquivos não são enviados à internet pelo código.
- Computadores corporativos podem bloquear executáveis removíveis.
- Binários e modelo não integram este repositório. Respeite as licenças de llama.cpp, Qwen3, Node.js e Poppler.
- Código testado localmente com servidor de IA **simulado** e extração de PDF; integração completa no Windows deverá ser validada pelo usuário.

## Desenvolvimento
O arquivo `INICIAR_IA.bat` original (V1) foi mantido. Use `INICIAR_IA_V2.bat` para histórico e PDF.
