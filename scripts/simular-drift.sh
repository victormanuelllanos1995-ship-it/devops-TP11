#!/bin/bash
set -euo pipefail

CONTENEDOR="${1:-devops-portfolio-dev-frontend}"

if ! docker inspect "$CONTENEDOR" >/dev/null 2>&1; then
  echo "ERROR: No existe el contenedor $CONTENEDOR."
  exit 1
fi

echo "Contenedor encontrado: $CONTENEDOR"
echo "Para simular Drift, se debe modificar manualmente un atributo gestionado por Terraform."
echo "No se realizaron cambios en el contenedor."
