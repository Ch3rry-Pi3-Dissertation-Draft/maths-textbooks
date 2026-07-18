#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/../assets/chapter_23/generate_figures.sh"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_23_unit_steps_translation_convolution.md" \
  "chapter_23_unit_steps_translation_convolution" \
  "Chapter 23 - Steps And Convolution" \
  "Steps And Convolution"
