#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_34_difference_equations_discrete_models.md" \
  "chapter_34_difference_equations_discrete_models" \
  "Chapter 34 - Difference Equations And Discrete Models" \
  "Difference Equations And Discrete Models"
