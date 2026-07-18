#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/../assets/chapter_18/generate_figures.sh"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_18_graphical_numerical_methods.md" \
  "chapter_18_graphical_numerical_methods" \
  "Chapter 18 - Graphical And Numerical Methods" \
  "Graphical And Numerical Methods"
