#!/bin/bash
set -u

if [ ! -f terraform.tfstate ]; then
  echo "ERROR: No se encontró terraform.tfstate."
  exit 1
fi

if [ -z "${TF_VAR_postgres_password:-}" ]; then
  echo "ERROR: Falta TF_VAR_postgres_password."
  exit 1
fi

set +e
terraform plan -detailed-exitcode -input=false
resultado=$?
set -e

case "$resultado" in
  0)
    echo "Sin diferencias detectadas."
    exit 0
    ;;
  1)
    echo "ERROR: Terraform plan falló."
    exit 1
    ;;
  2)
    echo "DRIFT DETECTADO: Hay diferencias pendientes."
    exit 2
    ;;
esac
