# Asciidoctor docker action

You can use Asciidoctor command easily if you use this action

## Inputs

### `shellcommand`

**required** 
bash command   
default 'asciidoctor index.adoc'

## sample


## Example

### Example Nomal
```
steps:
- name: Build AsciiDoc step
  id: documents
  uses: Analog-inc/asciidoctor-action@master
  with:
    shellcommand: "asciidoctor index.adoc" 
```
### Example Executed when pushed

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
```

### Example Save All File

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
    - name: Get the output time
      run: echo "The time was ${{ steps.documents.outputs.time }}"
    # Save the AsciiDoc step
    - name: Save AsciiDoc step
      uses: actions/upload-artifact@v1
      with:
        name: documents
        path: ./
```
