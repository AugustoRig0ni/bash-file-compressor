# Linux File Compressor

Script em Bash para compactar e descompactar arquivos utilizando `.tar.gz`.

## O que faz

- O script atua fazendo a compactação ou descompactação do arquivo declarado para o diretório desejado

## Como executar

Dar permissão ao script:

```bash
chmod +x compedescomp.sh
```

Compactar:
```bash
./compedescomp.sh compactar arquivo.txt destino/ nome_final
```

Descompactar:
```bash
./compedescomp.sh descompactar arquivo.tar.gz destino/
```
## Requisitos

- Linux (testado no Ubuntu/Debian)
- Bash 4.0+
- Comandos: `tar`, `du`, `mkdir`
