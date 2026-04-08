#!/usr/bin/env bash
set -euo pipefail

# Couleurs
GREEN='\033[0;32m'
NC='\033[0m'

# Vérification des prérequis
check_prerequisites() {
  echo "Vérification des prérequis..."
  for cmd in kubectl helm docker; do
    if ! command -v "$cmd" &> /dev/null; then
      echo "Erreur : $cmd n'est pas installé"
      exit 1
    fi
  done
  echo "Tous les prérequis sont présents."
}

# Déploiement
deploy() {
  echo "Déploiement des manifestes Kubernetes..."
  kubectl apply -f k8s/namespace.yml
  kubectl apply -f k8s/api-service/
  kubectl apply -f k8s/web-service/

  echo "Attente que les pods soient Ready..."
  kubectl rollout status deployment/api-service -n infraflow --timeout=120s
  kubectl rollout status deployment/web-service -n infraflow --timeout=120s

  echo -e "${GREEN}Déploiement terminé avec succès !${NC}"
}

check_prerequisites
deploy