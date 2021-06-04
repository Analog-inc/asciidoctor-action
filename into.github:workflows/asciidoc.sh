#!/bin/bash
set -e

mkdir -p ./outputs/pdf
mkdir -p ./outputs/html
mkdir -p ./outputs/ebub

CURRENT_PATH=`pwd`
ASCIIDOCTOR_PDF_DIR=`gem contents asciidoctor-pdf --show-install-dir`

# -a, --attribute=ATTRIBUTE
# -B, --base-dir=DIR
# -D, --destination-dir=DIR
# -o, --out-file=OUT_FILE
# -R, --source-dir=DIR
# -b, --backend=BACKEND
# -d, --doctype=DOCTYPE
# -r, --require=LIBRARY

asciidoctor -B ${CURRENT_PATH}/ -D ${CURRENT_PATH}/outputs/html/ -o index.html -r asciidoctor-diagram index.adoc


asciidoctor-pdf -B ${CURRENT_PATH}/ -D ${CURRENT_PATH}/outputs/pdf/ -o index.pdf -a scripts@=cjk -r asciidoctor-diagram index.adoc


asciidoctor-epub3 -B ${CURRENT_PATH}/ -D ${CURRENT_PATH}/outputs/ebub/ -o index.epub -r asciidoctor-diagram index.adoc
