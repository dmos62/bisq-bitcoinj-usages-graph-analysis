#!/bin/bash

jdeps -v ../*/build/classes/java/main/ \
| sed -e 's/ (.*)//g' \
| grep -E '(.*bisq.*->.*bitcoinj.*|.*bisq.*->.*bisq.*|}|^digraph.*)' \
| sed -E 's/^\s+((\w|\.)+).+->\s+((\w|\.)+).+$/\1 \3/g' \
| grep --invert-match -E '^(.+?)\s\1$' \
| sort -u
