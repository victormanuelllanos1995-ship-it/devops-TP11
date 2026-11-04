#!/bin/bash
set -e

if [ ! -f terraform.tfstate ]; then
  echo "ERROR: No se encontró terraform.tfstate."
  echo "No se puede comprobar Drift sin el estado original."
  exit 1
fi

if [ -z "${TF_VAR_postgres_password:-}" ]; then
  echo "ERROR: Falta TF_VAR_postgres_password."
  exit 1
fi

terraform plan -detailed-exitcode -input=false
resultado=$?

if [ "$resultado" -eq 0 ]; then
  echo "Sin diferencias detectadas."
elif [ "$resultado" -eq 2 ]; then
  echo "Hay diferencias pendientes."
fi

exit "$resultado"
