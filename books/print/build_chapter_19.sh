#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/../assets/chapter_19/generate_figures.sh"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_19_further_numerical_methods.md" \
  "chapter_19_further_numerical_methods" \
  "Chapter 19 - Further Numerical Methods" \
  "Further Numerical Methods"
