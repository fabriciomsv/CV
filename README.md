# Cross-Validation Pipeline in Docker

A fully reproducible multinomial logistic regression cross-validation
workflow using **R**, **Docker**, and **r2u** for fast package
installation.

![R Version](https://img.shields.io/badge/R-4.x-blue) ![Docker
Build](https://img.shields.io/badge/Docker-Build-success-brightgreen)
![Image
Size](https://img.shields.io/docker/image-size/ghcr.io/fabriciomch/cv/latest)
![GHCR
Version](https://img.shields.io/github/v/release/FabricioMch/CV?label=GHCR%20Release)
![Pulls](https://img.shields.io/badge/GHCR%20Pulls-Auto-blueviolet)

## Overview

This repository provides a **containerized R environment** for training
multinomial logistic regression models with cross-validation using the
`eddelbuettel/r2u` image for reproducibility.

## Environment

  Component           Version
  ------------------- --------------------------
  Base image          `eddelbuettel/r2u:22.04`
  Ubuntu              22.04 LTS
  R                   Version bundled with r2u
  Package installer   r2u (APT binaries)

### R Packages Installed

-   nnet\
-   vroom\
-   here\
-   parallel\
-   tidytable\
-   magrittr

## Repository Structure

    /
    ├── R/
    ├── data/
    ├── output/
    ├── packages.R
    ├── main.R
    ├── Dockerfile
    └── .devcontainer/

## Build the Docker Image

    docker build -t cv_multinom --build-arg test_arg=TRUE .

## Run the Pipeline

    docker run -v ${PWD}/output/:/home/ubuntu/model/output cv_multinom

## Pull Public GHCR Image

    docker pull ghcr.io/fabriciomch/cv:latest

Link: https://github.com/FabricioMch/CV/pkgs/container/cv

# GitHub Codespaces Support

Works directly in Codespaces using `.devcontainer/devcontainer.json`.
