#!/bin/bash
set -e
set -x

ROOT=$(realpath $(dirname "$0"))/..
VENV="$ROOT/.venv"
echo "ROOT from $0 is $ROOT"
source "$ROOT/lib/version.sh"
echo "creating virtualenv in $VENV"
python3 -mvenv "$VENV"
source "$VENV"/bin/activate
pip install scikit-learn=="$SKLEARN_FULL_VERSION" pytest
python3 "$ROOT"/lib/skdoc.py "$@"
