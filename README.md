# InfraFlow v2

Infrastructure microservices avec Docker, Kubernetes, CI/CD et Monitoring.

## Prérequis

- Docker Desktop avec Kubernetes activé
- kubectl
- Helm
- Git

## Démarrage rapide

### Docker Compose
```bash
docker compose up -d
```

### Kubernetes
```bash
kubectl apply -f k8s/namespace.yml
kubectl apply -f k8s/api-service/
kubectl apply -f k8s/web-service/
kubectl get pods -n infraflow
```

### Monitoring
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring --create-namespace
kubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring
```

## Structure du projet

```
infraflow/
├── api-service/        # Service API Node.js
├── web-service/        # Service Web Nginx
├── k8s/               # Manifestes Kubernetes
├── .github/workflows/ # CI/CD GitHub Actions
├── scripts/           # Scripts de déploiement
└── docker-compose.yml # Infrastructure locale
```