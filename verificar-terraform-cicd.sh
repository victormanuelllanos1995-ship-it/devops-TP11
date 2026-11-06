#!/bin/bash
set -u

echo "=== AUDITORIA TERRAFORM CI/CD ==="

archivos=(
  "main.tf"
  "variables.tf"
  "providers.tf"
  "modules/network/main.tf"
  "modules/storage/main.tf"
  "modules/app/main.tf"
  ".github/workflows/terraform-pr.yml"
  ".github/workflows/terraform-cd.yml"
  ".github/workflows/terraform-drift.yml"
  "scripts/verificar-drift.sh"
  "scripts/simular-drift.sh"
)

errores=0

for archivo in "${archivos[@]}"; do
  if [ -s "$archivo" ]; then
    echo "[OK] $archivo"
  else
    echo "[FALTA O VACIO] $archivo"
    errores=$((errores + 1))
  fi
done

echo
if [ "$errores" -eq 0 ]; then
  echo "Auditoria de archivos: correcta."
else
  echo "Auditoria de archivos: $errores problema(s)."
  exit 1
fi
