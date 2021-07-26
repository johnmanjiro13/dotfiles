#!/bin/bash

mkdir -p ~/.cargo

ln -sf "$DOTPATH"/cargo/config ~/.cargo/config

PACKAGES="${DOTPATH}/packages/cargo.txt"

for package in `cat "$PACKAGES"`; do
  cargo install "$package"
done

PACKAGES="${DOTPATH}/packages/rustup.txt"

for package in `cat "$PACKAGES"`; do
  rustup component add clippy
done
