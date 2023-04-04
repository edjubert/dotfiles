#!/bin/bash

DIRNAME=`dirname $0`

cat "$DIRNAME/arch_deps" | cut -d ' ' -f1 | tr '\n' ' ' | xargs paru -S
