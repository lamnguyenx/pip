#!/bin/bash

# Copyright 2022-2024 (author: lamnguyenx)

# DIRECTION='
# Add the following lines to your .bashrc:

#     # %--start--
#     # per-project environment
#     if [[ -f .project.sh ]]; then
#         source .project.sh
#     fi
#     # %--end--

# '

if [ -n "$BASH_VERSION" ]; then
    BASH_SOURCE="${BASH_SOURCE[0]}"
elif [ -n "$ZSH_VERSION" ]; then
    BASH_SOURCE="${(%):-%x}"
else
    echo "Unsupported shell. Please use Bash or Zsh."
    exit 1
fi

SWD="$(dirname "$(realpath "$BASH_SOURCE")")"
export RAM_DISK=${RAM_DISK:-"/dev/shm"}


### GENERAL
export LOG_LEVEL="${LOG_LEVEL:-"INFO"}"
export PROJECT_ROOT="$SWD"


### PYTHON
PYTHONPATH="${PYTHONPATH:-""}"
# for d in src/blax/__submodules__/*/src; do
#     PYTHONPATH="$d:$PYTHONPATH"
# done
MORE_FIXED_PATHS="$(realpath -q "$SWD/exp/__pymodules__" || true):${SWD}/src"
export PYTHONPATH="$(echo "$MORE_FIXED_PATHS" | sed -e "s|\n|:|g"):$PYTHONPATH"
export MYPYPATH=$PYTHONPATH