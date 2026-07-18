#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_16_matrix_exponential.md" \
  "chapter_16_matrix_exponential" \
  "Chapter 16 - The Matrix Exponential" \
  "The Matrix Exponential"
