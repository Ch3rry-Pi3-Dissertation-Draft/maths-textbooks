#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_4_separable_first_order_equations.md" \
  "chapter_4_separable_first_order_equations" \
  "Chapter 4 - Separable First-Order Equations" \
  "Separable First-Order Equations"
