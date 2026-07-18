#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_10_nth_order_constant_coefficients.md" \
  "chapter_10_nth_order_constant_coefficients" \
  "Chapter 10 - Higher-Order Constant-Coefficient Equations" \
  "Higher-Order Constant-Coefficient ODEs"
