#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/../assets/chapter_24/generate_figures.sh"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_24_laplace_differential_equations.md" \
  "chapter_24_laplace_differential_equations" \
  "Chapter 24 - Laplace ODE Methods" \
  "Laplace ODE Methods"
