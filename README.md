# Docker images for building Tarantool documentation

## Getting started

Pull the docker image
```bash
docker pull tarantool/doc-builder:fat
```

or the slim version if you don't need PDF builders

```bash
docker pull tarantool/doc-builder:slim
```

Then build the documentation

```bash
docker run --rm -it -v $(pwd):/doc tarantool/doc-builder sh -c "make <doc>"
```

## What's on board:

- sphinx 1.8.5
- texlive 
- graphviz
- sphinx-intl
- docutils
- sphinxcontrib-svg2pdfconverter
- sphinx-autobuild
- awscli
- pandoc
- panflute

## Version history

### 2.1

* Added the [sphinx-panels](https://github.com/executablebooks/sphinx-panels/) extension

### 2

* Using Sphinx 2.4.5

### 1

* The base image versions based on Sphinx 1.8.5