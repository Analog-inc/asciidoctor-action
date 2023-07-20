#!/bin/bash
set -e

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

# Output HTML
mkdir -p ./outputs/html
asciidoctor -B ${CURRENT_PATH}/ -D ${CURRENT_PATH}/outputs/html/ -o index.html -r asciidoctor-diagram index.adoc

# Output PDF
mkdir -p ./outputs/pdf
asciidoctor-pdf -B ${CURRENT_PATH}/ -D ${CURRENT_PATH}/outputs/pdf/ -o index.pdf -a scripts@=cjk -r asciidoctor-diagram index.adoc

# Output ePub
mkdir -p ./outputs/ebub
asciidoctor-epub3 -B ${CURRENT_PATH}/ -D ${CURRENT_PATH}/outputs/ebub/ -o index.epub -r asciidoctor-diagram index.adoc
