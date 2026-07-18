#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_8_linear_solution_theory.md" \
  "chapter_8_linear_solution_theory" \
  "Chapter 8 - Linear Solution Theory" \
  "Theory Of Linear ODE Solutions"
