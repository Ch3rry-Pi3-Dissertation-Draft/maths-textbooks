#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_28_frobenius_regular_singular_points.md" \
  "chapter_28_frobenius_regular_singular_points" \
  "Chapter 28 - Frobenius Series" \
  "Frobenius Series"
