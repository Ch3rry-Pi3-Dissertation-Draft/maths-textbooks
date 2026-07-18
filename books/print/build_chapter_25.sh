#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/../assets/chapter_25/generate_figures.sh"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_25_laplace_systems.md" \
  "chapter_25_laplace_systems" \
  "Chapter 25 - Laplace System Methods" \
  "Laplace System Methods"
