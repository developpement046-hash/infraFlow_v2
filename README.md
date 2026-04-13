# InfraFlow v2

 est une infrastructure Cloud Native complète pour le déploiement sécurisé d'une architecture microservices. Ce projet intègre l'orchestration Kubernetes, une pipeline CI/CD automatisée et un monitoring temps réel

#  Architecture & Stack

- **Conteneurisation :** Docker (Images Alpine optimisées)
- **Orchestration :** Kubernetes (Minikube/Kind)
- **CI/CD :** GitHub Actions (Linting + Security Scan via Trivy)
- **Observabilité :** Prometheus & Grafana
- **Automatisation :** Bash (Scripts de déploiement sécurisés)

---

# Prérequis

- Docker Desktop avec Kubernetes activé
- kubectl
- Helm
- Git

# Démarrage rapide

# Déploiement Automatisé 

Le script `deploy.sh` gère la vérification des prérequis, la création du namespace `infraflow` et le déploiement des manifestes :

```bash

chmod +x scripts/deploy.sh
./scripts/deploy.sh

```
# Docker Compose

```bash
docker compose up -d
```

# pour Kubernetes
```bash
kubectl apply -f k8s/namespace.yml
kubectl apply -f k8s/api-service/
kubectl apply -f k8s/web-service/
kubectl get pods -n infraflow
```

# POUR  monitoring
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring --create-namespace
kubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring

# .........................URL : http://localhost:3000................................................................ #

# .........................Identifiants par défaut : admin / prom-operator............................................ #

##### Note : Dans un environnement de production réel, ces identifiants seraient gérés via des Secrets Kubernetes chiffrés et modifiés dès l'initialisation.

```

## Structure du projet

```
.
├── api-service/        # Backend & Dockerfile non-root
├── web-service/        # Frontend & Nginx config
├── k8s/                # Manifestes (Deployments, Services, HPA, Quotas)
├── .github/workflows/  # Pipeline CI/CD (Lint, Scan, Build, Push)
├── scripts/            # Script d'automatisation (deploy.sh)
└── docker-compose.yml  # Environnement de dev local
```