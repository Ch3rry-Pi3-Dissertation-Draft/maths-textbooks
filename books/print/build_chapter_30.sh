#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_30_gamma_bessel_functions.md" \
  "chapter_30_gamma_bessel_functions" \
  "Chapter 30 - Gamma And Bessel Functions" \
  "Gamma And Bessel Functions"
