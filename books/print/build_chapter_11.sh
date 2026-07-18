#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_11_undetermined_coefficients.md" \
  "chapter_11_undetermined_coefficients" \
  "Chapter 11 - The Method Of Undetermined Coefficients" \
  "The Method Of Undetermined Coefficients"
