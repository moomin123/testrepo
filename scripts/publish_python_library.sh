#!/usr/bin/env bash
#
# This script publishes Python packages to test pypi
# https://packaging.python.org/tutorials/packaging-projects/
# 
# Please set PYPI_TOKEN environment variable with the token to upload to pypi.

set -e 
set -o pipefail

# SCRIPT_DIR is the directory path to this script.
SCRIPT_DIR="$(dirname "$BASH_SOURCE")"
PYTHON_PACKAGE_PATH=$SCRIPT_DIR/../python

echo "Generating distribution archives..."
python3 setup.py sdist bdist_wheel

echo "Uploading distribution archives..."
cat <<EOF > $HOME/.pypirc
[pypi]
  username = __token__
  password = $PYPI_TOKEN
EOF
python3 -m pip install --user --upgrade twine
python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*
