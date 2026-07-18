#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_5_exact_first_order_equations.md" \
  "chapter_5_exact_first_order_equations" \
  "Chapter 5 - Exact First-Order Equations" \
  "Exact First-Order Equations"
