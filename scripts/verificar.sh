#!/bin/bash
set -Eeuo pipefail

echo "===== VERIFICACIÓN DE CONTENEDORES ====="

for contenedor in \
  devops-portfolio-dev-backend-1 \
  devops-portfolio-dev-backend-2 \
  devops-portfolio-dev-frontend \
  devops-portfolio-dev-postgres
do
  if docker inspect -f '{{.State.Running}}' "$contenedor" 2>/dev/null | grep -q true; then
    echo "OK: $contenedor está activo."
  else
    echo "ERROR: $contenedor no está activo."
    exit 1
  fi
done

echo "===== VERIFICACIÓN DEL FRONTEND ====="
if curl -fsSI http://localhost:8080 >/dev/null; then
  echo "OK: frontend responde correctamente."
else
  echo "ERROR: frontend no responde."
  exit 1
fi

echo "===== VERIFICACIÓN DE TERRAFORM ====="
terraform plan -detailed-exitcode -input=false -no-color

echo "===== VERIFICACIÓN FINALIZADA ====="
