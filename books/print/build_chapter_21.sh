#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/../assets/chapter_21/generate_figures.sh"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_21_laplace_transform.md" \
  "chapter_21_laplace_transform" \
  "Chapter 21 - The Laplace Transform" \
  "The Laplace Transform"
