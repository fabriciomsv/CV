# Cross-Validation Pipeline with Docker

[![Docker Pulls](https://img.shields.io/badge/Docker%20Pull-ghcr.io%2Ffabriciomch%2Fcv-blue)](https://ghcr.io/fabriciomch/cv)
[![GitHub Codespaces](https://img.shields.io/badge/Codespaces-Ready-brightgreen)](https://github.com/codespaces)
[![R Version](https://img.shields.io/badge/R-4.3.x-blue)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)]()

This repository contains a fully reproducible environment for running multinomial logistic models with **k-fold cross‑validation** using **R**, **Docker**, and **MLOps-oriented practices**.  
It provides a fully portable workflow suitable for research, teaching, and academic reproducibility.

---

## 📦 Pull the Image

The prebuilt container image is available on GitHub Container Registry:

```bash
docker pull ghcr.io/fabriciomch/cv:sha256-88c99867d3ffb839eb8e5ca9159cbee789e8da5f23ab67fb076960483a5da42b.sig
```

---

## 🏗️ Build the Image Locally

```bash
docker build -t cv_multinom --build-arg test_arg=TRUE .
```

---

## ▶️ Run the Container

Mount your local `output/` directory to collect model artifacts and validation results:

```bash
docker run -v ${PWD}/output/:/home/ubuntu/model/output cv_multinom
```

After execution, all models and validation results will be saved in:

```
output/
```

---

## 🧪 What’s Inside the Image?

The image is based on **r2u (R built for Ubuntu)** for fast, binary package installation.

### **R Version**
- `R 4.3.x` (Ubuntu 22.04 via r2u)

### **Packages Included**
- `nnet` — multinomial logistic regression  
- `parallel` — parallel processing for cross-validation  
- `vroom` — high-performance data loading  
- `tidytable` — efficient tidy data manipulation  
- `magrittr` — piping utilities  
- `here` — safe project paths  

---

## 📚 Project Structure

```
model/
├── R/              # R scripts with model logic
├── data/           # Input datasets
├── output/         # Results of validation and trained models
├── main.R          # Main execution script
└── packages.R      # Package installer
```

---

## 💻 GitHub Codespaces Support

This repository is **Codespaces-ready**.

To enable one-click reproducibility in the cloud, include the following file in your repo:

### `.devcontainer/devcontainer.json`

```json
{
  "name": "CV Multinom",
  "image": "ghcr.io/fabriciomch/cv:latest",
  "customizations": {
    "vscode": {
      "extensions": ["ms-vscode.remote-containers"]
    }
  }
}
```

Once pushed, GitHub will show a **“Open in Codespaces”** button allowing instant container-based execution.

---

## 📜 License

MIT License.  
You are free to use, modify, and distribute this project with attribution.

---

## 🙌 Acknowledgements

This work was conducted as part of an academic research workflow, combining statistical learning with MLOps practices to ensure **reproducibility**, **portability**, and **computational scalability**.

