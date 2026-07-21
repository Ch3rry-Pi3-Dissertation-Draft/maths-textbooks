#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_26_matrix_solution_methods.md" \
  "chapter_26_matrix_solution_methods" \
  "Chapter 26 - Matrix Solution Methods" \
  "Matrix Solution Methods"
