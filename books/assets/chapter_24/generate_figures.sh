#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

pdflatex \
  -interaction=nonstopmode \
  -halt-on-error \
  -output-directory="$WORK_DIR" \
  "$SCRIPT_DIR/figures.tex" >/dev/null

pdftoppm \
  -png \
  -r 180 \
  "$WORK_DIR/figures.pdf" \
  "$SCRIPT_DIR/chapter_24_figure" >/dev/null
