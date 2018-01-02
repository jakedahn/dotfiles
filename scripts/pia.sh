#!/usr/bin/env bash

virtualenv .venv3 -p /usr/bin/python3
source .venv3/bin/activate
pip install pypia
pypia -i
