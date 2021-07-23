#!/bin/bash

mkdir -p ~/.cargo

ln -sf "$DOTPATH"/cargo/config ~/.cargo/config

PACKAGES="${DOTPATH}/packages/cargo.txt"; readonly PACKAGES

for package in `cat "$PACKAGES"`; do
  cargo install "$package"
done
