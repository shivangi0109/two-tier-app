# Here’s a step-by-step guide to build a 2-tier full-stack app using:

* Frontend: Vite + React

* Backend: Node.js + Express

* CI: Jenkins with Docker agent

* CD: GitOps using ArgoCD

* Deployment: Kubernetes

* Repos:

  * two-tier-app: frontend + backend + Jenkins

  * two-tier-k8s-manifests: Kubernetes manifests for ArgoCD

# 🗂 Repo Structure Overview

## ✅ Repo 1: two-tier-app

two-tier-app/
├── frontend/           # Vite + React app
│   └── Dockerfile
├── backend/            # Node.js + Express
│   └── Dockerfile
├── Jenkinsfile         # CI pipeline
└── README.md

## ✅ Repo 2: two-tier-k8s-manifests

two-tier-k8s-manifests/
├── frontend/
│   ├── deployment.yaml
│   └── service.yaml
├── backend/
│   ├── deployment.yaml
│   └── service.yaml
├── namespace.yaml
├── kustomization.yaml
└── argocd-app.yaml