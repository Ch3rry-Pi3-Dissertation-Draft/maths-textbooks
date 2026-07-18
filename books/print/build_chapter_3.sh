#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_3_classifying_first_order_equations.md" \
  "chapter_3_classifying_first_order_equations" \
  "Chapter 3 - Classifying First-Order Equations" \
  "Classifying First-Order Equations"
