#!/bin/bash

mkdir -p ./rendered/

for f in ./deployment/*.y*ml
do
  envsubst < $f > "./rendered/$(basename $f)"
done
