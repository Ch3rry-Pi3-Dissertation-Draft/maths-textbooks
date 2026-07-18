#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_6_linear_first_order_equations.md" \
  "chapter_6_linear_first_order_equations" \
  "Chapter 6 - Linear First-Order ODEs" \
  "Linear First-Order Equations"
