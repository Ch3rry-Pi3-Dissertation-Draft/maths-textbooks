#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_31_introduction_partial_differential_equations.md" \
  "chapter_31_introduction_partial_differential_equations" \
  "Chapter 31 - Introduction To Partial Differential Equations" \
  "Introduction To Partial Differential Equations"
