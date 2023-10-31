# Docker images for building Tarantool documentation

## Contributing

### Building the image locally

Default (fat) image:
```bash
docker build -t tarantool/doc-builder:fat-tag . 
```

Slim image
```bash
docker build -t tarantool/doc-builder:slim-tag --file Dockerfile-slim .
```
### Releasing the image

Put an annotated tag on the commit after merging your PR.
CI will build and publish it to Docker Hub.

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
- dvisvgm

## Version history

### Unreleased

### 4.4

* base Docker image updated to `3.8-slim-bookworm`

### 4.3

* myst-parser added
* docutils updated to 0.15

### 4.2

* Add recommonmark and sphinx-rtd-theme

### 4.1

* Add dvisvgm package for buinding SVGs with math formulas.

### 4.0

* Sphinx updated to 4.3.1
* sphinxcontrib-svg2pdfconverter updated to 1.2.0
* sphinxcontrib-plantuml updated to 0.22
* tex-gyre package added

### 2.1

* Added the [sphinx-panels](https://github.com/executablebooks/sphinx-panels/) extension

### 2

* Using Sphinx 2.4.5

### 1

* The base image versions based on Sphinx 1.8.5
