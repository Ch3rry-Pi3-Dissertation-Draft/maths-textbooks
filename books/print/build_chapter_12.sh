#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_12_variation_of_parameters.md" \
  "chapter_12_variation_of_parameters" \
  "Chapter 12 - Variation Of Parameters" \
  "Variation Of Parameters"
