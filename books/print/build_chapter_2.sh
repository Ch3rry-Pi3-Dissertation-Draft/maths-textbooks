#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_2_models_qualitative_reasoning.md" \
  "chapter_2_models_qualitative_reasoning" \
  "Chapter 2 - Modelling And Qualitative Reasoning" \
  "Modelling And Qualitative Reasoning"
