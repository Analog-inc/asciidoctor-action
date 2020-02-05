# Asciidoctor docker action

このアクションはasciidoctorでビルドします

## Inputs

### `shellcommand`

**required** 出力コマンド 'asciidoctor index.adoc'。

## 出力

### `time`

完了した時間。

## 使用例
```
name: CI

on: [push]

jobs:
  asciidoctor_job:
    runs-on: ubuntu-latest
    name: Build AsciiDoc
    steps:
    - name: Check out code into the Go module directory
      uses: actions/checkout@v2
    - name: Build AsciiDoc step
      id: documents
      uses: Analog-inc/asciidoctor-action@master
      with:
        shellcommand: "asciidoctor index.adoc" 
    # Use the output from the documents step
    - name: Get the output time
      run: echo "The time was ${{ steps.documents.outputs.time }}"
    - name: Save AsciiDoc step
      uses: actions/upload-artifact@v1
      with:
        name: manifest
        path: ./
        
```
