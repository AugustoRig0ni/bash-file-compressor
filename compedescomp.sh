#!/bin/bash

echo "==============================="
echo "  II Linux File Compressor II  "
echo "==============================="

	read -p "Entre com a operação desejada: 'compactar' ou 'descompactar' " operacao
	case "$operacao" in
		"compactar")
		read -p "Nome do arquivo final: " arquivo_saida
		arquivo_saida="${arquivo_saida}.tar.gz"

		read -p "Arquivo para compactar: " arquivo

	        if [ ! -f "$arquivo" ]; then
                        echo "Arquivo não encontrado"
                        exit 1
                fi
		read -p "Nome do diretório para salvar o arquivo compactado:  " diretorio

	        mkdir -p "$diretorio"

		tar -czf "$diretorio/$arquivo_saida" "$arquivo"

		echo "Compactado com sucesso em $diretorio/$arquivo_saida"

		echo
		echo "Tamanho do arquivo compactado:"
		du -h "$diretorio/$arquivo_saida"
	;;

	"descompactar")
		read -p "Nome do arquivo a descompactar (.tar.gz): " arquivo
		read -p "Diretório de destino: " diretorio

	        if [ ! -f "$arquivo" ]; then
                        echo "Arquivo não encontrado"
                        exit 1
                fi

	        mkdir -p "$diretorio"

	     if	tar -xzf "$arquivo" -C "$diretorio"; then
		echo "Descompactado com sucesso em $diretorio"
	     else
	        echo "Erro ao Descompactar o arquivo"
		exit 1
	     fi
	;;

	*)
	echo "operação invalida!"
	echo "Selecione descompactar ou compactar"
	exit 1
	;;
esac 
