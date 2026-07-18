#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_7_applications_first_order_equations.md" \
  "chapter_7_applications_first_order_equations" \
  "Chapter 7 - First-Order Applications" \
  "Applications Of First-Order Equations"
