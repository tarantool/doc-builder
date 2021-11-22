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

### 1.1

Added the `sphinx-jinja` extension for rendering Jinja templates
in the docs.

### 1

The base image versions