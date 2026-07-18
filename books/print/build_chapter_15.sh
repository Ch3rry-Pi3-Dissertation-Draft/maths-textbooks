#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_15_matrices.md" \
  "chapter_15_matrices" \
  "Chapter 15 - Matrices" \
  "Matrices"
