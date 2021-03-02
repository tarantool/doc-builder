# Docker image for building any Tarantool documentation

Pull docker image
```bash
docker pull tarantool/doc-builder
```

Then build a documentation
```bash
docker run --rm -it -v $(pwd)/doc tarantool/doc-builder sh -c "make <doc>"
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
