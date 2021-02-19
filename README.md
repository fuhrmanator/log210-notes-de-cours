# Pandoc book template

## Description

This repository contains a template for building [Pandoc](http://pandoc.org/) documents;
Pandoc is a suite of tools to compile markdown files into readable files (PDF, EPUB, HTML...).

## Usage

Because of the complexity of the pandoc/LaTeX installation, I created a docker image.

### Installing

It requires [Docker](https://www.docker.com/) and [make](https://www.gnu.org/software/make/).

To build the Docker image (you only need to do this once):

```sh
cd docker
make
```


To build the PDF (other formats are not supported yet...)

```sh
cd src
make pdf
```

## Original Contributors

This project was initially cloned from

| Avatar | Name | Nickname | Email |
| ------ | ---- | -------- | ----- |
| ![](http://www.gravatar.com/avatar/2ae6d81e0605177ba9e17b19f54e6b6c.jpg?s=64)  | Daniel Herzog | Wikiti | [info@danielherzog.es](mailto:info@danielherzog.es)
