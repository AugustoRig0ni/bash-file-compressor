#!/usr/bin/env bash

set -euo pipefail

echo "==============================="
echo "  II Linux File Compressor II  "
echo "==============================="


compactar() {
		local arquivo="$1"
		local diretorio="$2"
		local nome_final="$3"
		local arquivo_saida="${nome_final}.tar.gz"

	      if [ ! -f "$arquivo" ];then
		echo "Arquivo não encontrado $arquivo"
		exit 1
	      fi

	        mkdir -p "$diretorio"
		tar -czf "$diretorio/$arquivo_saida" "$arquivo"
		echo "Compactado com sucesso em $diretorio/$arquivo_saida"
		echo
		echo "Tamanho do arquivo compactado:"
		du -h "${diretorio%/}/$arquivo_saida"
}

descompactar() {

		local arquivo="$1"
		local diretorio="$2"

	       if [ ! -f "$arquivo" ]; then
                  echo "Arquivo não encontrado: $arquivo"
                  exit 1
               fi

	        mkdir -p "$diretorio"

	     if	tar -xzf "$arquivo" -C "$diretorio"; then
		echo "Descompactado com sucesso em $diretorio"
	     else
	        echo "Erro ao Descompactar o arquivo"
		exit 1
	     fi
	}

main() {
	
	if [ $# -eq 0 ]; then
		echo "Uso:  ./compdescomp.sh compactar nome_do_arquivo pasta_destino/"
		echo "         ./compedescomp.sh descompactar nome_do_arquivo.tar.gz pasta_destino/"
		exit 1
	fi

	case "$1" in
		"compactar")     compactar "$2" "${3%/}" "$4" ;;
		"descompactar")  descompactar "$2" "$3" ;;
		*) echo "Operação inválida"; exit 1 ;; 
	   esac
}

main "$@"
