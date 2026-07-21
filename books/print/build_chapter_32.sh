#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_32_classification_characteristics.md" \
  "chapter_32_classification_characteristics" \
  "Chapter 32 - Classification And Characteristic Coordinates" \
  "Classification And Characteristic Coordinates"
