#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/../assets/chapter_20/generate_figures.sh"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_20_second_order_numerical_methods.md" \
  "chapter_20_second_order_numerical_methods" \
  "Chapter 20 - Second-Order Numerical Methods" \
  "Second-Order Numerical Methods"
