#!/usr/bin/env bash
#
# This script publishes Python packages to test pypi
# https://packaging.python.org/tutorials/packaging-projects/
# 
# Please provide pypi credentials in this file $HOME/.pypirc, with this value:
# [pypi]
# username = __token__
# password = [provide your pypi token here]

set -e 
set -o pipefail

# SCRIPT_DIR is the directory path of this script.
SCRIPT_DIR="$(dirname "$BASH_SOURCE")"
PYTHON_PACKAGE_PATH=$SCRIPT_DIR/../python
ORIGINAL_DIR=$PWD

cd $PYTHON_PACKAGE_PATH

echo "============================================================"
echo "Generating distribution archives..."
echo "============================================================"
python3 -m pip install --user --upgrade setuptools wheel
python3 setup.py sdist bdist_wheel

echo "============================================================"
echo "Uploading distribution archives..."
echo "============================================================"
python3 -m pip install --user --upgrade twine
python3 -m twine upload --repository testpypi dist/*

cd $ORIGINAL_DIR