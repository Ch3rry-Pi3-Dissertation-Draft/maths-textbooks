#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_9_second_order_constant_coefficients.md" \
  "chapter_9_second_order_constant_coefficients" \
  "Chapter 9 - Second-Order Constant-Coefficient Equations" \
  "Second-Order Constant-Coefficient ODEs"
